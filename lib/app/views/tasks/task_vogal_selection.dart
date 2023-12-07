import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/controllers/tasks/task_vogal_selection_controller.dart';
import 'package:paula/app/model/task_vogal_selection_model.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/components/SelectLetterButton.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/taskTitle.dart';
import 'package:paula/app/views/components/task_progress.dart';
import 'package:paula/app/views/layout/task_layout.dart';

class TaskVogalSelection extends StatefulWidget {
  final TaskVogalSelectionModel task;
  final LessonControllerInterface lessonController;
  final TaskVogalSelectionController taskController;
  const TaskVogalSelection(
      {Key? key,
      required this.lessonController,
      required this.taskController,
      required this.task})
      : super(key: key);

  @override
  State<TaskVogalSelection> createState() => _TaskVogalSelectionState();
}

class _TaskVogalSelectionState extends State<TaskVogalSelection>
    with WidgetsBindingObserver {
  bool isCorrect = false;
  bool statusResolved = false;

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
    changeStatus(String status) {}

    return TaskLayout(
      lessonController: widget.lessonController,
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
                  TaskTitle(
                      title: "SELECIONE APENAS AS VOGAIS",
                      audio: widget.task.audio,
                      audioManager: audioManager),
                  Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: widget.task.words
                          .map((word) => Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 194, 197, 199),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: MaterialButton(
                                  onPressed: (() {
                                    audioManager.runAudio(
                                        "audios/words/${word.soundPath}");
                                  }),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 87,
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Image.asset(
                                              'assets/images/words/${word.imagePath}')),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: word.text.runes
                                            .map((letter) => SelectLetterButton(
                                                  statusResolved:
                                                      statusResolved,
                                                  task: widget.task,
                                                  word: word.text,
                                                  letter: String.fromCharCode(
                                                          letter)
                                                      .toUpperCase(),
                                                  addVogal: () => {
                                                    setState(() {
                                                      widget.task.addVogal(
                                                          String.fromCharCode(
                                                                  letter)
                                                              .toUpperCase());
                                                    })
                                                  },
                                                  removeVogal: () => {
                                                    setState(() {
                                                      widget.task.removeVogal(
                                                          String.fromCharCode(
                                                                  letter)
                                                              .toUpperCase());
                                                    })
                                                  },
                                                ))
                                            .toList(),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList()),
                  SizedBox(
                    height: 50.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white),
                          backgroundColor: widget
                                  .task.vogaisSelecionadas.isEmpty
                              ? MaterialStateProperty.all<Color>(Colors.grey)
                              : MaterialStateProperty.all<Color>(Colors.blue),
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
                      onPressed: () => {
                        if (widget.task.vogaisSelecionadas.isNotEmpty)
                          {
                            widget.lessonController.verifyAnswer(
                                widget.task, widget.taskController),
                            setState(() {
                              statusResolved = true;
                            }),
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
                                        resposta: ''),
                                  ),
                                );
                              },
                            )
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
