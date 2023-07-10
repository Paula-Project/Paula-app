import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:paula/app/controllers/modules/module_vowels_controller.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:provider/provider.dart';
import 'package:paula/app/views/home_page.dart';

class CongratulationsVowelsPage extends StatefulWidget {
  final ModuleVowelsController moduleVowelsController;
  const CongratulationsVowelsPage(
      {Key? key, required this.moduleVowelsController})
      : super(key: key);

  @override
  State<CongratulationsVowelsPage> createState() =>
      _CongratulationsVowelsPageState();
}

class _CongratulationsVowelsPageState extends State<CongratulationsVowelsPage> {
  @override
  Widget build(BuildContext context) {
    Future<bool> _onwillpop() async {
      return false;
    }

    String speech = "Parabéns, \n Você concluiu o módulo de vogais";
    var height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: _onwillpop,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Stack(children: [
                    SizedBox(
                      height: height * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 00, 8, 0),
                        child: AutoSizeText(
                          speech,
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
                            height: height * 0.2,
                            child: Image.asset(
                              'assets/images/selos/Selo_vogais.png',
                              alignment: Alignment.center,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Consumer<UsuarioState>(builder: (context, usuarioState, child) {
                UsuarioAPI usuarioLogado = usuarioState.getUsuario();
                return Container(
                  margin: const EdgeInsets.only(top: 70.0),
                  child: SizedBox(
                    width: 350,
                    height: 50,
                    child: SizedBox(
                      height: 50.0,
                      width: 75.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide.none))),
                        child: const Text('AVANÇAR',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        onPressed: () {
                          widget.moduleVowelsController
                              .setModuleVowelsCompleted(usuarioLogado, context);
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) => HomePage(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
