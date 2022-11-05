import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/paulaTitle.dart';
import 'welcome_page_part2.dart';

class WelcomePagePart1 extends StatelessWidget {
  const WelcomePagePart1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < 0) {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
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
              child: PaulaTitleComponent(),
            ),
            Expanded(
              flex: MediaQuery.of(context).size.height > 500 ? 8 : 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: (MediaQuery.of(context).size.height * 0.4),
                      child: Image.asset('assets/images/paula/paula01.png')),
                  const SizedBox(height: 20),
                  const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Seja Bem Vindo!",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: (MediaQuery.of(context).size.height * 0.02)),
                  SizedBox(
                    width: MediaQuery.of(context).size.height > 400 ? 140 : 100,
                    height: MediaQuery.of(context).size.height > 400 ? 40 : 25,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const WelcomePagePart2()));
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
                      child: const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("Avançar",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      child: const Text(
                        "Já possuo login!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.underline),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: const LoginPage()));
                      },
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Future<bool> verificarToken() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    if (sharedPreference.getString('token') != null) {
      return true;
    } else {
      return false;
    }
  }
}
