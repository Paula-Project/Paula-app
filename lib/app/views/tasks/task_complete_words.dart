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

class TaskCompleteWords extends StatefulWidget {
  final LessonControllerInterface lessonController;
  final TaskCompleteWordModel task;
  final TaskCompleteWordController taskController;

  TaskCompleteWords({
    Key? key,
    required this.lessonController,
    required this.task,
    required this.taskController,
  }) : super(key: key);

  @override
  State<TaskCompleteWords> createState() => _TaskCompleteWordsState();
}

class _TaskCompleteWordsState extends State<TaskCompleteWords>
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
 

  Widget noDraggableLetter(letter, word) => Container(
        width: 20,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color.fromRGBO(209, 220, 221, 1),
        ),
        child: Center(
          child: AutoSizeText(
            letter,
            textAlign: TextAlign.center,
            textScaleFactor: 1,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget target(int numList, bool accepted, String word) => DragTarget<String>(
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            width: 35,
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color.fromRGBO(37, 85, 124, 1),
            ),
            child: accepted == true
                ? noDraggableLetter(
                    widget.taskController.vowelsSelected[numList], word)
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
        _widgets.add(target(count, false, word));
        count = count + 1;
        widget.taskController.vowelsSelected.add('');
      } else {
        _widgets.add(noDraggableLetter(letter, word));
      }
    }
    print("makeword: $_widgets");
    return _widgets;
  }

  @override
  Widget build(BuildContext context) {
    return TaskLayout(
      shouldPop: true,
      taskProgress: TaskProgress(
                tasksNumber: widget.lessonController.getTaskQuantity(),
                correctAnswer:
                    widget.lessonController.getTaskCorrectAnswers(),
              ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TaskTitle(
                title: widget.task.title,
                audio: widget.task.audio,
                audioManager: audioManager
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(209, 220, 221, 1),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: widget.task.words
                      .map(
                        (word) => Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: MaterialButton(
                            onPressed: (() {
                              audioManager.runAudio(
                                  "audios/words/${word.soundPath}");
                            }),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8.0),
                                      child: Image.asset(
                                          'assets/images/words/${word.imagePath}'),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: makeWord(word.text),
                                    ),
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
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.task.lessonVowels
                        .map((vowel) => LetterBox(vowel))
                        .toList()),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: SizedBox(
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
                    widget.taskController.makeAnswers(widget.task);

                    isCorrect =
                        widget.taskController.verifyAnswer();
                    widget.lessonController
                        .verifyAnswerNonControlled(isCorrect);
                    widget.taskController.reset();
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
                      transitionBuilder: (context, a1, a2, widget) {
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
                                feedback: isCorrect,
                                resposta:
                                    '${this.widget.task.words[0].text.toUpperCase()} '
                                    '/ ${this.widget.task.words[1].text.toUpperCase()} '
                                    '/ ${this.widget.task.words[2].text.toUpperCase()}'),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
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
        width: 50,
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
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
