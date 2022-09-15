import 'package:flutter/material.dart';
import 'package:paula/app/http/webclient.dart';
import 'package:paula/app/model/usuario.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/components/Input.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                flex: 12,
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
                                            return ' Informe o apelido';
                                          }
                                          if (value.length < 3) {
                                            return 'Apelido deve possuir no minimo 3 caracteres';
                                          }
                                          return null;
                                        },
                                        formatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[a-zA-Z0-9]'))
                                        ],
                                      ),
                                      Container(
                                        height: 20,
                                      ),
                                      Input(
                                        labelInputTxt: "Senha",
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
                                      Container(
                                        height: 20,
                                      ),
                                      Input(
                                        labelInputTxt: "Confirmar senha",
                                        obscureTxt: true,
                                        controller: _senhaConfirmaController,
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
                                      Container(
                                        height: 40,
                                      ),
                                      SizedBox(
                                        width: 160,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            if (_key.currentState!.validate()) {
                                              if (await cadastro()) {
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
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              41, 171, 226),
                                                      content: Text(
                                                        'Apelido ja cadastrado',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30),
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
    );
  }

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
