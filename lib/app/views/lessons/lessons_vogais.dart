import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/views/lessons/lesson_introduction.dart';

import '../home_page.dart';

class LessonsVogais extends StatelessWidget {
  const LessonsVogais({Key? key}) : super(key: key);

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
                      type: PageTransitionType.fade,
                      child: const HomePage()));
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
                width: 120,
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
      body: Column(
        children: [
          Container(
            height: 40,
          ),
          SizedBox(
            width: 300,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: const LessonIntroduction()));
              },
              style: ButtonStyle(
                foregroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none)),
              ),
              child:
              const Text("A - E - U", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            height: 40,
          ),
          SizedBox(
            width: 300,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ButtonStyle(
                foregroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none)),
              ),
              child:
              const Text("I - O", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            height: 40,
          ),
          SizedBox(
            width: 300,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ButtonStyle(
                foregroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none)),
              ),
              child:
              const Text("LIÇÃO FINAL", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            height: 40,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          backgroundColor: Colors.white,
          elevation: 100,
          iconSize: 40,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage(),
                  ),
                      (route) => false,
                );
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
