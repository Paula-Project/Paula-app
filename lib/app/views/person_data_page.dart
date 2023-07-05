import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/layout/layout.dart';
import 'package:paula/app/views/welcome_page_part1.dart';
import 'package:provider/provider.dart';

class PersonData extends StatelessWidget {
  PersonData({Key? key}) : super(key: key);
  final List selosOn = [
    "assets/images/selos/Selo_vogais.png",
    "assets/images/selos/Selo_diario_off.png",
    "assets/images/selos/Selo_mensal_off.png",
    "assets/images/selos/Selo_palavras_off.png",
    "assets/images/selos/Selo_silabas_off.png",
  ];
  final List selosOff = [
    "assets/images/selos/Selo_vogais_off.png",
    "assets/images/selos/Selo_diario_off.png",
    "assets/images/selos/Selo_mensal_off.png",
    "assets/images/selos/Selo_palavras_off.png",
    "assets/images/selos/Selo_silabas_off.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Layout(
      indexPage: 1,
      bodyContent: Consumer<UsuarioState>(
        builder: (context, usuarioState, child) {
          UsuarioAPI usuarioLogado = usuarioState.getUsuario();
          List<String> nameList = usuarioLogado.name.split(' ');
          String name = nameList.length > 1
              ? nameList.getRange(0, 2).join(" ")
              : nameList[0];

          var dateTxt = DateFormat('dd/MM/yyyy')
              .format(DateTime.parse(usuarioLogado.birthdate));
          var gender = ' ';
          switch (usuarioLogado.gender) {
            case 'male':
              gender = 'Masculino';
              break;
            case 'female':
              gender = 'Feminino';
              break;
            case 'other':
              gender = 'Outro';
              break;
          }
          return Container(
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
                      margin: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText(
                              name,
                              maxFontSize: 25,
                              minFontSize: 20,
                              maxLines: 2,
                              softWrap: true,
                              wrapWords: true,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            AutoSizeText(
                              '@${usuarioLogado.username}',
                              maxFontSize: 25,
                              minFontSize: 18,
                              softWrap: false,
                              wrapWords: false,
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(100, 207, 218, 216),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  margin: const EdgeInsetsDirectional.only(top: 30, bottom: 30),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Dados Pessoais",
                        softWrap: true,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AutoSizeText("Idade: ${usuarioLogado.age}",
                          maxFontSize: 20,
                          minFontSize: 20,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20)),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Data de nascimento: $dateTxt",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20)),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Gênero: $gender",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20)),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide.none)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const WelcomePagePart1()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text("Editar dados   "),
                                Icon(Icons.create)
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(100, 207, 218, 216),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Conquistas",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                            spacing: MediaQuery.of(context).size.width / 14,
                            runSpacing: 30,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            alignment: WrapAlignment.center,
                            children: usuarioLogado.progress >= 10
                                ? selosOn
                                    .map((e) => Image.asset(
                                          e,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                        ))
                                    .toList()
                                : selosOff
                                    .map((e) => Image.asset(
                                          e,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                        ))
                                    .toList()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
