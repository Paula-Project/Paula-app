import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lesson_controller_interface.dart';
import 'package:paula/app/controllers/task_vogal_selection_controller.dart';
import 'package:paula/app/model/task_vogal_selection_model.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/components/SelectLetterButton.dart';
import 'package:paula/app/views/components/task_progress.dart';

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

class _TaskVogalSelectionState extends State<TaskVogalSelection> {
  bool isCorrect = false;
  bool statusResolved = false;

  AudioPlayer? audioPlayer;
  _runAudio(String path) async {
    try {
      await audioPlayer?.play(AssetSource(path));
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    _runAudio("audios/paula/selecionaAsVogais.mp4");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatus(String status) {}

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
                      child: MaterialButton(
                        onPressed: () {
                          _runAudio("audios/paula/selecionaAsVogais.mp4");
                        },
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
                                "SELECIONE AS VOGAIS",
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
                    ),
                    Column(
                        children: widget.task.words
                            .map((word) => MaterialButton(
                                  onPressed: (() {
                                    _runAudio("audios/words/${word.soundPath}");
                                  }),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.27,
                                    margin: const EdgeInsets.only(bottom: 20.0),
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 194, 197, 199),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              .map((letter) =>
                                                  SelectLetterButton(
                                                    statusResolved:
                                                        statusResolved,
                                                    task: widget.task,
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
                      width: 150.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: widget
                                    .task.vogaisSelecionadas.isEmpty
                                ? MaterialStateProperty.all<Color>(Colors.grey)
                                : MaterialStateProperty.all<Color>(Colors.blue),
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
      ),
    );
  }
}
