import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromARGB(255, 100, 171, 226),
                  Color.fromARGB(255, 41, 171, 226)
                ])),
            child: Row(children: [
              Expanded(
                flex: 1, // 20%
                child: Container(),
              ),
              Expanded(
                flex: 8, // 60%
                child: Column(
                  children: [
                    const Expanded(
                      flex: 3, // 20%
                      child: Center(
                        child: Text("PAULA",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.normal,
                              letterSpacing: 15,
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
                                          fontSize: 25,
                                          fontFamily: "Nunito",
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      "Use o apelido e senha \n cadastrados para acessar o Paula",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: BorderSide.none))),
                                  child: const Text('Entrar',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Container(
                              height: 2,
                            ),
                            Center(
                              child: TextButton(
                                child: const Text(
                                  "Esqueci a minha senha!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200),
                                ),
                                onPressed: () {},
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1, // 20%
                child: Container(),
              )
            ])));
  }
}
