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
            Expanded(
              flex: MediaQuery.of(context).size.height > 500 ? 3 : 2,
              child: PaulaTitleComponent(),
            ),
            Expanded(
                flex: MediaQuery.of(context).size.height > 500 ? 8 : 7,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.height > 600 ? 40 : 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: (MediaQuery.of(context).size.height * 0.4),
                          child:
                              Image.asset('assets/images/paula/paula02.png')),
                      const DialogTextBox(
                        TextContent:
                            "Oi, eu me chamo Paula, seja muito bem-vindo(a) ao meu aplicativo!",
                        audioUrl: "paula_welcome_1.mp3",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height > 550
                              ? 30
                              : 10),
                      SizedBox(
                        width: 140,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
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
