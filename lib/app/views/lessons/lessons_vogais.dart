import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/controllers/lesson_AEU_controller.dart';
import 'package:paula/app/views/components/lesson_button.dart';
import 'package:paula/app/views/home_page.dart';
import 'package:paula/app/views/person_data_page.dart';

import '../../controllers/module_vowels_controller.dart';

class LessonsVogais extends StatelessWidget {
  final ModuleVowelsController moduleVowelsController;

  LessonsVogais({Key? key, required this.moduleVowelsController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0,
          title: OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: HomePage()));
            },
            child: const Icon(
              Icons.logout,
              color: Colors.grey,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: SizedBox(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("57% Completo",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    LinearProgressIndicator(
                      value: 0.57,
                      backgroundColor: Colors.grey,
                      color: Color.fromARGB(255, 89, 233, 95),
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ],
                ),
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              LessonButton(
                isActive: true,
                textContent: 'A - E - U',
                lessonPage: moduleVowelsController.lessonAEUController.nextTask(),
              ),
              LessonButton(
                isActive: moduleVowelsController.lessonAEUController.getCompleted(),
                textContent: 'I - U',
                lessonPage: moduleVowelsController.lessonIOController.nextTask(),
              ),
              LessonButton(
                isActive: moduleVowelsController.lessonIOController.getCompleted(),
                textContent: 'LIÇÃO FINAL',
                lessonPage: moduleVowelsController.lessonFinalController.nextTask(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          backgroundColor: Colors.white,
          elevation: 100,
          iconSize: 40,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(),
                  ),
                  (route) => false,
                );
                break;
              case 1:
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PersonData(),
                  ),
                  (route) => false,
                );
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Perfil"),
          ]),
    );
  }
}
