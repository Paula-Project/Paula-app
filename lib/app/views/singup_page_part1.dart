import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:paula/app/views/components/Input.dart';
import 'package:paula/app/views/singup_page_part2.dart';
import 'components/paulaTitle.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({Key? key}) : super(key: key);

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  static const BackgroundBlueGradiend = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color.fromARGB(255, 100, 171, 226),
        Color.fromARGB(255, 41, 171, 226)
      ]));

  String nickname = '';
  String password = '';
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

  @override
  void initState() {
    selectedDateTxt = DateFormat('dd/MM/yyyy').format(_date);
    super.initState();
  }

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
                    Center(
                      child: Column(
                        children: const [
                          Text("Vamos nos cadastrar?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.w300)),
                          Text("Queremos te conhecer!",
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
                                        const Input(labelInputTxt: "Seu nome"),
                                        Container(
                                          height: 20,
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 0, 15, 0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Data de Nascimento",
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
                                            padding: const EdgeInsets.all(8.0),
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
                                        const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 0, 15, 0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Gênero",
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
                                        ToggleButtons(
                                          onPressed: (int index) {
                                            setState(() {
                                              for (int buttonIndex = 0;
                                                  buttonIndex <
                                                      isSelected.length;
                                                  buttonIndex++) {
                                                if (buttonIndex == index) {
                                                  isSelected[buttonIndex] =
                                                      !isSelected[buttonIndex];
                                                } else {
                                                  isSelected[buttonIndex] =
                                                      false;
                                                }
                                              }
                                            });
                                          },
                                          borderWidth: 0,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontFamily: "Nunito",
                                              fontWeight: FontWeight.w300),
                                          isSelected: isSelected,
                                          color: Colors.grey,
                                          selectedColor: Colors.blue,
                                          fillColor:
                                              Color.fromARGB(25, 3, 168, 244),
                                          hoverColor: Colors.blueAccent,
                                          children: <Widget>[
                                            Container(
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      60) /
                                                  3,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.girl_outlined,
                                                    size: 75,
                                                  ),
                                                  Text(
                                                    "MULHER",
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      60) /
                                                  3,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.boy_outlined,
                                                    size: 75,
                                                  ),
                                                  Text(
                                                    "HOMEM",
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      60) /
                                                  3,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.transgender_outlined,
                                                    size: 75,
                                                  ),
                                                  Text(
                                                    "OUTRO",
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
                                          width: 160,
                                          height: 50,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const SingupPage2(),
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
                                            child: const Text("Próximo",
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
