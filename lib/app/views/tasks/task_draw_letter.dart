import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/controllers/tasks/task_draw_letter_controller.dart';
import 'package:paula/app/controllers/web/ia_controller.dart';
import 'package:paula/app/controllers/web/network_controller.dart';
import 'package:paula/app/model/task_draw_letter_model.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/drawing/drawing_point.dart';
import 'package:paula/app/views/components/taskTitle.dart';
import 'package:paula/app/views/components/task_progress.dart';
import 'package:paula/app/views/layout/task_layout.dart';

class TaskDrawLetter extends StatefulWidget {
  final LessonControllerInterface lessonController;
  final TaskDrawLetterModel task;
  final TaskDrawLetterController taskController;
  const TaskDrawLetter(
      {super.key,
      required this.lessonController,
      required this.task,
      required this.taskController});

  @override
  _TaskDrawLetterState createState() => _TaskDrawLetterState();
}

class _TaskDrawLetterState extends State<TaskDrawLetter>
    with WidgetsBindingObserver {
  NetworkController networkController = Get.find<NetworkController>();
  Color selectedColor = Colors.black;
  double strokeWidth = 10;
  List<dynamic> drawingPoints = [];
  AudioManager audioManager = AudioManager();
  final loading = ValueNotifier<bool>(false);
  bool hasTouched = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    networkController.checkConnectionStatus();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    audioManager.stopAudio();
    networkController.clearConnectionStatus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TaskLayout(
      lessonController: widget.lessonController,
      shouldPop: true,
      taskProgress: TaskProgress(
        tasksNumber: widget.lessonController.getTaskQuantity(),
        correctAnswer: widget.lessonController.getTaskCorrectAnswers(),
      ),
      body: Column(
        children: [
          TaskTitle(
              title: widget.task.title,
              audio: widget.task.titleAudio,
              audioManager: audioManager),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onPanStart: (details) {
                    setState(() {
                      drawingPoints.add(
                        DrawingPoint(
                          details.localPosition,
                          Paint()
                            ..color = selectedColor
                            ..isAntiAlias = true
                            ..strokeWidth = strokeWidth
                            ..strokeCap = StrokeCap.round,
                        ),
                      );
                    });
                    hasTouched = true;
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      drawingPoints.add(
                        DrawingPoint(
                          details.localPosition,
                          Paint()
                            ..color = selectedColor
                            ..isAntiAlias = true
                            ..strokeWidth = strokeWidth
                            ..strokeCap = StrokeCap.round,
                        ),
                      );
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      drawingPoints.add(null);
                    });
                  },
                  behavior: HitTestBehavior.deferToChild,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: CustomPaint(
                      painter: _DrawingPainter(
                          drawingPoints,
                          MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height / 2),
                      child: Container(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 244, 67, 54)),
                      ),
                      onPressed: () {
                        setState(() => drawingPoints = []);
                        hasTouched = false;
                      },
                      icon: const Icon(Icons.clear),
                      label: const Text("Limpar"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: hasTouched
                            ? MaterialStateProperty.all<Color>(Colors.blue)
                            : MaterialStateProperty.all<Color>(Colors.grey),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide.none))),
                    child: AnimatedBuilder(
                        animation: loading,
                        builder: (context, snapshot) {
                          return loading.value
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                              : const Text('VERIFICAR',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ));
                        }),
                    onPressed: () async {
                      if (hasTouched) {
                        Uint8List? imageBytes =
                            await DrawingToImage.convertToImage(
                                drawingPoints,
                                MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height / 2);
                        loading.value = !loading.value;
                        var response =
                            await IAController().verifyAnswer(imageBytes);
                        loading.value = !loading.value;
                        widget.task.response = response;
                        widget.lessonController
                            .verifyAnswer(widget.task, widget.taskController);
                        // ignore: use_build_context_synchronously
                        showGeneralDialog(
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: const Duration(milliseconds: 300),
                          barrierDismissible: false,
                          barrierLabel: '',
                          context: context,
                          pageBuilder: (context, animation1, animation2) {
                            return widget;
                          },
                          transitionBuilder: (context, a1, a2, widget) {
                            final curvedValue =
                                Curves.easeInOut.transform(a1.value) - 1;

                            return Transform(
                              transform: Matrix4.translationValues(
                                  0.0, (curvedValue * -300), 0.0),
                              child: Opacity(
                                opacity: a1.value,
                                child: BoxDialog(
                                    controller: this.widget.lessonController,
                                    feedback: this.widget.task.isCorrect,
                                    resposta: this.widget.task.isCorrect
                                        ? ""
                                        : "Letra ${this.widget.task.letter}\n e você escreveu a Letra ${this.widget.task.response}"),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<dynamic> drawingPoints;
  final double limitedWidth;
  final double limitedHeight;

  _DrawingPainter(this.drawingPoints, this.limitedWidth, this.limitedHeight);

  List<Offset> offsetsList = [];

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)),
      Paint()..color = Colors.white,
    );
    for (int i = 0; i < drawingPoints.length - 1; i++) {
      if (drawingPoints[i] != null && drawingPoints[i + 1] != null) {
        // Verifique se os pontos de desenho estão dentro das dimensões limitadas
        if (drawingPoints[i].offset.dx >= 0 &&
            drawingPoints[i].offset.dx <= limitedWidth &&
            drawingPoints[i].offset.dy >= 0 &&
            drawingPoints[i].offset.dy <= limitedHeight &&
            drawingPoints[i + 1].offset.dx >= 0 &&
            drawingPoints[i + 1].offset.dx <= limitedWidth &&
            drawingPoints[i + 1].offset.dy >= 0 &&
            drawingPoints[i + 1].offset.dy <= limitedHeight) {
          canvas.drawLine(
            drawingPoints[i].offset,
            drawingPoints[i + 1].offset,
            drawingPoints[i].paint,
          );
        }
      } else if (drawingPoints[i] != null && drawingPoints[i + 1] == null) {
        if (drawingPoints[i].offset.dx >= 0 &&
            drawingPoints[i].offset.dx <= limitedWidth &&
            drawingPoints[i].offset.dy >= 0 &&
            drawingPoints[i].offset.dy <= limitedHeight) {
          offsetsList.clear();
          offsetsList.add(drawingPoints[i].offset);

          canvas.drawPoints(
            ui.PointMode.points,
            offsetsList,
            drawingPoints[i].paint,
          );
        }
      }
    }
    _DrawingPainter(this.drawingPoints, this.limitedWidth, this.limitedHeight);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingToImage {
  static Future<Uint8List?> convertToImage(List<dynamic> drawingPoints,
      double limitedWidth, double limitedHeight) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder,
        Rect.fromPoints(Offset(0, 0), Offset(limitedWidth, limitedHeight)));

    final painter = _DrawingPainter(drawingPoints, limitedWidth, limitedHeight);
    painter.paint(canvas, Size(limitedWidth, limitedHeight));

    final picture = recorder.endRecording();
    final img = await picture.toImage(
      limitedWidth.toInt(),
      limitedHeight.toInt(),
    );
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    if (byteData != null) {
      return byteData.buffer.asUint8List();
    } else {
      return null;
    }
  }
}

class ImageSaver {
  static Future<String> saveImage(Uint8List imageBytes) async {
    final directory =
        await getExternalStorageDirectory(); // Ou use getApplicationDocumentsDirectory() para um diretório interno ao aplicativo.
    final imagePath =
        '${directory!.path}/Letras/${DateTime.now().hashCode}.png';

    final newDirectory = Directory('${directory.path}/Letras');
    if (!(await newDirectory.exists())) {
      // Verifica se a pasta não existe e a cria se necessário
      newDirectory.create(recursive: true).then((Directory newDirectory) {
        print('Pasta criada: ${newDirectory.path}');
        final imageFile = File(imagePath);
        imageFile.writeAsBytesSync(
            imageBytes); // Salva o arquivo na pasta recém-criada
        print('Arquivo salvo em: $imagePath');
      });
    } else {
      final imageFile = File(imagePath);
      imageFile
          .writeAsBytesSync(imageBytes); // Salva o arquivo na pasta existente
      print('Arquivo salvo em: $imagePath');
    }
    return imagePath;
  }
}
