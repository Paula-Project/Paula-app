import 'package:flutter/material.dart';
import 'package:paula/app/controllers/module_vowels_controller.dart';
import 'package:paula/app/views/lessons/lessons_vogais.dart';
import 'package:lottie/lottie.dart';

class CongratulationsPage extends StatefulWidget {
  final ModuleVowelsController moduleVowelsController;
  const CongratulationsPage({Key? key, required this.moduleVowelsController})
      : super(key: key);

  @override
  State<CongratulationsPage> createState() => _CongratulationsPageState();
}

class _CongratulationsPageState extends State<CongratulationsPage> {
  @override
  Widget build(BuildContext context) {
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
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 00, 8, 0),
                        child: Text(
                          "VOCÊ É INCRÍVEL!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
