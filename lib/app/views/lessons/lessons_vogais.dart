import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/lesson_button.dart';
import 'package:paula/app/views/layout/layout.dart';
import 'package:paula/app/controllers/modules/module_vowels_controller.dart';

class LessonsVogais extends StatefulWidget {
  final ModuleVowelsController moduleVowelsController;

  const LessonsVogais({Key? key, required this.moduleVowelsController})
      : super(key: key);

  @override
  State<LessonsVogais> createState() => _LessonsVogaisState();
}

class _LessonsVogaisState extends State<LessonsVogais>
    with WidgetsBindingObserver {
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

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Layout(
      indexPage: 0,
      bodyContent: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      "assets/images/paula/paula05.png",
                      height: height * 0.25,
                    ),
                    MaterialButton(
                      onPressed: () {
                        audioManager
                            .runAudio("audios/paula/paula_lessonVogais.mp3");
                      },
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: ClipPath(
                              clipper: CustomTriangleClipper(),
                              child: Container(
                                width: 20,
                                height: 25,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(199, 37, 85, 124)),
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(199, 37, 85, 124),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: width * 0.55,
                                padding: const EdgeInsets.all(15),
                                child: const AutoSizeText(
                                  "Vamos começar a estudar algumas palavras com as VOGAIS, elas são: A - E - I - O - U\nelas vão aparecer em todas as palavras.",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                  minFontSize: 12,
                                  maxFontSize: 22,
                                  textScaleFactor: 1,
                                ),
                              ),
                              const Positioned(
                                right: 10,
                                bottom: 20,
                                child: Icon(
                                  Icons.spatial_audio_off_sharp,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
              LessonButton(
                isActive: true,
                textContent: 'A',
                audioManager: audioManager,
                lessonController:
                    widget.moduleVowelsController.lessonAController,
              ),
              LessonButton(
                isActive: widget.moduleVowelsController.lessonAController
                    .getCompleted(),
                textContent: 'E',
                audioManager: audioManager,
                lessonController:
                    widget.moduleVowelsController.lessonEController,
              ),
              LessonButton(
                isActive: widget.moduleVowelsController.lessonEController
                    .getCompleted(),
                textContent: 'I',
                audioManager: audioManager,
                lessonController:
                    widget.moduleVowelsController.lessonIController,
              ),
              LessonButton(
                isActive: widget.moduleVowelsController.lessonIController
                    .getCompleted(),
                textContent: 'O',
                audioManager: audioManager,
                lessonController:
                    widget.moduleVowelsController.lessonOController,
              ),
              LessonButton(
                isActive: widget.moduleVowelsController.lessonOController
                    .getCompleted(),
                textContent: 'U',
                audioManager: audioManager,
                lessonController:
                    widget.moduleVowelsController.lessonUController,
              ),
              LessonButton(
                isActive: widget.moduleVowelsController.lessonUController
                    .getCompleted(),
                textContent: 'LIÇÃO FINAL',
                audioManager: audioManager,
                lessonController:
                    widget.moduleVowelsController.lessonFinalController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height / 1.5);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
