import 'package:flutter/material.dart';
import 'package:paula/app/views/layout/layout.dart';
import 'package:paula/app/views/lessons/lessons_vogais.dart';
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
        bodyContent: Padding(
            padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
            child: Column(children: [
              ModuleButton(
                  Alignment.centerLeft,
                  "Vogais",
                  LessonsVogais(
                    moduleVowelsController: moduleVowelsController,
                  ),
                  true),
              ModuleButton(Alignment.centerRight, "Consoantes \n Parte 1",
                  HomePage(), false),
              ModuleButton(Alignment.centerLeft, "Consoantes \n Parte 2",
                  HomePage(), false),
              ModuleButton(Alignment.centerRight, "Primeiras \n sílabas",
                  HomePage(), false),
              ModuleButton(Alignment.centerLeft, "Consoantes \n Parte 3",
                  HomePage(), false),
              ModuleButton(
                  Alignment.centerRight, "Palavras 1", HomePage(), false)
            ])));
  }
}
