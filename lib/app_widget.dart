import 'package:flutter/material.dart';
import 'package:paula/app/views/singup_page_part1.dart';
import 'app/views/welcome_page_part1.dart';
import 'app/views/welcome_page_part2.dart';
import 'app/views/welcome_page_part3.dart';
import 'app/views/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        fontFamily: 'Nunito',
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const WelcomePage_part1(),
        "/welcome_part2": (context) => const WelcomePage_part2(),
        "/welcome_part3": (context) => const WelcomePage_part3(),
        "/login": (context) => const LoginPage(),
        "/singup_part1": (context) => const SingupPage()
      },
    );
  }
}
