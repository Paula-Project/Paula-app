import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/controllers/lesson_controller_interface.dart';
import 'package:paula/app/views/components/audioManager.dart';

class TaskDiphthong extends StatefulWidget {
  final LessonControllerInterface lessonController;
  const TaskDiphthong({super.key, required this.lessonController});

  @override
  State<TaskDiphthong> createState() => _TaskDiphthongState();
}

class _TaskDiphthongState extends State<TaskDiphthong>
    with WidgetsBindingObserver {
  AudioManager audioManager = AudioManager();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    audioManager.runAudio("audios/paula/paula_ditongos.mp3");
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
    Future<bool> _onwillpop() async {
      return false;
    }

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => _onwillpop(),
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () {
                    audioManager.runAudio("audios/paula/paula_ditongos.mp3");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/paula/paula05.png",
                        height: height * 0.3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
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
                          Stack(children: [
                            Container(
                              width: (width - 45) / 2,
                              height: height * 0.3,
                              padding: const EdgeInsets.all(15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(199, 37, 85, 124),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text(
                                  "Você sabia que com apenas 2 vogais, você já tem uma palavra?",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                            const Positioned(
                              right: 10,
                              bottom: 10,
                              child: Icon(
                                Icons.spatial_audio_off_sharp,
                                color: Colors.white,
                              ),
                            )
                          ]),
                        ],
                      )
                    ],
                  ),
                ),
                DiphthongWidget(
                  letters: const ['o', 'i'],
                  audioManager: audioManager,
                  audioPath: 'audios/paula/paula_oi.mp3',
                ),
                DiphthongWidget(
                  letters: const ['a', 'i'],
                  audioManager: audioManager,
                  audioPath: 'audios/paula/paula_ai.mp3',
                ),
                DiphthongWidget(
                  letters: const ['e', 'i'],
                  audioManager: audioManager,
                  audioPath: 'audios/paula/paula_ei.mp3',
                ),
                DiphthongWidget(
                  letters: const ['u', 'i'],
                  audioManager: audioManager,
                  audioPath: 'audios/paula/paula_ui.mp3',
                ),
                DiphthongWidget(
                  letters: const ['o', 'u'],
                  audioManager: audioManager,
                  audioPath: 'audios/paula/paula_ou.mp3',
                ),
                SizedBox(
                    height: 40.0,
                    width: 150.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: widget.lessonController.nextTask()),
                            (route) => false);
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
                                      side: BorderSide.none))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("AVANÇAR",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                )),
                            Icon(
                              Icons.arrow_forward,
                              size: 26,
                              color: Colors.white,
                            )
                          ]),
                    ))
              ]),
        ),
      ),
    );
  }
}

class DiphthongWidget extends StatelessWidget {
  final List<String> letters;
  final String audioPath;
  final AudioManager audioManager;
  const DiphthongWidget({
    Key? key,
    required this.letters,
    required this.audioPath,
    required this.audioManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 90,
            child: Text("${letters[0]} + ${letters[1]}",
                style: const TextStyle(fontSize: 35, color: Colors.black)),
          ),
          const Text(" = ",
              style: TextStyle(fontSize: 35, color: Colors.black)),
          MaterialButton(
            onPressed: () {
              audioManager.runAudio(audioPath);
            },
            height: 60,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: const Color.fromARGB(199, 37, 85, 124),
            child: SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: Text("${letters[0]}${letters[1]}",
                        style:
                            const TextStyle(fontSize: 35, color: Colors.white)),
                  ),
                  const Icon(
                    Icons.spatial_audio_off_sharp,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, size.height / 3);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
