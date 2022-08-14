import 'package:flutter/material.dart';
import 'package:paula/app/views/login_page.dart';
import 'package:paula/app/views/person_data_page.dart';

import 'components/module_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const BackgroundBlueGradiend = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color.fromARGB(255, 100, 171, 226),
        Color.fromARGB(255, 41, 171, 226)
      ]));

  final int indexPage = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0,
          title: OutlinedButton(
            onPressed: () {},
            child: const Icon(
              Icons.logout,
              color: Colors.grey,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: SizedBox(
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("57% Completo",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    LinearProgressIndicator(
                      value: 0.57,
                      backgroundColor: Colors.grey,
                      color: Color.fromARGB(255, 89, 233, 95),
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ],
                ),
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
          child: Column(children: const [
            ModuleButton(Alignment.centerLeft, "Vogais", HomePage()),
            ModuleButton(Alignment.centerRight, "Consoantes \n parte 1",HomePage()),
            ModuleButton(Alignment.centerLeft, "Consoantes \n parte 2",HomePage()),
            ModuleButton(Alignment.centerRight, "Primeiras \n sílabas",HomePage()),
            ModuleButton(Alignment.centerLeft, "Consoantes \n parte 3",HomePage()),
            ModuleButton(Alignment.centerRight, "Palavras 1",HomePage()),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexPage,
          backgroundColor: Colors.white,
          elevation: 100,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.black,
          onTap: (index){
            switch (index){
              case 1:
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                    const PersonData(),
                  ),
                      (route) => false,
                );
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ]),
    );
  }
}
