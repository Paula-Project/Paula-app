import 'package:flutter/material.dart';
import 'package:paula/app/http/webclient.dart';
import 'package:paula/app/model/usuario.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/components/Input.dart';
import 'package:paula/app/views/components/Loading.dart';
import 'package:provider/provider.dart';
import 'components/paulaTitle.dart';
import 'home_page.dart';
import 'package:flutter/services.dart';

class SingupPage2 extends StatefulWidget {
  final String name;
  final DateTime date;
  final String gender;

  const SingupPage2(
      {this.name = '', required this.date, required this.gender, Key? key})
      : super(key: key);

  @override
  State<SingupPage2> createState() => _SingupPageState2();
}

class _SingupPageState2 extends State<SingupPage2> {
  static const backgroundBlueGradiend = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color.fromARGB(255, 100, 171, 226),
        Color.fromARGB(255, 41, 171, 226)
      ]));
  List<bool> isSelected = List.generate(3, (int index) => false);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _senhaConfirmaController =
      TextEditingController();
  final TextEditingController _apelidoController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
      final mediaQueryData = MediaQuery.of(context);
      if(isLoading) {
        return const LoadingPage();
      } else {
        return MediaQuery(
          data: mediaQueryData.copyWith(textScaleFactor: 1),
          child: Scaffold(
            body: SingleChildScrollView(
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
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Center(
                                  child: Column(
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text("Informações de Acesso",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                            .size
                                                            .height >
                                                        550
                                                    ? 30
                                                    : 20,
                                                fontFamily: "Nunito",
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      Text(
                                          "Você usará essas informações para acessar a Paula novamente",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height >
                                                    550
                                                ? 20
                                                : MediaQuery.of(context)
                                                            .size
                                                            .height >
                                                        400
                                                    ? 15
                                                    : 13,
                                            fontWeight: FontWeight.w300,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 4,
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
                                              MediaQuery.of(context).size.width >
                                                      330
                                                  ? 30
                                                  : 10,
                                              20,
                                              MediaQuery.of(context).size.width >
                                                      330
                                                  ? 30
                                                  : 10,
                                              0),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Input(
                                                  labelInputTxt: 'Apelido',
                                                  controller: _apelidoController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  valid: (value) {
                                                    if (value!.isEmpty) {
                                                      return ' Informe o apelido';
                                                    }
                                                    if (value.length < 3) {
                                                      return 'Apelido deve possuir no minimo 3 caracteres';
                                                    }
                                                    return null;
                                                  },
                                                  formatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp(
                                                            r'[a-zA-Z0-9]'))
                                                  ],
                                                ),
                                                Container(
                                                  height: MediaQuery.of(context)
                                                              .size
                                                              .height >
                                                          550
                                                      ? 20
                                                      : 5,
                                                ),
                                                Input(
                                                  labelInputTxt: "Senha",
                                                  obscureTxt: true,
                                                  controller: _senhaController,
                                                  keyboardType:
                                                      TextInputType.text,
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
                                                Container(
                                                  height: MediaQuery.of(context)
                                                              .size
                                                              .height >
                                                          550
                                                      ? 20
                                                      : 5,
                                                ),
                                                Input(
                                                  labelInputTxt:
                                                      "Confirmar senha",
                                                  obscureTxt: true,
                                                  controller:
                                                      _senhaConfirmaController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  valid: (value) {
                                                    if (!(_senhaConfirmaController
                                                            .value ==
                                                        _senhaController.value)) {
                                                      return 'Senha informada esta diferente';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                Container(
                                                  height: MediaQuery.of(context)
                                                              .size
                                                              .height >
                                                          550
                                                      ? 50
                                                      : MediaQuery.of(context)
                                                                  .size
                                                                  .height >
                                                              450
                                                          ? 25
                                                          : 15,
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      setState(() => isLoading =
                                                          true); //////////////////////
                                                      if (_key.currentState!
                                                          .validate()) {
                                                        if (await cadastro()) {
                                                          setState(() => isLoading =
                                                              true); //////////////////////
                                                          Navigator.of(context)
                                                              .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (BuildContextcontext) =>
                                                                      HomePage(),
                                                            ),
                                                            (route) => false,
                                                          );
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                                backgroundColor:
                                                                    Color
                                                                        .fromARGB(
                                                                            255,
                                                                            41,
                                                                            171,
                                                                            226),
                                                                content: Text(
                                                                  'Apelido ja cadastrado',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          30),
                                                                )),
                                                          );
                                                        }
                                                      }
                                                    },
                                                    onHover: (hover) {},
                                                    style: ButtonStyle(
                                                      foregroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.white),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.blue),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              side: BorderSide
                                                                  .none)),
                                                    ),
                                                    child: const Text("Cadastrar",
                                                        style: TextStyle(
                                                            fontSize: 25)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                ))
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }}

  Future<bool> cadastro() async {
    var usuarioLogado = await cadastroUsuario(Usuario(
        widget.name,
        _apelidoController.text,
        widget.gender,
        _senhaController.text,
        widget.date));

    if (usuarioLogado != null) {
      print(usuarioLogado);
      var listaDeClientes = Provider.of<UsuarioState>(context, listen: false);
      listaDeClientes.adicionaUsuario(usuarioLogado);

      return true;
    } else {
      return false;
    }
  }
}
