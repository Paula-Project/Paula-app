import 'package:flutter/material.dart';

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
        appBar: AppBar(backgroundColor: Colors.white70, actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("57% Completo",

              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
            LinearProgressIndicator(
            value: 57,
            backgroundColor: Colors.white70,
            color: Color.fromARGB(255, 89, 233, 95),
            semanticsLabel: 'Linear progress indicator',
          ),
          ],
          ),
        ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
            child: Column(
              children:[
                Align(
                  alignment: Alignment.centerLeft,

                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120.0, 120.0),
                      shape: CircleBorder(),

                      primary: Colors.blue, // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
                    child: const Text("Vogais",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.centerRight,

                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(120.0, 120.0),
                    shape: CircleBorder(),

                    primary: Colors.blue, // <-- Button color
                    onPrimary: Colors.red, // <-- Splash color
                  ),
                  child: const Text("Consoantes \n parte 1",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,

                      fontSize: 17,
                      fontWeight: FontWeight.bold,

                  ),
                  ),
                ),
              ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120.0, 120.0),
                      shape: CircleBorder(),

                      primary: Colors.blue, // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
                    child: const Text("Consoantes \n parte 2",
                        textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,

                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120.0, 120.0),
                      shape: CircleBorder(),

                      primary: Colors.blue, // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
                    child: const Text("Primeiras \n sílabas",
                        textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,

                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120.0, 120.0),
                      shape: CircleBorder(),

                      primary: Colors.blue, // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
                    child: const Text("Consoantes \n parte 3",
                        textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,

                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120.0, 120.0),
                      shape: CircleBorder(),

                      primary: Colors.blue, // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
                    child: const Text("Palavras 1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ]

            ),
          ),
        )

        /*bottomNavigationBar: BottomNavigationBar(
            items: [],)
          )*/
        );
  }
}
