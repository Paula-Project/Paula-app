import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lesson_controller_interface.dart';
import 'package:paula/app/controllers/task_select_image_controller.dart';
import 'package:paula/app/model/task_select_image_model.dart';
import 'package:paula/app/views/components/CardImage.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/task_progress.dart';
import 'package:paula/app/views/components/exitDialog.dart';

class TaskSelectImage extends StatefulWidget {
  final TaskSelectImageModel task;
  final LessonControllerInterface lessonController;
  final TaskSelectImageController taskController;

  const TaskSelectImage({
    Key? key,
    required this.task,
    required this.lessonController,
    required this.taskController,
  }) : super(key: key);

  @override
  State<TaskSelectImage> createState() => _TaskSelectImageState();
}

class _TaskSelectImageState extends State<TaskSelectImage>
    with WidgetsBindingObserver {
  AudioManager audioManager = AudioManager();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    audioManager.runAudio("audios/paula/${widget.task.audio}");
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    audioManager.stopAudio();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    audioManager.didLifecycleChange(state);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() => exitDialog(context)),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 50.0, bottom: 50.0, left: 15.0, right: 15.0),
            child: Column(
              children: [
                TaskProgress(
                  tasksNumber: widget.lessonController.getTaskQuantity(),
                  correctAnswer:
                      widget.lessonController.getTaskCorrectAnswers(),
                ),
                const SizedBox(height: 5.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          audioManager
                              .runAudio("audios/paula/${widget.task.audio}");
                        },
                        child: Container(
                          height: 100.0,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(37, 85, 124, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                widget.task.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        runSpacing: 50,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: widget.task.words
                            .map(
                              (word) => CardImage(
                                imageUrl:
                                    "assets/images/words/${word.imagePath}",
                                scale: 5.0,
                                audioUrl: word.soundPath,
                                audioManager: audioManager,
                                isSelected:
                                    widget.task.cardSelected == word.text
                                        ? true
                                        : false,
                                onPress: () {
                                  setState(() {
                                    widget.task.cardSelected = word.text;
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        child: SizedBox(
                            width: 200,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50.0,
                                  width: 150.0,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor: widget
                                                .task.cardSelected.isNotEmpty
                                            ? MaterialStateProperty.all<Color>(
                                                Colors.blue)
                                            : MaterialStateProperty.all<Color>(
                                                Colors.grey),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: BorderSide.none))),
                                    child: const Text('VERIFICAR',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    onPressed: () {
                                      if (widget.task.cardSelected.isNotEmpty) {
                                        widget.lessonController.verifyAnswer(
                                            widget.task, widget.taskController);
                                        showGeneralDialog(
                                          barrierColor:
                                              Colors.black.withOpacity(0.5),
                                          transitionDuration:
                                              const Duration(milliseconds: 300),
                                          barrierDismissible: false,
                                          barrierLabel: '',
                                          context: context,
                                          pageBuilder: (context, animation1,
                                              animation2) {
                                            return widget;
                                          },
                                          transitionBuilder:
                                              (context, a1, a2, widget) {
                                            final curvedValue = Curves.easeInOut
                                                    .transform(a1.value) -
                                                1;

                                            return Transform(
                                              transform:
                                                  Matrix4.translationValues(
                                                      0.0,
                                                      (curvedValue * -300),
                                                      0.0),
                                              child: Opacity(
                                                opacity: a1.value,
                                                child: BoxDialog(
                                                    controller: this
                                                        .widget
                                                        .lessonController,
                                                    feedback: this
                                                        .widget
                                                        .task
                                                        .isCorrect,
                                                    resposta: this
                                                        .widget
                                                        .task
                                                        .answer),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
