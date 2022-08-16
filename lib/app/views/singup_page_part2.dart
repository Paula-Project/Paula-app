import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'components/paulaTitle.dart';
import 'home_page.dart';
import 'package:flutter/services.dart';

class SingupPage2 extends StatefulWidget {
  const SingupPage2({Key? key}) : super(key: key);

  @override
  State<SingupPage2> createState() => _SingupPageState2();
}

class _SingupPageState2 extends State<SingupPage2> {
  static const BackgroundBlueGradiend = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color.fromARGB(255, 100, 171, 226),
        Color.fromARGB(255, 41, 171, 226)
      ]));
  List<bool> isSelected = List.generate(3, (int) => false);
  String nickname = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BackgroundBlueGradiend,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Expanded(
              flex: 4,
              child: PaulaTitleComponent(),
            ),
            Expanded(
              flex: 12,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                        child: Column(
                          children: const [
                            Text("Informações de Acesso",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.w500)),
                            Text(
                                "Você usará essas informações para acessar a Paula Novamente",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  height: 1.5,
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Column(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Apelido",
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 25,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ),
                                        Container(
                                          decoration:
                                              const BoxDecoration(boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromARGB(50, 0, 0, 0),
                                              blurRadius: 15,
                                              offset: Offset(0, 5),
                                            ),
                                          ]),
                                          child: TextFormField(
                                            maxLength: 20,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[a-zA-Z0-9]'))
                                            ],
                                            validator: (value) {
                                              if (value!.isEmpty)
                                                return ' Informe o nome';
                                              if (value.length < 3)
                                                return 'Tamanho inferior a 3';
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 4),
                                              isDense: true,
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            style: const TextStyle(
                                                color: Colors.black),
                                            onChanged: (value) {},
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Senha",
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 25,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromARGB(50, 0, 0, 0),
                                              blurRadius: 15,
                                              offset: Offset(0, 5),
                                            ),
                                          ]),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 6),
                                              isDense: true,
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            obscureText: true,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            onChanged: (value) {},
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Confirmar Senha",
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 25,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromARGB(50, 0, 0, 0),
                                              blurRadius: 15,
                                              offset: Offset(0, 5),
                                            ),
                                          ]),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 6),
                                              isDense: true,
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            obscureText: true,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            onChanged: (value) {},
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 160,
                                          height: 50,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const HomePage(),
                                                  ));
                                            },
                                            onHover: (hover) {},
                                            style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.blue),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      side: BorderSide.none)),
                                            ),
                                            child: const Text("Cadastrar",
                                                style: TextStyle(fontSize: 25)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
