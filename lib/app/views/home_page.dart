import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_itapoa_controller.dart';
import 'package:paula/app/controllers/lessons/lesson_paranoa_controller.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/lesson_button.dart';
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
        bodyContent:
            Consumer<UsuarioState>(builder: (context, usuarioState, child) {
          UsuarioAPI usuarioLogado = usuarioState.getUsuario();

          return Padding(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
              child: Column(children: [
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
                LessonButton(
                  isActive: true,
                  textContent: 'Paranoá',
                  audioManager: audioManager,
                  lessonController: lessonParanoaController,
                ),
                LessonButton(
                  isActive: true,
                  textContent: 'Itapoã',
                  audioManager: audioManager,
                  lessonController: lessonItapoaController,
                ),
                /*ModuleButton(
                    Alignment.centerRight,
                    "Paranoá",
                    LessonParanoaWelcome(
                        lessonController: lessonParanoaController),true),
                ModuleButton(
                    Alignment.centerLeft,
                    "Itapoã",
                    LessonItapoaWelcome(
                        lessonController: lessonItapoaController),
                    true),*/
              ]));
        }));
  }
}