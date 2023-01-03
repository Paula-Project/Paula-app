import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/lesson_button.dart';
import 'package:paula/app/views/home_page.dart';
import 'package:paula/app/views/login_page.dart';
import 'package:paula/app/views/person_data_page.dart';

import '../../controllers/module_vowels_controller.dart';

class LessonsVogais extends StatefulWidget {
  final ModuleVowelsController moduleVowelsController;

  const LessonsVogais({Key? key, required this.moduleVowelsController})
      : super(key: key);

  @override
  State<LessonsVogais> createState() => _LessonsVogaisState();
}

class _LessonsVogaisState extends State<LessonsVogais>
    with WidgetsBindingObserver {
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

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                audioManager: audioManager,
                lessonController:
                    widget.moduleVowelsController.lessonAEUController,
              ),
              LessonButton(
                isActive: widget.moduleVowelsController.lessonAEUController
                    .getCompleted(),
                textContent: 'I - O',
                audioManager: audioManager,
                lessonController:
                    widget.moduleVowelsController.lessonIOController,
              ),
              LessonButton(
                isActive: widget.moduleVowelsController.lessonIOController
                    .getCompleted(),
                textContent: 'LIÇÃO FINAL',
                audioManager: audioManager,
                lessonController:
                    widget.moduleVowelsController.lessonFinalController,
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
                                  color: const Color.fromARGB(199, 37, 85, 124),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: width * 0.5,
                                height: height * 0.3,
                                padding: const EdgeInsets.all(15),
                                child: const AutoSizeText(
                                  "Vamos começar a estudar algumas palavras com as VOGAIS, elas são: A - E - I - O - U\nelas vão aparecer em todas as palavras.",
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                  minFontSize: 12,
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

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height / 1.5);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
