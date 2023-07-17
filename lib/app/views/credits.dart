import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/views/home_page.dart';
import 'package:paula/app/views/person_data_page.dart';

class CreditsPage extends StatefulWidget {
  const CreditsPage({Key? key}) : super(key: key);

  @override
  State<CreditsPage> createState() => _CreditsPage();
}

class _CreditsPage extends State<CreditsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Créditos",
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          centerTitle: true,
          leading: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(),
                ),
                (route) => false,
              );
            },
            child: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.grey,
            ),
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: (MediaQuery.of(context).size.height * 0.02)),
                SizedBox(height: (MediaQuery.of(context).size.height * 0.015)),
                const AutoSizeText(
                  "Este é um aplicativo desenvolvido pela \n Universidade de Brasília\nDecanato de Extensão Decanato de Extensão REPE - Pólo Paranoá",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                /////////////////////////////////////////////////////////////// Images
                SizedBox(
                    height: (MediaQuery.of(context).size.height * 0.13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/UnB_logo.png",
                          height: 60,
                        ),
                        SizedBox(
                            width: (MediaQuery.of(context).size.width * 0.1)),
                        Image.asset("assets/images/paula/paula01.png",
                            height: 80),
                      ],
                    )),
                /////////////////////////////////////////////////////////////// Responsáveis
                const AutoSizeText(
                  "Responsáveis",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: (MediaQuery.of(context).size.height * 0.02)),
                const AutoSizeText(
                  "Luiza Yoko (Orientadora)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "luizayoko@gmail.com",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "Emerson Teles (Desenvolvedor)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "emersonteles21@gmail.com",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "Thalis Ianzer (Desenvolverdor)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "thaliscezar@gmail.com",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "Fellipe Silva (Desenvolvedor)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "http://github.com/fellipepcs",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "Júlia Vitória (Desenvolvedora)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "http://github.com/juhvitoria4",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: (MediaQuery.of(context).size.height * 0.025)),
                /////////////////////////////////////////////////////////////// Contato
                const AutoSizeText(
                  "Contato",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: (MediaQuery.of(context).size.height * 0.01)),
                const AutoSizeText(
                  "aplicativopaulaunb@gmail.com",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: (MediaQuery.of(context).size.height * 0.03)),
                /////////////////////////////////////////////////////////////// Participação
                const AutoSizeText(
                  "Participação",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: (MediaQuery.of(context).size.height * 0.02)),
                const AutoSizeText(
                  "Fernanda Marcílio (Ilustradora)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "fernandas.marcilio@gmail.com",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "Ana Karolliny Dias (Dubladora)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "sand36serg37@gmail.com",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "Caio Berg (Desenvolvedor)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "http://github.com/Caio-bergbjj",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "Mateus Almeida (Desenvolvedor)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "http://github.com/Mateuszinnn",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "Lucas de Pádua (Desenvolvedor)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "http://github.com/Padualb",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "Pedro Lucas (Desenvolvedor)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const AutoSizeText(
                  "http://github.com/pedrolucas12",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: (MediaQuery.of(context).size.height * 0.02)),
              ],
            ),
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
