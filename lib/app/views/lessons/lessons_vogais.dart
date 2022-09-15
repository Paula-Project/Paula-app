import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/controllers/lesson_AEU_controller.dart';
import 'package:paula/app/views/components/lesson_button.dart';
import 'package:paula/app/views/home_page.dart';
import 'package:paula/app/views/login_page.dart';
import 'package:paula/app/views/person_data_page.dart';

import '../../controllers/module_vowels_controller.dart';

class LessonsVogais extends StatelessWidget {
  final ModuleVowelsController moduleVowelsController;

  const LessonsVogais({Key? key, required this.moduleVowelsController})
      : super(key: key);

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
                    type: PageTransitionType.fade, child: const LoginPage()));
          },
          child: const Icon(
            Icons.logout,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              LessonButton(
                isActive: true,
                textContent: 'A - E - U',
                lessonController: moduleVowelsController.lessonAEUController,
              ),
              LessonButton(
                isActive:
                    moduleVowelsController.lessonAEUController.getCompleted(),
                textContent: 'I - U',
                lessonController: moduleVowelsController.lessonIOController,
              ),
              LessonButton(
                isActive:
                    moduleVowelsController.lessonIOController.getCompleted(),
                textContent: 'LIÇÃO FINAL',
                lessonController: moduleVowelsController.lessonFinalController,
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
