import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:paula/app/controllers/web/user_controller.dart';
import 'package:paula/app/http/app_exceptions.dart';
import 'package:paula/app/http/base_client.dart';
import 'package:paula/app/http/webclient.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/service/prefs_service.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/utils/calc_age.dart';
import 'package:paula/app/views/components/SnackBar.dart';
import 'package:paula/app/views/person_data_page.dart';
import 'package:paula/app/views/welcome_page_part1.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  late UsuarioAPI usuario;
  late DateTime _date;
  var selectedDateTxt = "";

  Future<Null> _selectDate(BuildContext context, currentDate) async {
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.parse(currentDate),
        fieldHintText: currentDate,
        fieldLabelText: currentDate,
        currentDate: DateTime.parse(currentDate),
        firstDate: DateTime(1910, 1, 1),
        locale: const Locale("pt", "BR"),
        lastDate: DateTime.now());

    if (datePicker != null && datePicker != _date) {
      setState(() {
        _date = datePicker;
        selectedDateTxt = DateFormat('dd/MM/yyyy').format(datePicker);
      });
    }
  }

  @override
  void initState() {
    var usuarioState = Provider.of<UsuarioState>(context, listen: false);
    usuario = usuarioState.getUsuario();
    _nameController.text = usuario.name;
    _usernameController.text = usuario.username;
    selectedDateTxt =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(usuario.birthdate!));
    _date = DateTime.parse(usuario.birthdate!);
    super.initState();
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
                builder: (BuildContext context) => PersonData(),
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
                  controller: _nameController,
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
                  controller: _usernameController,
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
                  _selectDate(context, usuario.birthdate);
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
                        update();
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
                        onPressed: () {
                          delete();
                        },
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

  Future update() async {
    String json = jsonEncode({
      "name": _nameController.text,
      "username": usuario.username,
      "new_username": _usernameController.text,
      "gender": usuario.gender,
      "birthdate": DateFormat('yyyy-MM-dd').format(_date),
      "age": calcAge(_date),
      "progress": usuario.progress,
      "token": usuario.token
    });
    var listaDeClientes = Provider.of<UsuarioState>(context, listen: false);
    await UserController().updateUser(json).then((res) => {
          if (res is UsuarioAPI)
            {
              listaDeClientes.adicionaUsuario(res),
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => PersonData(),
                ),
                (route) => false,
              ),
            },
        });
  }

  delete() async {
    var user = Provider.of<UsuarioState>(context, listen: false);
    await UserController().deleteUser(usuario.id).then((res) => {
          if (res)
            {
              PrefsService.removeUser().then((e) {
                user.resetUSER();
              }),
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => const WelcomePagePart1(),
                ),
                (route) => false,
              ),
            },
        });
  }
}
