import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/views/components/DIalogTextBox.dart';
import 'package:paula/app/views/welcome_page_part4.dart';
import 'package:paula/app/views/welcome_page_part2.dart';
import 'package:paula/app/views/components/paulaTitle.dart';

class WelcomePagePart3 extends StatelessWidget {
  const WelcomePagePart3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1),
      child: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx < 0) {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const WelcomePagePart4()));
          }
          if (details.delta.dx > 0) {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: const WelcomePagePart2()));
          }
        },
        child: Material(
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
                child: const PaulaTitleComponent(),
              ),
              Expanded(
                  flex: MediaQuery.of(context).size.height > 500 ? 8 : 7,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.height > 600 ? 20 : 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: (MediaQuery.of(context).size.height * 0.4),
                            child:
                                Image.asset('assets/images/paula/paula01.png')),
                        const DialogTextBox(
                          TextContent:
                              "Eu nasci de um projeto do Polo Paranoá da UnB, e eu vou acompanhar o seu aprendizado de perto!",
                          audioUrl: 'paula_welcome_2.mp3',
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
                                      child: const WelcomePagePart4()));
                            },
                            onHover: (hover) {},
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
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
        ),
      ),
    );
  }
}
