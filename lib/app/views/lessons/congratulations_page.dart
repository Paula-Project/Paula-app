import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/module_vowels_controller.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/lessons/lessons_vogais.dart';
import 'package:lottie/lottie.dart';

class CongratulationsPage extends StatefulWidget {
  final ModuleVowelsController moduleVowelsController;
  const CongratulationsPage({Key? key, required this.moduleVowelsController})
      : super(key: key);

  @override
  State<CongratulationsPage> createState() => _CongratulationsPageState();
}

class _CongratulationsPageState extends State<CongratulationsPage>
    with WidgetsBindingObserver {
  AudioManager audioManager = AudioManager();
  AudioManager audioManager2 = AudioManager();
  List<String> speech = [
    "Parabéns, \nvocê está indo muito bem",
    "Muito bem, \né isso aí, Você é 10",
    "Nossa, estou chocada, \nvocê é demais"
  ];
  List<String> audios = [
    "audios/paula/paula_parabens_1.mp3",
    "audios/paula/paula_parabens_2.mp3",
    "audios/paula/paula_parabens_3.mp3"
  ];
  int randomNum = Random().nextInt(3);
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    audioManager2.runAudio("audios/congrats_1.mp3");
    Future.delayed(const Duration(seconds: 1), () {
      audioManager.runAudio(audios[randomNum]);
    });
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

    return WillPopScope(
      onWillPop: () => _onwillpop(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(200, 100, 171, 226),
                Color.fromARGB(255, 41, 171, 226),
              ],
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: MediaQuery.of(context).padding.bottom + 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Stack(children: [
                    SizedBox(
                      height: height * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 00, 8, 0),
                        child: AutoSizeText(
                          speech[randomNum],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              height: 200,
                              child:
                                  Lottie.asset('assets/images/fireworks.json')),
                        ],
                      ),
                    ),
                  ]),
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                            height: height * 0.3,
                            child:
                                Lottie.asset('assets/images/fireworks.json')),
                        SizedBox(
                            height: height * 0.5,
                            child: Image.asset(
                              "assets/images/paula/paula04.png",
                              alignment: Alignment.center,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (BuildContext context) => LessonsVogais(
                                moduleVowelsController:
                                    widget.moduleVowelsController),
                          ),
                          (route) => false,
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide.none),
                          )),
                      child: const Text(
                        "AVANÇAR",
                        style: TextStyle(fontSize: 20),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
