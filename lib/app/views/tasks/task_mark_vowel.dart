import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/controllers/tasks/task_mark_vowel_controller.dart';
import 'package:paula/app/model/task_mark_vowel_model.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/components/CardImage.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/task_progress.dart';
import 'package:paula/app/views/layout/task_layout.dart';

class TaskMarkVowel extends StatefulWidget {
  final LessonControllerInterface lessonController;
  final TaskMarkVowelModel task;
  final TaskMarkVowelController taskController;

  const TaskMarkVowel(
      {Key? key,
      required this.lessonController,
      required this.task,
      required this.taskController})
      : super(key: key);

  @override
  State<TaskMarkVowel> createState() => _TaskMarkVowelState();
}

class _TaskMarkVowelState extends State<TaskMarkVowel>
    with WidgetsBindingObserver {
  AudioManager audioManager = AudioManager();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    audioManager.runAudio(widget.task.audio);
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
                children: [
                  MaterialButton(
                    onPressed: () {
                      audioManager.runAudio(widget.task.audio);
                    },
                    child: Container(
                      height: (MediaQuery.of(context).size.height) * 0.18,
                      width: (MediaQuery.of(context).size.height) * 0.18,
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(37, 85, 124, 1),
                          borderRadius: BorderRadius.all(Radius.circular(17))),
                      child: const FittedBox(
                        child: Icon(Icons.volume_up_outlined),
                      ),
                    ),
                  ),
                  Wrap(
                    runSpacing: 20,
                    spacing: 0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: widget.task.vowels
                        .map(
                          (letter) => CardImage(
                            imageUrl: 'assets/alphabet/${letter.imagePath}',
                            scale: 6.0,
                            audioUrl: letter.soundPath,
                            audioManager: audioManager,
                            isSelected: widget.task.cardSelected == letter.text
                                ? true
                                : false,
                            onPress: () {
                              setState(() {
                                widget.taskController
                                    .selectCard(widget.task, letter.text);
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: widget.task.cardSelected != ""
                                  ? MaterialStateProperty.all<Color>(
                                      Colors.blue)
                                  : MaterialStateProperty.all<Color>(
                                      Colors.grey),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide.none))),
                          child: const Text('VERIFICAR',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )),
                          onPressed: () {
                            if (widget.task.cardSelected != "") {
                              widget.lessonController.verifyAnswer(
                                  widget.task, widget.taskController);
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
                                          controller:
                                              this.widget.lessonController,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
