import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/exitDialog.dart';
import 'package:paula/app/views/components/taskTitle.dart';
import 'package:paula/app/views/components/task_progress.dart';
import 'package:paula/app/controllers/tasks/task_complete_word_controller.dart';
import 'package:paula/app/model/task_complete_word_model.dart';
import 'package:paula/app/views/layout/task_layout.dart';

class TaskWriteWords extends StatefulWidget {
  final LessonControllerInterface lessonController;
  final TaskCompleteWordModel task;
  final TaskCompleteWordController taskController;

  TaskWriteWords({
    Key? key,
    required this.lessonController,
    required this.task,
    required this.taskController,
  }) : super(key: key);

  @override
  State<TaskWriteWords> createState() => _TaskWriteWordsState();
}

class _TaskWriteWordsState extends State<TaskWriteWords>
    with WidgetsBindingObserver {
  bool isCorrect = false;
  int count = 0;

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

  Widget NoDraggableLetter(letter) => Container(
        width: 35,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color.fromRGBO(209, 220, 221, 1),
        ),
        alignment: Alignment.center,
        child: AutoSizeText(
          letter,
          textAlign: TextAlign.center,
          textScaleFactor: 1,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget Target(int numList, bool accepted) => DragTarget<String>(
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            width: 35,
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color.fromRGBO(37, 85, 124, 1),
            ),
            alignment: Alignment.center,
            child: accepted == true
                ? NoDraggableLetter(
                    widget.taskController.vowelsSelected[numList])
                : LetterBox(''),
          );
        },
        onAccept: (letter) {
          accepted = true;
          widget.taskController.addVowelSelected(numList, letter);
          print("answer: ${widget.taskController.answers}");
          print("vowelSelected: ${widget.taskController.vowelsSelected}");
        },
        onWillAccept: (letter) {
          return true;
        },
      );

  List<Widget> makeWord(word) {
    List<Widget> _widgets = [];
    for (int i = 0; i < word.length; i++) {
      String letter = word[i].toUpperCase();
      if (widget.task.lessonVowels.contains(letter)) {
        _widgets.add(Target(count, false));
        count = count + 1;
        widget.taskController.vowelsSelected.add('');
      } else {
        _widgets.add(NoDraggableLetter(letter));
      }
    }
    print("makeword: $_widgets");
    return _widgets;
  }

  @override
  Widget build(BuildContext context) {
    var LetterList = widget.task.lessonVowels;
    LetterList.sort();
    return TaskLayout(
      shouldPop: true,
      taskProgress: TaskProgress(
        tasksNumber: widget.lessonController.getTaskQuantity(),
        correctAnswer:
            widget.lessonController.getTaskCorrectAnswers(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TaskTitle(title: widget.task.title, audio: widget.task.audio),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(209, 220, 221, 1),
                      borderRadius:
                          BorderRadius.all(Radius.circular(15))),
                  child: Column(
                      children: widget.task.words
                          .map(
                            (word) => MaterialButton(
                              onPressed: (() {
                                audioManager.runAudio(
                                    "audios/words/${word.soundPath}");
                              }),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 90,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0),
                                        child: Image.asset(
                                            'assets/images/words/${word.imagePath}'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                        children: makeWord(word.text),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList()),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Padding(
                    padding:
                        const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                            LetterList.map((vowel) => LetterBox(vowel))
                                .toList()),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                      width: 200,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50.0,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
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
                                widget.taskController
                                    .makeAnswers(widget.task);

                                isCorrect =
                                    widget.taskController.verifyAnswer();
                                widget.lessonController
                                    .verifyAnswerNonControlled(isCorrect);
                                widget.taskController.reset();
                                showGeneralDialog(
                                  barrierColor:
                                      Colors.black.withOpacity(0.5),
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
                                    final curvedValue = Curves.easeInOut
                                            .transform(a1.value) -
                                        1;

                                    return Transform(
                                      transform:
                                          Matrix4.translationValues(0.0,
                                              (curvedValue * -300), 0.0),
                                      child: Opacity(
                                        opacity: a1.value,
                                        child: BoxDialog(
                                            controller: this
                                                .widget
                                                .lessonController,
                                            feedback: isCorrect,
                                            resposta:
                                                '${this.widget.task.words[0].text.toUpperCase()} '),
                                      ),
                                    );
                                  },
                                );
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
    );
  }
}

class LetterBox extends StatelessWidget {
  final String letter;

  LetterBox(this.letter);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: letter,
      feedback: letterCard(context),
      child: letterCard(context),
    );
  }

  Widget letterCard(context) => Container(
        width: 35,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color.fromRGBO(37, 85, 124, 1),
        ),
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5),
        child: AutoSizeText(
          letter,
          textAlign: TextAlign.center,
          textScaleFactor: 1,
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontSize: 38,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
