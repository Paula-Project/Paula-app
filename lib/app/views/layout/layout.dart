import 'package:flutter/material.dart';
import 'package:paula/app/views/home_page.dart';
import 'package:paula/app/views/login_page.dart';
import 'package:paula/app/views/person_data_page.dart';

class Layout extends StatelessWidget {
  final int indexPage;
  final Widget bodyContent;
  const Layout({Key? key, required this.indexPage, required this.bodyContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0,
          title: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => const LoginPage(),
                ),
                (route) => false,
              );
            },
            child: const Icon(
              Icons.logout,
              color: Colors.grey,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: SizedBox(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("57% Completo",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.normal)),
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
        child: bodyContent,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.white,
              blurRadius: 50.0,
              spreadRadius: 30.0,
              offset: Offset.zero)
        ]),
        child: BottomNavigationBar(
            currentIndex: indexPage,
            backgroundColor: Colors.white,
            elevation: 50,
            iconSize: 40,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.black,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(),
                    ),
                    (route) => false,
                  );
                  break;
                case 1:
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PersonData(),
                    ),
                    (route) => false,
                  );
                  break;
              }
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "Perfil"),
            ]),
      ),
    );
  }
}
