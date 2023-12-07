import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/buttonContinue.dart';
import 'package:paula/app/views/components/exitDialog.dart';
import 'package:paula/app/views/components/taskTitle.dart';

class LessonDrawLetter extends StatefulWidget {
  final LessonControllerInterface lessonController;
  const LessonDrawLetter({
    Key? key,
    required this.lessonController,
  }) : super(key: key);

  @override
  State<LessonDrawLetter> createState() => _LessonDrawLetterState();
}

class _LessonDrawLetterState extends State<LessonDrawLetter>
    with WidgetsBindingObserver {
  AudioManager audioManager = AudioManager();

  @override
  void initState() {
    widget.lessonController.reset();
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDialog(context),
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 240, 240, 240),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height * 0.13),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(37, 85, 124, 1),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: AutoSizeText(
                          "Escrita",
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 70, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TaskTitle(
                      title:
                          "Pronto para praticar a escrita das letras? Vamos lá!\n Conecte-se à internet para começar.",
                      audio: "paula_draw_letter_introduction.mp3",
                      audioManager: audioManager,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    padding: const EdgeInsets.only(left: 50),
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/paula/paula08.png',
                        height: MediaQuery.of(context).size.height * 0.38,
                      ),
                    ),
                  ),
                  ButtonContinue(lessonController: widget.lessonController)
                ],
              )),
        ),
      ),
    );
  }
}
