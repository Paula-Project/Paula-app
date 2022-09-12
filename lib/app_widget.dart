import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paula/app/views/singup_page_part1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/views/welcome_page_part1.dart';
import 'app/views/welcome_page_part2.dart';
import 'app/views/welcome_page_part3.dart';
import 'app/views/login_page.dart';
import 'app/views/home_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool isAuthenticated = false;
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      verificarToken().then((value) {
        if (value) {
          isAuthenticated = true;
        }
      });
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        fontFamily: 'Nunito',
      ),
      initialRoute: "/",
      locale: const Locale("pt", "BR"),
      routes: {
        "/": (context) => WelcomePagePart1(),
        "/welcome_part2": (context) => const WelcomePagePart2(),
        "/welcome_part3": (context) => const WelcomePagePart3(),
        "/login": (context) => const LoginPage(),
        "/singup_part1": (context) => const SingupPage(),
        "/home": (context) => HomePage()
      },
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
