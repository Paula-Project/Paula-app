import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:paula/app/views/components/Input.dart';
import 'package:paula/app/views/singup_page_part2.dart';
import 'components/paulaTitle.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({Key? key}) : super(key: key);

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
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
        locale: const Locale("pt", "BR"),
        lastDate: DateTime.now());

    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
        selectedDateTxt = DateFormat('dd/MM/yyyy').format(_datePicker);
      });
    }
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String _gender = '';

  @override
  void initState() {
    selectedDateTxt = DateFormat('dd/MM/yyyy').format(_date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: backgroundBlueGradiend,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: MediaQuery.of(context).size.height > 700 ? 4 : 2,
                child: const PaulaTitleComponent(),
              ),
              Expanded(
                flex: MediaQuery.of(context).size.height > 700 ? 12 : 10,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text("Vamos nos cadastrar?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height >
                                                    550
                                                ? 30
                                                : 20,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.w300)),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text("Queremos te conhecer!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height >
                                                  550
                                              ? 20
                                              : 15,
                                      fontWeight: FontWeight.w300,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: MediaQuery.of(context).size.height > 700 ? 4 : 6,
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
                              child: Form(
                                key: _key,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width > 330
                                          ? 30
                                          : 10,
                                      20,
                                      MediaQuery.of(context).size.width > 330
                                          ? 30
                                          : 10,
                                      0),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Column(
                                          children: [
                                            Input(
                                              labelInputTxt: "Seu nome",
                                              controller: _nameController,
                                              valid: (value) {
                                                if (value!.isEmpty) {
                                                  return ' Informe o nome';
                                                }
                                                if (value.length < 3) {
                                                  return 'Nome inválido';
                                                }
                                                return null;
                                              },
                                              keyboardType: TextInputType.text,
                                              formatters: [
                                                FilteringTextInputFormatter
                                                    .allow(
                                                        RegExp(r'[a-zA-Z\s]'))
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 20, 15, 0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    "Data de Nascimento",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height >
                                                                600
                                                            ? 25
                                                            : 18,
                                                        fontFamily: "Nunito",
                                                        fontWeight:
                                                            FontWeight.w300)),
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                          .size
                                                          .height >
                                                      550
                                                  ? 5
                                                  : 0,
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
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height >
                                                                  600
                                                              ? 25
                                                              : 18,
                                                          fontFamily: "Nunito",
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                          .size
                                                          .height >
                                                      550
                                                  ? 20
                                                  : 5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 15, 0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text("Gênero",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height >
                                                                600
                                                            ? 25
                                                            : 18,
                                                        fontFamily: "Nunito",
                                                        fontWeight:
                                                            FontWeight.w300)),
                                              ),
                                            ),
                                            Container(
                                              height: 5,
                                            ),
                                            ToggleButtons(
                                              onPressed: (int index) {
                                                setState(() {
                                                  switch (index) {
                                                    case 0:
                                                      _gender = "female";
                                                      break;
                                                    case 1:
                                                      _gender = "male";
                                                      break;
                                                    case 2:
                                                      _gender = "other";
                                                  }
                                                  for (int buttonIndex = 0;
                                                      buttonIndex <
                                                          isSelected.length;
                                                      buttonIndex++) {
                                                    if (buttonIndex == index) {
                                                      isSelected[buttonIndex] =
                                                          !isSelected[
                                                              buttonIndex];
                                                    } else {
                                                      isSelected[buttonIndex] =
                                                          false;
                                                    }
                                                  }
                                                });
                                              },
                                              borderWidth: 0,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: "Nunito",
                                                  fontWeight: FontWeight.w300),
                                              isSelected: isSelected,
                                              color: Colors.grey,
                                              selectedColor: Colors.blue,
                                              fillColor: const Color.fromARGB(
                                                  25, 3, 168, 244),
                                              hoverColor: Colors.blueAccent,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          60) /
                                                      3,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.girl_outlined,
                                                        size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height >
                                                                600
                                                            ? 75
                                                            : 50,
                                                      ),
                                                      Text(
                                                        "MULHER",
                                                        style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height >
                                                                  600
                                                              ? 25
                                                              : 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          60) /
                                                      3,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.boy_outlined,
                                                        size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height >
                                                                600
                                                            ? 75
                                                            : 50,
                                                      ),
                                                      Text(
                                                        "HOMEM",
                                                        style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height >
                                                                  600
                                                              ? 25
                                                              : 15,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          60) /
                                                      3,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .transgender_outlined,
                                                        size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height >
                                                                600
                                                            ? 75
                                                            : 50,
                                                      ),
                                                      Text(
                                                        "OUTRO",
                                                        style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height >
                                                                  600
                                                              ? 25
                                                              : 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .height >
                                                      550
                                                  ? 160
                                                  : 140,
                                              height: MediaQuery.of(context)
                                                          .size
                                                          .height >
                                                      550
                                                  ? 50
                                                  : 35,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  if (_key.currentState!
                                                      .validate()) {
                                                    if (calcAge() > 5 &&
                                                        (isSelected[0] ||
                                                            isSelected[1] ||
                                                            isSelected[2])) {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                SingupPage2(
                                                              name:
                                                                  _nameController
                                                                      .text,
                                                              date: _date,
                                                              gender: _gender,
                                                            ),
                                                          ));
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    41,
                                                                    171,
                                                                    226),
                                                            content: Text(
                                                              'Data de Nascimento inválida (aluno deve possuir no minimo 5 anos)'
                                                              ' e/ou genêro não selecionado',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                      );
                                                    }
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
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              side: BorderSide
                                                                  .none)),
                                                ),
                                                child: const Text("Próximo",
                                                    style: TextStyle(
                                                        fontSize: 25)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int calcAge() {
    DateTime hoje = DateTime.now();
    int idade = hoje.year - _date.year;
    if (hoje.month < _date.month) {
      idade--;
    } else if (hoje.month == _date.month) {
      if (hoje.day < _date.day) {
        idade--;
      }
    }
    return idade;
  }
}
