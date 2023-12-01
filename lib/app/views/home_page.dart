import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_itapoa_controller.dart';
import 'package:paula/app/controllers/lessons/lesson_paranoa_controller.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/lesson_button.dart';
import 'package:paula/app/views/components/lesson_button2.dart';
import 'package:paula/app/views/layout/layout.dart';
import 'package:paula/app/views/lessons/lesson_itapoa_welcome.dart';
import 'package:paula/app/views/lessons/lessons_vogais.dart';
import 'package:paula/app/views/lessons/lesson_paranoa_welcome.dart';
import 'package:provider/provider.dart';
import 'package:paula/app/controllers/modules/module_vowels_controller.dart';
import 'package:paula/app/views/components/module_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
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

  ModuleVowelsController moduleVowelsController = ModuleVowelsController();
  LessonParanoaController lessonParanoaController = LessonParanoaController();
  LessonItapoaController lessonItapoaController = LessonItapoaController();


  final int indexPage = 0;

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
                  textContent: 'Letra A',
                  audioManager: audioManager,
                  lessonController: moduleVowelsController.lessonAController,
                ),
                LessonButton(
                  isActive: true,
                  textContent: 'Letra E',
                  audioManager: audioManager,
                  lessonController: moduleVowelsController.lessonEController,
                ),
                LessonButton(
                  isActive: true,
                  textContent: 'Letra I',
                  audioManager: audioManager,
                  lessonController: moduleVowelsController.lessonIController,
                ),
                LessonButton(
                  isActive: true,
                  textContent: 'Letra O',
                  audioManager: audioManager,
                  lessonController: moduleVowelsController.lessonOController,
                ),
                LessonButton(
                  isActive: true,
                  textContent: 'Letra U',
                  audioManager: audioManager,
                  lessonController: moduleVowelsController.lessonUController,
                ),
                LessonButton(
                  isActive: true,
                  textContent: 'Lição Final',
                  audioManager: audioManager,
                  lessonController: moduleVowelsController.lessonFinalController,
                ),
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
                                  color: Color.fromARGB(197, 241, 106, 8),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: width * 0.55,
                                padding: const EdgeInsets.all(15),
                                child: const AutoSizeText(
                                  "Vamos conhecer as minhas cidades?\nQuero te mostrar de pertinho o Paranoá e o Itapoã!",
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
                LessonButton2(
                  isActive: true,
                  textContent: 'Paranoá',
                  audioManager: audioManager,
                  lessonController: lessonParanoaController,
                ),
                LessonButton2(
                  isActive: true,
                  textContent: 'Itapoã',
                  audioManager: audioManager,
                  lessonController: lessonItapoaController,
                ),
            ],
          ),
        ),
      ),
    );
  }
}




          