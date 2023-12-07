import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_draw_controller.dart';
import 'package:paula/app/controllers/lessons/lesson_itapoa_controller.dart';
import 'package:paula/app/controllers/lessons/lesson_paranoa_controller.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/lesson_button.dart';
import 'package:paula/app/views/components/lesson_button2.dart';
import 'package:paula/app/views/layout/layout.dart';
import 'package:paula/app/views/lessons/lesson_draw_letter.dart';
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
  LessonDrawController lessonDrawController = LessonDrawController();


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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: Divider(color: Colors.blue,),),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Vogais', style: TextStyle(fontSize: 30, color: Colors.blue),),
                  ),
                  Expanded(child: Divider(color: Colors.blue,),),
                ],
              ),
              const Padding(padding: EdgeInsets.all(22)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  textContent: 'Vogal A',
                  audioManager: audioManager,
                  lessonController: moduleVowelsController.lessonAController,
                  imgPath: "assets/images/paula/a.png",
                ),
                LessonButton(
                  isActive: true,
                  textContent: 'Vogal E',
                  audioManager: audioManager,
                  lessonController: moduleVowelsController.lessonEController,
                  imgPath: "assets/images/paula/e.png",
                ),
                LessonButton(
                  isActive: true,
                  textContent: 'Vogal I',
                  audioManager: audioManager,
                  lessonController: moduleVowelsController.lessonIController,
                  imgPath: "assets/images/paula/i.png",
                ),
                LessonButton(
                  isActive: true,
                  textContent: 'Vogal O',
                  audioManager: audioManager,
                  lessonController: moduleVowelsController.lessonOController,
                  imgPath: "assets/images/paula/o.png",
                ),
                LessonButton(
                  isActive: true,
                  textContent: 'Vogal U',
                  audioManager: audioManager,
                  lessonController: moduleVowelsController.lessonUController,
                  imgPath: "assets/images/paula/u.png",
                ),
                LessonButton(
                  isActive: true,
                  textContent: 'Lição Final',
                  audioManager: audioManager,
                  lessonController: moduleVowelsController.lessonFinalController,
                ),
                const Padding(padding: EdgeInsets.all(22)),
                const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: Divider(color: Colors.deepOrange,),),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Cidades', style: TextStyle(fontSize: 30, color: Colors.deepOrange),),
                  ),
                  Expanded(child: Divider(color: Colors.deepOrange,),),
                ],
              ),
              const Padding(padding: EdgeInsets.all(22)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    
                    MaterialButton(
                      onPressed: () {
                        audioManager
                            .runAudio("audios/paula/paula_cidades.mp3");
                      },
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: width * 0.55,
                                margin: const EdgeInsets.only(left: 25.0),
                                padding: const EdgeInsets.all(15),
                                child: const AutoSizeText(
                                  "Vamos conhecer as minhas cidades?Quero te mostrar de pertinho o Paranoá e o Itapoã!",
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
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: ClipPath(
                              clipper: CustomTriangleClipperRight(),
                              child: Container(
                                width: 20,
                                height: 25,
                                decoration: const BoxDecoration(
                                    color: Colors.deepOrange),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/paula/paula05.png",
                      height: height * 0.25,
                    ),
                  ]),
                LessonButton2(
                  isActive: true,
                  textContent: 'Paranoá',
                  audioManager: audioManager,
                  lessonController: lessonParanoaController,
                  imgPath: "assets/images/paula/paranoa_letreiro2.jpg"
                ),
                LessonButton2(
                  isActive: true,
                  textContent: 'Itapoã',
                  audioManager: audioManager,
                  lessonController: lessonItapoaController,
                  imgPath: "assets/images/paula/itapoa2.png",
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTriangleClipperRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(0.0, size.width);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


          