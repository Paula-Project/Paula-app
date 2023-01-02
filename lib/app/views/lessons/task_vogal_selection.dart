import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lesson_controller_interface.dart';
import 'package:paula/app/controllers/task_vogal_selection_controller.dart';
import 'package:paula/app/model/task_vogal_selection_model.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/components/SelectLetterButton.dart';
import 'package:paula/app/views/components/exitDialog.dart';
import 'package:paula/app/views/components/audioManager.dart';
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

class _TaskVogalSelectionState extends State<TaskVogalSelection>
    with WidgetsBindingObserver {
  bool isCorrect = false;
  bool statusResolved = false;
  AudioManager audioManager = AudioManager();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    audioManager.runAudio("audios/paula/${widget.task.audio}");
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
                const SizedBox(height: 20.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: MaterialButton(
                          onPressed: () {
                            audioManager
                                .runAudio("audios/paula/${widget.task.audio}");
                          },
                          child: Stack(children: [
                            Container(
                              height: 100.0,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(37, 85, 124, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(28.0),
                                  child: AutoSizeText(
                                    "SELECIONE APENAS AS VOGAIS",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                      decoration: TextDecoration.none,
                                    ),
                                    minFontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 10,
                              bottom: 10,
                              child: Icon(
                                Icons.spatial_audio_off_sharp,
                                color: Colors.white,
                              ),
                            )
                          ]),
                        ),
                      ),
                      Column(
                          children: widget.task.words
                              .map((word) => MaterialButton(
                                    onPressed: (() {
                                      audioManager.runAudio(
                                          "audios/words/${word.soundPath}");
                                    }),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.27,
                                      margin:
                                          const EdgeInsets.only(bottom: 20.0),
                                      decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 194, 197, 199),
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
                                                      letter:
                                                          String.fromCharCode(
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
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  widget.task.vogaisSelecionadas.isEmpty
                                      ? MaterialStateProperty.all<Color>(
                                          Colors.grey)
                                      : MaterialStateProperty.all<Color>(
                                          Colors.blue),
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
                                            feedback:
                                                this.widget.task.isCorrect,
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
      ),
    );
  }
}
