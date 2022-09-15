import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lesson_controller.dart';
import 'package:paula/app/views/components/CardImage.dart';
import 'package:paula/app/views/components/task_progress.dart';
import '../../controllers/task_mark_vowel_controller.dart';
import '../../model/task_mark_vowel_model.dart';
import '../components/BoxDialog.dart';

class TaskMarkVowel extends StatefulWidget {
  final LessonController lessonController;
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

class _TaskMarkVowelState extends State<TaskMarkVowel> {
  AudioPlayer? audioPlayer;
  var cardSelected = 0;
  bool isCorrect = false;

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
                    MaterialButton(
                      onPressed: () {
                        _runAudio(widget.task.audio);
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
                      children: [
                        for (int i = 0; i < widget.task.vowels.length; i++)
                          CardImage(
                            imageUrl:
                                'assets/alphabet/${widget.task.vowels[i].imagePath}',
                            scale: 5.0,
                            audioUrl: widget.task.vowels[i].soundPath,
                            isSelected: cardSelected == i + 1 ? true : false,
                            onPress: () {
                              setState(() {
                                cardSelected = i + 1;
                                widget.taskController.markVowel(cardSelected);
                              });
                            },
                          ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       children: <Widget>[
                    //         CardImage(
                    //           imageUrl: 'assets/alphabet/${widget.task.title}',
                    //           scale: 5.0,
                    //           audioUrl: '',
                    //           isSelected: cardSelected == 1 ? true : false,
                    //           onPress: () {
                    //             setState(() {
                    //               cardSelected = 1;
                    //             });
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //     Column(
                    //       children: <Widget>[
                    //         CardImage(
                    //           imageUrl: 'assets/alphabet/letter-e.png',
                    //           audioUrl: '',
                    //           scale: 5.0,
                    //           isSelected: cardSelected == 2 ? true : false,
                    //           onPress: () {
                    //             setState(() {
                    //               cardSelected = 2;
                    //             });
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       children: [
                    //         CardImage(
                    //           imageUrl: 'assets/alphabet/letter-i.png',
                    //           audioUrl: '',
                    //           scale: 5.0,
                    //           isSelected: cardSelected == 3 ? true : false,
                    //           onPress: () {
                    //             setState(() {
                    //               cardSelected = 3;
                    //             });
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //     Column(
                    //       children: <Widget>[
                    //         CardImage(
                    //           imageUrl: 'assets/alphabet/letter-o.png',
                    //           scale: 5.0,
                    //           audioUrl: '',
                    //           isSelected: cardSelected == 4 ? true : false,
                    //           onPress: () {
                    //             setState(() {
                    //               cardSelected = 4;
                    //             });
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
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
                                      backgroundColor: cardSelected != 0
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
                                    if (cardSelected != 0) {
                                      if (widget.taskController
                                          .verifyAnswer(widget.task)) {
                                        isCorrect = true;
                                        widget.lessonController
                                            .verifyAnswerNonControlled();
                                      }
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
                                                  .transform(a1.value) - 1;

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
                                                  resposta: ""),
                                            ),
                                          );
                                        },
                                      );
                                    }
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
        ),
      ),
    );
  }
}
