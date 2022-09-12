import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lesson_controller.dart';
import 'package:paula/app/controllers/task_vogal_selection_controller.dart';
import 'package:paula/app/model/task_vogal_selection_model.dart';
import 'package:paula/app/model/word.dart';
import 'package:paula/app/model/words.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/components/task_progress.dart';

class TaskVogalSelection extends StatefulWidget {
  final TaskVogalSelectionModel task;
  final LessonController lessonController;
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

class _TaskVogalSelectionState extends State<TaskVogalSelection> {
  bool isCorrect = false;
  @override
  void initState() {
    super.initState();
  }

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
          padding: const EdgeInsets.only(
              top: 50.0, bottom: 50.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              TaskProgress(
                tasksNumber: widget.lessonController.getTaskQuantity(),
                correctAnswer: widget.lessonController.getTaskCorrectAnswers(),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        height: 100.0,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(37, 85, 124, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(28.0),
                            child: Text(
                              "SELECIONE AS VOGAIS ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                        children: widget.task.words
                            .map(
                              (word) => Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  height: 200.0,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 194, 197, 199),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 30.0, top: 12.0),
                                        child: Container(
                                            height: 87.0,
                                            child: Image.asset(
                                                'assets/images/words/${word.imagePath}')),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: word.text.runes
                                            .map((letter) => SelectLetterButton(
                                                  letter: String.fromCharCode(
                                                          letter)
                                                      .toUpperCase(),
                                                  onSelected: widget
                                                      .taskController.addVogal,
                                                  onUnselected: widget
                                                      .taskController
                                                      .removeVogal,
                                                ))
                                            .toList(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList()),
                    SizedBox(
                      height: 45.0,
                      width: 200.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide.none))),
                        onPressed: () => {
                          debugPrint(widget.taskController.vogaisSelecionadas
                              .toString()),
                          isCorrect =
                              widget.taskController.verifyAnswer(widget.task),
                          if (isCorrect)
                            {
                              widget.lessonController
                                  .verifyAnswerNonControlled()
                            },
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
                                      feedback: isCorrect,
                                      resposta: ""),
                                ),
                              );
                            },
                          )
                        },
                        child: const Text('Confirmar',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            )),
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
}

class SelectLetterButton extends StatefulWidget {
  final String letter;
  final Function(String) onSelected;
  final Function(String) onUnselected;

  const SelectLetterButton({
    Key? key,
    required this.letter,
    required this.onSelected,
    required this.onUnselected,
  }) : super(key: key);

  @override
  State<SelectLetterButton> createState() => _SelectLetterButtonState();
}

class _SelectLetterButtonState extends State<SelectLetterButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 40,
      margin: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: () => {
          setState(() => {
                isSelected = !isSelected,
                if (isSelected) {widget.onSelected(widget.letter)},
                if (!isSelected) {widget.onUnselected(widget.letter)},
              }),
        },
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.white70,
          primary: Colors.black,
          textStyle: const TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
        ),
        child: Text(widget.letter),
      ),
    );
  }
}
