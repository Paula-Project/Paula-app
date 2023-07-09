import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/views/singup_page_part1.dart';
import 'package:paula/app/views/welcome_page_part1.dart';
import 'components/DIalogTextBox.dart';
import 'welcome_page_part3.dart';
import 'welcome_page_part1.dart';

import 'components/paulaTitle.dart';

class WelcomePagePart4 extends StatelessWidget {
  const WelcomePagePart4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1),
      child: Material(
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx < 0) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const SingupPage()));
            }
            if (details.delta.dx > 0) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: const WelcomePagePart3()));
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: (MediaQuery.of(context).size.height * 0.35),
                          child:
                              Image.asset('assets/images/paula/paula02.png')),
                      const DialogTextBox(
                        TextContent:
                            "Para começar vamos precisar de algumas informações suas, tudo bem? Nessa etapa talvez você precise de alguém para te ajudar, ok?",
                        audioUrl: "paula_welcome_3.mp3",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height > 550
                              ? 20
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
                                    child: const SingupPage()));
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
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
