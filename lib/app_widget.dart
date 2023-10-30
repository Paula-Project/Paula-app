import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paula/app/views/singup_page_part1.dart';
import 'package:paula/app/views/splash_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:paula/app/views/welcome_page_part1.dart';
import 'package:paula/app/views/welcome_page_part2.dart';
import 'package:paula/app/views/welcome_page_part3.dart';
import 'package:paula/app/views/login_page.dart';
import 'package:paula/app/views/home_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        fontFamily: 'Nunito',
      ),
      initialRoute: "/",
      locale: const Locale("pt", "BR"),
      supportedLocales: const [
        Locale("pt", "BR"),
      ],
      getPages: [
        GetPage(name: '/', page: () => const SplashView()),
        GetPage(name: '/home', page: () => HomePage()),
      ],
    );
  }
}
