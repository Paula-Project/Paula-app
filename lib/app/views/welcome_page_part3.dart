import 'package:flutter/material.dart';

import 'components/paulaTitle.dart';

class WelcomePage_part3 extends StatelessWidget {
  const WelcomePage_part3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
        child: Column(children: [
          const Expanded(
            flex: 3,
            child: PaulaTitleComponent(),
          ),
          Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/Avatar-Maker(2).png',
                      width: MediaQuery.of(context).size.width - 150,
                    ),
                    Row(
                      children: [
                        ClipPath(
                          clipper: CustomTriangleClipper(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(199, 37, 85, 124)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(199, 37, 85, 124),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Para começar vamos precisar de algumas informações suas, tudo bem?",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 140,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/singup_part1");
                        },
                        onHover: (hover) {},
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
                        child: const Text("Vamos lá!",
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
