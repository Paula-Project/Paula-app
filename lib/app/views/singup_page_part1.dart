import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:paula/app/views/singup_page_part2.dart';
import 'components/paulaTitle.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

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
  List<bool> isSelected = List.generate(3, (int) => false);
  String nickname = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    var pickeddate;
    var pickedtime;
    String date = "";
    DateTime selectedDate = DateTime.now();

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
                                  fontWeight: FontWeight.w500)),
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
                                        const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(15, 0, 15, 0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Seu Nome",
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
                                          child: TextField(
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
                                            obscureText: true,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            onChanged: (value) {},
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                        ),
                                        FloatingActionButton.extended(
                                          onPressed: () {
                                            DatePicker.showDatePicker(context,
                                                showTitleActions: true,
                                                minTime: DateTime(1910, 1, 1),
                                                maxTime: DateTime(2022, 12, 31),
                                                onChanged: (date) {
                                              print('change $date');
                                              setState(() {
                                                pickeddate = "${date.day}";
                                              });
                                            }, onConfirm: (date) {
                                              print('confirm $date');
                                              setState(() {
                                                pickeddate =
                                                    "Picked Date is : ${date.day}/${date.month}/${date.year}";
                                              });
                                            }, currentTime: DateTime.now());
                                          },
                                          label: Text(
                                            "Data de Nascimento",
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 25,
                                                fontFamily: "Nunito",
                                                fontWeight: FontWeight.w500),
                                          ),
                                          icon: Icon(Icons.date_range),
                                          backgroundColor: Colors.white,
                                        ),
                                        Container(
                                          height: 20,
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(15, 0, 15, 0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Gênero",
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 25,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30, bottom: 30),
                                          child: Transform.scale(
                                            scale: 2.5,
                                            child: ToggleButtons(
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.boy_outlined,
                                                      color: Colors.grey,
                                                    ),
                                                    Text("HOMEM",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blueAccent,
                                                            fontSize: 7,
                                                            fontFamily:
                                                                "Nunito",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.girl_outlined,
                                                      color: Colors.grey,
                                                    ),
                                                    Text("MULHER",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blueAccent,
                                                            fontSize: 7,
                                                            fontFamily:
                                                                "Nunito",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .transgender_outlined,
                                                      color: Colors.grey,
                                                    ),
                                                    Text("OUTRO",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blueAccent,
                                                            fontSize: 7,
                                                            fontFamily:
                                                                "Nunito",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                  ],
                                                ),
                                              ],
                                              onPressed: (int index) {
                                                setState(() {
                                                  for (int buttonIndex = 0;
                                                      buttonIndex <
                                                          isSelected.length;
                                                      buttonIndex++) {
                                                    if (buttonIndex == index) {
                                                      isSelected[buttonIndex] =
                                                          true;
                                                    } else {
                                                      isSelected[buttonIndex] =
                                                          false;
                                                    }
                                                  }
                                                });
                                              },
                                              isSelected: isSelected,
                                            ),
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
