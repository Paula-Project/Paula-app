import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/views/home_page.dart';
import 'package:paula/app/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/paulaTitle.dart';
import 'welcome_page_part2.dart';

class WelcomePage_part1 extends StatefulWidget {
  const WelcomePage_part1({Key? key}) : super(key: key);

  @override
  State<WelcomePage_part1> createState() => _WelcomePage_part1State();
}

class _WelcomePage_part1State extends State<WelcomePage_part1>{

  @override
  void initState() {
    super.initState();
    verificarToken().then((value) {
      if(value){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

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
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: const WelcomePage_part2()));
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
                  Center(
                    child: TextButton(
                      child: const Text(
                        "Já possuo login!",
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
                                type: PageTransitionType.leftToRight,
                                child: const LoginPage()));
                      },
                    ),
                  )
                ],
              ))
        ]),
      ),
    );
  }

  Future<bool> verificarToken() async{
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    if(sharedPreference.getString('token') != null){
      return true;
    } else{
      return false;
    }
  }

}