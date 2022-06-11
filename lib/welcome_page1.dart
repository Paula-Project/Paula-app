import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
              Color.fromARGB(255, 41, 171, 226),
            ],
          ),
        ),
        child: Column(children: [
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
                children: [
                  Container(
                      width: (MediaQuery.of(context).size.width - 150),
                      child: Image.asset('assets/images/Avatar-Maker(2).png')),
                  const SizedBox(height: 20),
                  Text(
                    "Seja Bem Vindo!",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 140,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      onHover: (hover) {
                        print(hover);
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide.none)),
                      ),
                      child:
                          const Text("Avançar", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
