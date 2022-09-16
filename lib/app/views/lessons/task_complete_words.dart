import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lesson_controller.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/components/task_progress.dart';

import '../../controllers/task_complete_word_controller.dart';
import '../../model/task_complete_word_model.dart';

class TaskCompleteWords extends StatefulWidget {
  final LessonController lessonController;
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

class _TaskCompleteWordsState extends State<TaskCompleteWords> {
  @override
  bool isCorrect = false;
  int count = 0;

  Widget NoDraggableLetter(letter) => Container(
        width: MediaQuery.of(context).size.width * 0.14,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromRGBO(209, 220, 221, 1),
        ),
        child: Text(
          letter,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget Target(int numList, bool accepted) => DragTarget<String>(
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.14,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromRGBO(37, 85, 124, 1),
              ),
              child: accepted == true
                  ? NoDraggableLetter(
                      widget.taskController.vowelsSelected[numList])
                  : LetterBox(''),
            ),
          );
        },
        onAccept: (letter) {
          accepted = true;
          widget.taskController.addVowelSelected(numList, letter);
        },
        onWillAccept: (letter) {
          return true;
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          child: Column(
            children: [
              TaskProgress(
                tasksNumber: widget.lessonController.getTaskQuantity(),
                correctAnswer: widget.lessonController.getTaskCorrectAnswers(),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(37, 85, 124, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.task.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(209, 220, 221, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.task.words
                        .map(
                          (word) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height*0.1,
                                    child: Image.asset(
                                        'assets/images/words/${word.imagePath}'),
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: makeWord(word.text),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList()),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.task.lessonVowels
                      .map((vowel) => LetterBox(vowel))
                      .toList()),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.06,
                      width: 150.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide.none))),
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('Confirmar',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        onPressed: () {
                          widget.taskController.makeAnswers(widget.task);

                          if (widget.taskController.verifyAnswer()) {
                            isCorrect = true;
                            widget.lessonController
                                .verifyAnswerNonControlled();
                          }
                          widget.taskController.reset();
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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

    return _widgets;
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
      margin: const EdgeInsets.only(top: 5),
        width: MediaQuery.of(context).size.width * 0.14,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromRGBO(37, 85, 124, 1),
        ),
        child: Text(
          letter,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
