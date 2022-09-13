import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/views/components/Input.dart';
import 'package:paula/app/views/login_page.dart';
import 'components/paulaTitle.dart';
import 'home_page.dart';
import 'package:flutter/services.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  static const backgroundBlueGradiend = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 100, 171, 226),
            Color.fromARGB(255, 41, 171, 226)
          ]));

  DateTime _date = DateTime.now();
  var selectedDateTxt;
  List<bool> isSelected = List.generate(3, (int index) => false);

  Future<Null> _selectDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1910, 1, 1),
        lastDate: DateTime.now());

    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
        selectedDateTxt = DateFormat('dd/MM/yyyy').format(_datePicker);
      });
    }
  }

  void initState() {
    selectedDateTxt = DateFormat('dd/MM/yyyy').format(_date);
    super.initState();
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _senhaConfirmaController =
  TextEditingController();
  final TextEditingController _apelidoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: const LoginPage()));
          }
        },
        child: SingleChildScrollView(
          child: Container(
            decoration: backgroundBlueGradiend,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Expanded(
                  flex: 4,
                  child: PaulaTitleComponent(),
                ),
                Expanded(
                  flex: 18,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
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
                        ),
                        Container(
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
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Form(
                                  key: _key,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(30, 20, 30, 0),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Input(
                                            labelInputTxt: 'Apelido',
                                            controller: _apelidoController,
                                            keyboardType: TextInputType.text,
                                            valid: (value) {
                                              if (value!.isEmpty) {
                                                return ' Informe o seu Apelido';
                                              }
                                              if (value.length < 3) {
                                                return 'Tamanho inferior a 3';
                                              }
                                              return null;
                                            },
                                            formatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[a-zA-Z0-9]'))
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                5, 20, 15, 0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "Data de Nascimento",
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 25,
                                                      fontFamily: "Nunito",
                                                      fontWeight:
                                                      FontWeight.w300)),
                                            ),
                                          ),
                                          Container(
                                            height: 5,
                                          ),
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty.all<
                                                  Color>(Colors.white),
                                              foregroundColor:
                                              MaterialStateProperty.all<
                                                  Color>(Colors.blue),
                                            ),
                                            onPressed: () {
                                              _selectDate(context);
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  const Icon(
                                                    Icons.date_range,
                                                  ),
                                                  Text(
                                                    selectedDateTxt,
                                                    style: const TextStyle(
                                                        fontSize: 25,
                                                        fontFamily: "Nunito",
                                                        fontWeight:
                                                        FontWeight.w300),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                          ),
                                          Input(
                                            labelInputTxt: "Nova senha",
                                            obscureTxt: true,
                                            controller: _senhaController,
                                            keyboardType: TextInputType.text,
                                            valid: (value) {
                                              if (value!.trim().isEmpty) {
                                                return 'Informe uma Senha';
                                              }
                                              if (value.trim().length < 4) {
                                                return 'Senha muito pequena';
                                              }
                                              return null;
                                            },
                                          ),
                                          Container(
                                            height: 20,
                                          ),
                                          Input(
                                            labelInputTxt: "Confirmar nova senha",
                                            obscureTxt: true,
                                            controller: _senhaConfirmaController,
                                            keyboardType: TextInputType.text,
                                            valid: (value) {
                                              if (value!.trim().isEmpty) {
                                                return 'Informe uma Senha';
                                              }
                                              if (value.trim().length < 4) {
                                                return 'Senha muito pequena';
                                              }
                                              if (!(_senhaConfirmaController
                                                  .value ==
                                                  _senhaController.value)) {
                                                return 'Senha informada esta diferente';
                                              }
                                              return null;
                                            },
                                          ),
                                          Container(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: 160,
                                            height: 45,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (_key.currentState!
                                                    .validate()) {
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                      context) =>
                                                      const LoginPage(),
                                                    ),
                                                        (route) => false,
                                                  );
                                                }
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
                                              child: const Text("Redefinir Senha",
                                                  style: TextStyle(fontSize: 18)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

