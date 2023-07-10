import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/controllers/tasks/task_select_image_controller.dart';
import 'package:paula/app/model/task_select_image_model.dart';
import 'package:paula/app/views/components/CardImage.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/taskTitle.dart';
import 'package:paula/app/views/components/task_progress.dart';
import 'package:paula/app/views/layout/task_layout.dart';

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
    return TaskLayout(
      shouldPop: true,
      taskProgress: TaskProgress(
        tasksNumber: widget.lessonController.getTaskQuantity(),
        correctAnswer: widget.lessonController.getTaskCorrectAnswers(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TaskTitle(
                      title: widget.task.title,
                      audio: widget.task.audio,
                      audioManager: audioManager),
                  Wrap(
                    runAlignment: WrapAlignment.spaceBetween,
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: 30,
                    children: widget.task.words
                        .map(
                          (word) => CardImage(
                            imageUrl: "assets/images/words/${word.imagePath}",
                            scale: 5.0,
                            audioUrl: word.soundPath,
                            audioManager: audioManager,
                            isSelected: widget.task.cardSelected == word.text
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
                  SizedBox(
                    height: 50.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: widget.task.cardSelected.isNotEmpty
                              ? MaterialStateProperty.all<Color>(Colors.blue)
                              : MaterialStateProperty.all<Color>(Colors.grey),
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
                        if (widget.task.cardSelected.isNotEmpty) {
                          widget.lessonController
                              .verifyAnswer(widget.task, widget.taskController);
                          showGeneralDialog(
                            barrierColor: Colors.black.withOpacity(0.5),
                            transitionDuration:
                                const Duration(milliseconds: 300),
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
                                      resposta: this.widget.task.answer),
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
      ),
    );
  }
}
