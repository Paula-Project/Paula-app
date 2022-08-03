import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const BackgroundBlueGradiend = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color.fromARGB(255, 100, 171, 226),
        Color.fromARGB(255, 41, 171, 226)
      ]));

  String nickname = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BackgroundBlueGradiend,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            children: [
              const Expanded(
                flex: 3,
                child: Center(
                  child: Text("PAULA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.normal,
                        letterSpacing: 20,
                      )),
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: const [
                            Text("LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.w500)),
                            Text(
                                "Use o apelido e senha \n cadastrados para acessar o Paula",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  height: 1.5,
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      const Text("Apelido",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300)),
                      Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(50, 0, 0, 0),
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ]),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 6),
                            hintText: 'joaozinho123',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8)),
                            isDense: true,
                          ),
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            nickname = value;
                          },
                        ),
                      ),
                      Container(height: 10),
                      const Text("Senha",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300)),
                      Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(50, 0, 0, 0),
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ]),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 6),
                            isDense: true,
                            hintText: '****',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          width: 110,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide.none))),
                            child: const Text('Entrar',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const HomePage()));
                            },
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          child: const Text(
                            "Esqueci a minha senha!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
