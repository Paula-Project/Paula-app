import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
              flex: 3,
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
                      height: 20,
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
                            child: Column(
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 20,
                                      ),
                                      const Text("Seu Nome",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 20,
                                              fontFamily: "Nunito",
                                              fontWeight: FontWeight.w500)),
                                      Container(
                                        decoration:
                                            const BoxDecoration(boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(50, 0, 0, 0),
                                            blurRadius: 15,
                                            offset: Offset(0, 5),
                                          ),
                                        ]),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 4),
                                            isDense: true,
                                            hintText: '****',
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
                                          onChanged: (value) {
                                            password = value;
                                          },
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                      ),
                                      const Text("Profissão",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 20,
                                              fontFamily: "Nunito",
                                              fontWeight: FontWeight.w500)),
                                      Container(
                                        decoration:
                                            const BoxDecoration(boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(50, 0, 0, 0),
                                            blurRadius: 15,
                                            offset: Offset(0, 5),
                                          ),
                                        ]),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 6),
                                            isDense: true,
                                            hintText: '****',
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
                                          onChanged: (value) {
                                            password = value;
                                          },
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
                                              maxTime: DateTime(2022, 12, 31), onChanged: (date) {
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
                                        label: Text("Data de Nascismento,",
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 20,
                                                fontFamily: "Nunito",
                                                fontWeight: FontWeight.w500),
                                        ),
                                        icon: Icon(Icons.date_range),
                                        backgroundColor: Color.fromARGB(255, 100, 171, 226),


                                      ),

                                      Container(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
