import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/taskTitle.dart';
import 'package:paula/app/views/layout/task_layout.dart';

class LessonIntroduction extends StatefulWidget {
  final String letter;
  final String titleIntroduction;
  final LessonControllerInterface controller;
  final String audioUrl;

  const LessonIntroduction(
      {Key? key,
      required this.letter,
      required this.titleIntroduction,
      required this.controller,
      required this.audioUrl})
      : super(key: key);

  @override
  State<LessonIntroduction> createState() => _LessonIntroductionState();
}

class _LessonIntroductionState extends State<LessonIntroduction>
    with WidgetsBindingObserver {
  AudioManager audioManager = AudioManager();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    audioManager.runAudio("audios/paula/${widget.audioUrl}");
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
    return TaskLayout(
      shouldPop: true,
      taskProgress: Container(),
      lessonController: widget.controller,
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(37, 85, 124, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Wrap(children: [
                    Container(
                        decoration: const BoxDecoration(color: Colors.black26),
                        width: (MediaQuery.of(context).size.width - 60) / 2,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Center(
                          child: AutoSizeText(
                            minFontSize: 80,
                            widget.letter.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 120,
                            ),
                          ),
                        )),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width - 60) / 2,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Center(
                          child: AutoSizeText(
                            minFontSize: 80,
                            widget.letter.toLowerCase(),
                            style: const TextStyle(fontSize: 120),
                          ),
                        )),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width - 60) / 2,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Center(
                          child: AutoSizeText(
                            minFontSize: 80,
                            widget.letter.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 120, fontFamily: 'Norican'),
                          ),
                        )),
                    Container(
                        decoration: const BoxDecoration(color: Colors.black26),
                        width: (MediaQuery.of(context).size.width - 60) / 2,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Center(
                          child: AutoSizeText(
                            minFontSize: 80,
                            textAlign: TextAlign.center,
                            widget.letter.toLowerCase(),
                            style: const TextStyle(
                                fontSize: 120, fontFamily: 'Norican'),
                          ),
                        )),
                  ])),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TaskTitle(
                    audio: widget.audioUrl,
                    title: widget.titleIntroduction,
                    audioManager: audioManager),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: (MediaQuery.of(context).size.width),
                      height: 275,
                      child: Image.asset(
                        'assets/images/paula/paula03.png',
                        scale: 1,
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      right: 30,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Center(
                          child: IconButton(
                            color: Colors.white,
                            iconSize: 40,
                            icon: const Icon(
                              Icons.arrow_forward_outlined,
                            ),
                            onPressed: () async {
                              Navigator.of(context).pushAndRemoveUntil(
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: widget.controller.nextTask()),
                                  (route) => false);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
