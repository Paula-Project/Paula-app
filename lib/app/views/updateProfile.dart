import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:paula/app/views/person_data_page.dart';

import 'home_page.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _userNameController = TextEditingController();
  final _nickNameController = TextEditingController();

  DateTime _date = DateTime.now();
  var selectedDateTxt = "";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Atualizar Dados',
            textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
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
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsetsDirectional.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Seu Nome",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              Container(height: 5),
              Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 202, 196, 196),
                      blurRadius: 15,
                      offset: Offset(0, 5))
                ]),
                child: TextFormField(
                  controller: _userNameController,
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-ZçÇ'ÁÂãâáÉÊéêÍíÓóôÚú\s]"))
                  ],
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                      fillColor: Color.fromRGBO(241, 241, 241, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8)),
                      isDense: true),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(height: 40),
              const Text("Seu Apelido",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w300)),
              Container(height: 5),
              Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 202, 196, 196),
                      blurRadius: 15,
                      offset: Offset(0, 5))
                ]),
                child: TextFormField(
                  controller: _nickNameController,
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))
                  ],
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 6),
                      isDense: true,
                      fillColor: Color.fromRGBO(241, 241, 241, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8))),
                  obscureText: false,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              Container(height: 40),
              const Text(
                "Data de Nascimento",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              Container(height: 5),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _selectDate(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.date_range,
                      ),
                      Text(
                        selectedDateTxt,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height > 600
                                ? 25
                                : 18,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
              Container(height: 50),
              Center(
                child: Column(
                  children: [
                    Center(
                        child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide.none)),
                      ),
                      onPressed: () {
                        print(_userNameController.text);
                        print(_nickNameController.text);
                        print(selectedDateTxt);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text("Atualizar  "),
                          Icon(Icons.create)
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              Container(height: 100),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide.none)),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("Apagar conta  "),
                            Icon(Icons.delete)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
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
