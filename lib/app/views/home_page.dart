import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_itapoa_controller.dart';
import 'package:paula/app/controllers/lessons/lesson_paranoa_controller.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/layout/layout.dart';
import 'package:paula/app/views/lessons/lesson_itapoa_welcome.dart';
import 'package:paula/app/views/lessons/lessons_vogais.dart';
import 'package:paula/app/views/lessons/lesson_paranoa_welcome.dart';
import 'package:provider/provider.dart';
import 'package:paula/app/controllers/modules/module_vowels_controller.dart';
import 'package:paula/app/views/components/module_button.dart';

class HomePage extends StatelessWidget {
  ModuleVowelsController moduleVowelsController = ModuleVowelsController();
  LessonParanoaController lessonParanoaController = LessonParanoaController();
  LessonItapoaController lessonItapoaController = LessonItapoaController();

  HomePage({Key? key}) : super(key: key);
  final int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Layout(
        indexPage: 0,
        bodyContent:
            Consumer<UsuarioState>(builder: (context, usuarioState, child) {
          UsuarioAPI usuarioLogado = usuarioState.getUsuario();

          return Padding(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
              child: Column(children: [
                ModuleButton(
                    Alignment.centerLeft,
                    "Vogais",
                    LessonsVogais(
                      moduleVowelsController: moduleVowelsController,
                    ),
                    true),
                ModuleButton(
                    Alignment.centerRight,
                    "Paranoá",
                    LessonParanoaWelcome(
                        lessonController: lessonParanoaController),
                    moduleVowelsController.getCompleted(usuarioLogado)),
                ModuleButton(
                    Alignment.centerLeft,
                    "Itapoã",
                    LessonItapoaWelcome(
                        lessonController: lessonItapoaController),
                    LessonParanoaController.completed),
              ]));
        }));
  }
}
