import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lesson_controller_interface.dart';
import 'package:paula/app/views/components/CardImage.dart';
import 'package:paula/app/views/components/exitDialog.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/task_progress.dart';
import '../../controllers/task_mark_vowel_controller.dart';
import '../../model/task_mark_vowel_model.dart';
import '../components/BoxDialog.dart';

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
                const SizedBox(height: 00.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          audioManager.runAudio(widget.task.audio);
                        },
                        child: Container(
                          height: (MediaQuery.of(context).size.height) * 0.17,
                          width: (MediaQuery.of(context).size.width) * 0.38,
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(37, 85, 124, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: const FittedBox(
                            child: Icon(Icons.volume_up_outlined),
                          ),
                        ),
                      ),
                      Wrap(
                        runSpacing: 50,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: widget.task.vowels
                            .map(
                              (letter) => CardImage(
                                imageUrl: 'assets/alphabet/${letter.imagePath}',
                                scale: 5.0,
                                audioUrl: letter.soundPath,
                                audioManager: audioManager,
                                isSelected:
                                    widget.task.cardSelected == letter.text
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
                            width: 150.0,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<
                                      Color>(Colors.white),
                                  backgroundColor:
                                      widget.task.cardSelected != ""
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
                                    pageBuilder:
                                        (context, animation1, animation2) {
                                      return widget;
                                    },
                                    transitionBuilder:
                                        (context, a1, a2, widget) {
                                      final curvedValue =
                                          Curves.easeInOut.transform(a1.value) -
                                              1;

                                      return Transform(
                                        transform: Matrix4.translationValues(
                                            0.0, (curvedValue * -300), 0.0),
                                        child: Opacity(
                                          opacity: a1.value,
                                          child: BoxDialog(
                                              controller:
                                                  this.widget.lessonController,
                                              feedback:
                                                  this.widget.task.isCorrect,
                                              resposta:
                                                  this.widget.task.answer),
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
        ),
      ),
    );
  }
}
