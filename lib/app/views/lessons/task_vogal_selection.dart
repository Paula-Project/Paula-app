import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lesson_controller.dart';
import 'package:paula/app/controllers/task_vogal_selection_controller.dart';
import 'package:paula/app/model/task_vogal_selection_model.dart';
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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 50.0, left: 15.0, right: 15.0),
            child: Column(
              children: [
                TaskProgress(
                  tasksNumber: widget.lessonController.getTaskQuantity(),
                  correctAnswer: widget.lessonController.getTaskCorrectAnswers(),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.13,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(37, 85, 124, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "SELECIONE AS VOGAIS ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
                      Column(
                          children: widget.task.words
                              .map(
                                (word) => Padding(
                                  padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.25,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 194, 197, 199),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(
                                              bottom: MediaQuery.of(context).size.height*0.02, top: 12.0),
                                          child: Container(
                                              height: MediaQuery.of(context).size.height*0.1,
                                              child: Image.asset(
                                                  'assets/images/words/${word.imagePath}')),
                                        ),
                                        Expanded(child: Row(
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
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.04,
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
                            widget.taskController.makeAnswers(widget.task),
                            debugPrint(widget.taskController.vogaisSelecionadas
                                .toString()),
                            debugPrint(
                                widget.taskController.wordsCorrect.toString()),
                            isCorrect = widget.taskController.verifyAnswer(),
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
                                        resposta:
                                            '${this.widget.task.words[0].text.toUpperCase()} '
                                            '/ ${this.widget.task.words[1].text.toUpperCase()} '),
                                  ),
                                );
                              },
                            )
                          },
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text('Confirmar',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            )),
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
      height: MediaQuery.of(context).size.height*0.07,
      width: MediaQuery.of(context).size.width*0.07,
      constraints: const BoxConstraints(maxWidth: 40, minHeight: 15,minWidth: 15),
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
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(widget.letter,
          style: const TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}
