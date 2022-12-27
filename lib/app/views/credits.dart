import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/views/home_page.dart';
import 'package:paula/app/views/login_page.dart';
import 'package:paula/app/views/person_data_page.dart';

class CreditsPage extends StatefulWidget {
  const CreditsPage({Key? key})
      : super(key: key);

  @override
  State<CreditsPage> createState() => _CreditsPage();
}

class _CreditsPage extends State<CreditsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: OutlinedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: HomePage()));
          },
          child: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: (MediaQuery.of(context).size.height * 0.04)),
              const Text(
              "Créditos",
              style: TextStyle(
                color: Colors.black, 
                fontSize: 35.0, 
                fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: (MediaQuery.of(context).size.height * 0.035)),
              /////////////////////////////////////////////////////////////// Images
              const Text(
              "Este é um aplicativo desenvolvido pela \n Universidade de Brasília",
              style: TextStyle(color: Colors.black, 
              fontSize: 17.0, 
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: (MediaQuery.of(context).size.height * 0.018)),
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/UnB_logo.png", height: 60,),
                    SizedBox(width: (MediaQuery.of(context).size.width * 0.1)),
                    Image.asset("assets/images/paula/paula01.png", height: 80),
                  ],
                )
                ),
              SizedBox(height: (MediaQuery.of(context).size.height * 0.02)),
              /////////////////////////////////////////////////////////////// Responsáveis
              const Text(
              "Responsáveis",
              style: TextStyle(color: Colors.black, 
              fontSize: 20.0, 
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: (MediaQuery.of(context).size.height * 0.02)),
              const Text(
              "Luiza Yoko (Orientadora)\nEmerson Teles (Desenvolvedor)\nThalis Ianzer (Desenvolvedor)",
              style: TextStyle(color: Colors.black, 
              fontSize: 16.0, 
              fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: (MediaQuery.of(context).size.height * 0.05)),
              /////////////////////////////////////////////////////////////// Participação
              const Text(
              "Participação",
              style: TextStyle(color: Colors.black, 
              fontSize: 20.0, 
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: (MediaQuery.of(context).size.height * 0.02)),
              const Text(
              "Fernanda Marcílio (Ilustradora)\nNOSSA PAULA (Dubladora)",
              style: TextStyle(color: Colors.black, 
              fontSize: 16.0, 
              fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: (MediaQuery.of(context).size.height * 0.085)),
              /////////////////////////////////////////////////////////////// Contato
              const Text(
              "Contato",
              style: TextStyle(color: Colors.black, 
              fontSize: 20.0, 
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: (MediaQuery.of(context).size.height * 0.02)),
              const Text(
              "aplicativopaulaunb@gmail.com\nluizayoko@gmail.com",
              style: TextStyle(color: Colors.black, 
              fontSize: 16.0, 
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          backgroundColor: Colors.white,
          elevation: 100,
          iconSize: 40,
          selectedItemColor: Colors.black,
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
    );
  }
}