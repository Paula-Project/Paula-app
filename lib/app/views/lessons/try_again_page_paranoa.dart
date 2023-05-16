import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/home_page.dart';

class TryAgainParanoaPage extends StatefulWidget {
  const TryAgainParanoaPage({Key? key}) : super(key: key);

  @override
  State<TryAgainParanoaPage> createState() => _TryAgainParanoaPageState();
}

class _TryAgainParanoaPageState extends State<TryAgainParanoaPage>
    with WidgetsBindingObserver {
  AudioManager audioManager = AudioManager();
  AudioManager audioManager2 = AudioManager();
  List<String> speech = [
    "Tente mais uma vez, você consegue!",
    "Poxa, não foi dessa vez hein, mas você vai conseguir!",
  ];
  List<String> audios = [
    "audios/paula/paula_tryAgain_1.mp3",
    "audios/paula/paula_tryAgain_2.mp3",
  ];
  List<String> images = [
    "assets/images/paula/paula06.png",
    "assets/images/paula/paula07.png",
  ];
  int randomNum = Random().nextInt(2);
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    audioManager2.runAudio("audios/failed_sound.mp3");
    audioManager.runAudio(audios[randomNum]);
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
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
                  Center(
                    child: SizedBox(
                        height: height * 0.4,
                        child: Image.asset(
                          images[randomNum],
                          alignment: Alignment.center,
                        )),
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
