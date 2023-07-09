import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/views/components/Input.dart';
import 'package:paula/app/views/login_page.dart';
import 'package:provider/provider.dart';
import '../http/webclient.dart';
import '../state/usuario_state.dart';
import 'components/paulaTitle.dart';
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

  @override
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
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1),
      child: Scaffold(
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("Redefinir Senha",
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
                                    child: Text("Guarde sua senha nova em lugar seguro!",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Form(
                                      key: _key,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 20, 30, 0),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Input(
                                                labelInputTxt: 'Apelido',
                                                controller: _apelidoController,
                                                keyboardType: TextInputType.text,
                                                valid: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Apelido deve possuir no minimo 3 caracteres';
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
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text("Data de Nascimento",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 25,
                                                        fontFamily: "Nunito",
                                                        fontWeight:
                                                            FontWeight.w300)),
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
                                                    return 'Senha deve possuir no minimo 4 caracteres';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              Input(
                                                labelInputTxt:
                                                    "Confirmar nova senha",
                                                obscureTxt: true,
                                                controller:
                                                    _senhaConfirmaController,
                                                keyboardType: TextInputType.text,
                                                valid: (value) {
                                                  if (!(_senhaConfirmaController
                                                          .value ==
                                                      _senhaController.value)) {
                                                    return 'Senha informada esta diferente';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              SizedBox(
                                                width: 220,
                                                height: 45,
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    if (_key.currentState!
                                                        .validate()) {
                                                      if (calcAge() > 5) {
                                                        if (await changePassword()) {
                                                          Navigator.of(context)
                                                              .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  const LoginPage(),
                                                            ),
                                                            (route) => false,
                                                          );
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                                      content: Text(
                                                                          'Erro ao alterar senha \n Dados incorretos')));
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        'Você deve ter mais de 5 anos para usar a Paula')));
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
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                            side: BorderSide.none)),
                                                  ),
                                                  child: const Text(
                                                      "Redefinir Senha",
                                                      style:
                                                          TextStyle(fontSize: 18)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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

  Future<bool> changePassword() async {
    if (await resetAuthenticatePassword(
        _apelidoController.text, DateFormat('yyyy-MM-dd').format(_date))) {
      debugPrint("Erro ao alterar senha2");
      if (await resetPassword(_apelidoController.text, _senhaController.text)) {
        debugPrint("Erro ao alterar senha3");
        return true;
      }
      debugPrint("Erro ao alterar senha");
      return false;
    } else {
      return false;
    }
  }
}
