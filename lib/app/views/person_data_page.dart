import 'package:flutter/material.dart';

import 'home_page.dart';

class PersonData extends StatelessWidget {
  const PersonData({Key? key}) : super(key: key);

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
      body: Container(
        margin: const EdgeInsetsDirectional.all(30),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 50,
                  child: LayoutBuilder(builder: (context, constraint) {
                    return IconButton(
                      icon: const Icon(Icons.person_outline_sharp),
                      iconSize: constraint.maxWidth / (1.4),
                      color: Colors.white,
                      onPressed: () {},
                    );
                  }),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "@apelido",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      Text(
                        'Nome',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(100, 207, 218, 216) ,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin: const EdgeInsetsDirectional.only(top: 30,bottom: 30),
              height: MediaQuery.of(context).size.height/4.2 ,
              child: Column(
                children: const <Widget>[

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          backgroundColor: Colors.white,
          elevation: 100,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage(),
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


