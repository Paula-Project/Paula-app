import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/views/welcome_page_part1.dart';
import 'components/DIalogTextBox.dart';
import 'welcome_page_part3.dart';
import 'welcome_page_part1.dart';

import 'components/paulaTitle.dart';

class WelcomePagePart2 extends StatelessWidget {
  const WelcomePagePart2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx < 0) {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const WelcomePagePart3()));
          }
          if (details.delta.dx > 0) {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: const WelcomePagePart1()));
          }
        },
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
                      const DialogTextBox(
                        TextContent:
                            "Oi, eu me chamo Paula, e eu vou acompanhar o seu aprendizado de perto!",
                        audioUrl: "paula01.mp3",
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 140,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: const WelcomePagePart3()));
                          },
                          onHover: (hover) {},
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide.none)),
                          ),
                          child: const Text("Próximo",
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
