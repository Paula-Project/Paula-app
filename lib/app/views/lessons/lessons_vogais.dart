import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/controllers/module_vogal_controller.dart';
import 'package:paula/app/views/components/lesson_button.dart';
import 'package:paula/app/views/person_data_page.dart';

import '../../controllers/lesson_AEU_controller.dart';
import '../home_page.dart';

class LessonsVogais extends StatelessWidget {
  LessonAEUController lessonAEUController = LessonAEUController();

  LessonsVogais({Key? key}) : super(key: key);

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
                lessonPage: lessonAEUController.nextTask(),
              ),
              LessonButton(
                isActive: false,
                textContent: 'I - U',
                lessonPage: HomePage(),
              ),
              LessonButton(
                isActive: false,
                textContent: 'LIÇÃO FINAL',
                lessonPage: HomePage(),
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
                    builder: (BuildContext context) => const PersonData(),
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
