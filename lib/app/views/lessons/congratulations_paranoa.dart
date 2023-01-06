import 'dart:math';
import 'package:flutter/material.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:lottie/lottie.dart';
import 'package:paula/app/views/home_page.dart';

class CongratulationsParanoa extends StatefulWidget {
  const CongratulationsParanoa({
    Key? key,
  }) : super(key: key);

  @override
  State<CongratulationsParanoa> createState() => _CongratulationsParanoaState();
}

class _CongratulationsParanoaState extends State<CongratulationsParanoa>
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
    print("$randomNum");
    Future<bool> _onwillpop() async {
      return false;
    }

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 100, 30, 10),
                child: Column(
                  children: [
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 00, 8, 0),
                        child: Text(
                          speech[randomNum],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
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
                                child: Lottie.asset(
                                    'assets/images/fireworks.json')),
                          ],
                        ),
                      ),
                    ]),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                              height: 200,
                              child:
                                  Lottie.asset('assets/images/fireworks.json')),
                          SizedBox(
                              height: 350,
                              child: Image.asset(
                                "assets/images/paula/paula04.png",
                                alignment: Alignment.center,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70.0),
                child: SizedBox(
                    width: 200,
                    height: 50,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) => HomePage(),
                            ),
                            (route) => false,
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide.none),
                            )),
                        child: const Text(
                          "AVANÇAR",
                          style: TextStyle(fontSize: 20),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
