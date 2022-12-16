import 'package:flutter/material.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/layout/layout.dart';
import 'package:paula/app/views/lessons/lessons_vogais.dart';
import 'package:provider/provider.dart';
import '../controllers/module_vowels_controller.dart';
import 'components/module_button.dart';

class HomePage extends StatelessWidget {
  ModuleVowelsController moduleVowelsController = ModuleVowelsController();

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
                ModuleButton(Alignment.centerRight, "Módulo \n 2", HomePage(),
                    moduleVowelsController.getCompleted(usuarioLogado)),
                ModuleButton(
                    Alignment.centerLeft, "Módulo \n 3", HomePage(), false),
                ModuleButton(
                    Alignment.centerRight, "Módulo \n 4", HomePage(), false),
                ModuleButton(
                    Alignment.centerLeft, "Módulo \n 5", HomePage(), false),
                ModuleButton(
                    Alignment.centerRight, "Módulo \n 6", HomePage(), false)
              ]));
        }));
  }
}
