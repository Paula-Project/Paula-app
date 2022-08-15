import 'package:flutter/material.dart';
import 'package:paula/app/views/task_page.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 3.0,
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
                      color: Color.fromARGB(255, 41, 171, 226),
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ],
                ),
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(50, 30, 50, 50),
          child: Column(children: const [
            ModuleButton(Alignment.centerLeft, "Vogais", TaskPage(), Colors.blue),
            ModuleButton(Alignment.centerRight, "Consoantes \n Parte 1",HomePage(), Colors.grey),
            ModuleButton(Alignment.centerLeft, "Consoantes \n Parte 2",HomePage(), Colors.grey),
            ModuleButton(Alignment.centerRight, "Primeiras \n sílabas",HomePage(), Colors.grey),
            ModuleButton(Alignment.centerLeft, "Consoantes \n Parte 3",HomePage(), Colors.grey),
            ModuleButton(Alignment.centerRight, "Palavras 1",HomePage(), Colors.grey),
          ]),
        ),
      ),
      bottomNavigationBar:

      Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black45,
                blurRadius: 30.0,
                offset: Offset(0.0, 0.75)
            ),
          ],
        ),

        child: BottomNavigationBar(

            backgroundColor: Colors.white70,

            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.black,
            items:  const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            ]),
      ),
    );
  }
}
