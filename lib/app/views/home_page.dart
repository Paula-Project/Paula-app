import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
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
            actions: [ Center(
              child: Text("57% Completo",
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
                ),
              ]),
              
          body: LinearProgressIndicator(
              value: 57,
              backgroundColor: Colors.white70,
              color:  Color.fromARGB(255, 89, 233, 95),
              semanticsLabel: 'Linear progress indicator',
              ),
          
          /*bottomNavigationBar: BottomNavigationBar(
            items: [],)
          )*/
        );
      }
}