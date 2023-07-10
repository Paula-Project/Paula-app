import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/service/prefs_service.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/components/paulaTitle.dart';
import 'package:paula/app/views/home_page.dart';
import 'package:paula/app/views/welcome_page_part1.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.wait([
      PrefsService.isAuth().then((user) {
        print(user);
        if (user != "null") {
          adicionaUsuario(user);
          Future.delayed(
              const Duration(seconds: 1),
              () => {
                    Navigator.of(context).pushAndRemoveUntil(
                        PageTransition(
                            type: PageTransitionType.scale,
                            duration: const Duration(milliseconds: 900),
                            alignment: Alignment.bottomCenter,
                            child: HomePage()),
                        (route) => false)
                  });
        } else {
          Future.delayed(
              const Duration(seconds: 1),
              () => {
                    Navigator.of(context).pushAndRemoveUntil(
                        PageTransition(
                            type: PageTransitionType.scale,
                            duration: const Duration(milliseconds: 900),
                            alignment: Alignment.bottomCenter,
                            child: const WelcomePagePart1()),
                        (route) => false)
                  });
        }
      })
    ]);
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
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: (MediaQuery.of(context).size.height * 0.4),
              child: Image.asset('assets/images/paula/paula01.png')),
          PaulaTitleComponent(),
        ],
      )),
    ));
  }

  adicionaUsuario(user) {
    var User = Provider.of<UsuarioState>(context, listen: false);
    Map<String, dynamic> json = jsonDecode(user);
    User.adicionaUsuario(UsuarioAPI(json['name'], json['username'],
        json['gender'], json['age'], json['birthdate'], json['progress'],
        id: json['id'], token: json['token']));
    return true;
  }
}
