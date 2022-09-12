import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lesson_controller.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/components/task_progress.dart';


class TaskCompleteWords extends StatefulWidget {
  final LessonController lessonController;

  const TaskCompleteWords({Key? key, required this.lessonController})
      : super(key: key);

  @override
  State<TaskCompleteWords> createState() => _TaskCompleteWordsState();
}

class _TaskCompleteWordsState extends State<TaskCompleteWords> {
  @override
  final List<String> _gabarito = ['O', 'A', 'A', 'A', 'E', 'A'];
  List<String> _vogaisSelecionadas = ['', '', '', '', '', ''];
  bool isCorrect = false;

  Widget NoDraggableLetter(letter) =>
      Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.14,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.08,
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

  Widget Target(int numLista, bool accepted, gab) =>
      DragTarget<String>(
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.14,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.06,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromRGBO(37, 85, 124, 1),
              ),
              child: accepted == true ? NoDraggableLetter(gab) : LetterBox(''),
            ),
          );
        },
        onAccept: (letter) {
          gab = letter;
          accepted = true;
          _vogaisSelecionadas[numLista] = letter;
        },
        onWillAccept: (letter) {
          return true;
        },
      );

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 15.0),
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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.1,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(37, 85, 124, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Complete as palavras:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(209, 220, 221, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 120,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Image.asset(
                                      'assets/images/words/bola.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    NoDraggableLetter('B'),
                                    Target(0, false, _vogaisSelecionadas[0]),
                                    NoDraggableLetter('L'),
                                    Target(1, false, _vogaisSelecionadas[1]),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 120,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Image.asset(
                                      'assets/images/words/lata.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    NoDraggableLetter('L'),
                                    Target(2, false, _vogaisSelecionadas[2]),
                                    NoDraggableLetter('T'),
                                    Target(3, false, _vogaisSelecionadas[3]),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 120,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Image.asset(
                                      'assets/images/words/seta.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    NoDraggableLetter('S'),
                                    Target(4, false, _vogaisSelecionadas[4]),
                                    NoDraggableLetter('T'),
                                    Target(5, false, _vogaisSelecionadas[5]),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LetterBox('A'),
                    LetterBox('E'),
                    LetterBox('O'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: Container(
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
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide.none))),
                            child: const Text('VERIFICAR',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                )),
                            onPressed: () {
                              if (verifyAnswer()) {
                                isCorrect = true;
                                widget.lessonController
                                    .verifyAnswerNonControlled();
                              }
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
                                          resposta: ""),
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
      ),
    );
  }

  bool verifyAnswer() {
    print(_vogaisSelecionadas);
    print(_gabarito);

    for (int i = 0; i < _gabarito.length; i++) {
      if (_vogaisSelecionadas[i] != _gabarito[i]) {
        return false;
      }
    }

    return true;
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

class Target extends StatelessWidget {
  const Target({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
