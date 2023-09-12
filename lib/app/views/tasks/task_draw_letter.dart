import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/drawing/drawing_point.dart';
import 'package:paula/app/views/components/taskTitle.dart';
import 'package:paula/app/views/components/task_progress.dart';
import 'package:paula/app/views/layout/task_layout.dart';

class DrawingBoard extends StatefulWidget {
  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard>
    with WidgetsBindingObserver {
  Color selectedColor = Colors.red;
  double strokeWidth = 5;
  List<dynamic> drawingPoints = [];
  AudioManager audioManager = AudioManager();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    audioManager.stopAudio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TaskLayout(
      shouldPop: false,
      taskProgress: const TaskProgress(tasksNumber: 5, correctAnswer: 4),
      body: Column(
        children: [
          TaskTitle(
              title: "Escreva a Letra A no espaço abaixo:",
              audio: "assets/audios/vogal_selection.mp3",
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
                      onPressed: () => setState(() => drawingPoints = []),
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
                        backgroundColor: /*widget.task.cardSelected.isNotEmpty
                            ? */
                            MaterialStateProperty.all<Color>(Colors.blue)
                        /*: MaterialStateProperty.all<Color>(Colors.grey),
                        */
                        ,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide.none))),
                    child: const Text('VERIFICAR',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                    onPressed: () {
                      /*
                      if (widget.task.cardSelected.isNotEmpty) {
                        widget.lessonController
                            .verifyAnswer(widget.task, widget.taskController);
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
                              child:
                                  Opacity(opacity: a1.value, child: Container()),
                            );
                          },
                        );
                      }
                    */
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
            PointMode.points,
            offsetsList,
            drawingPoints[i].paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
