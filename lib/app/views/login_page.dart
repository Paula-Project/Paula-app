import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paula/app/views/change_password.dart';
import 'package:paula/app/views/components/paulaTitle.dart';
import 'package:paula/app/http/webclient.dart';
import 'package:provider/provider.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/components/Loading.dart';
import 'package:paula/app/views/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const backgroundBlueGradiend = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color.fromARGB(255, 100, 171, 226),
        Color.fromARGB(255, 41, 171, 226)
      ]));

  final _formkey = GlobalKey<FormState>();
  final _nicknameController = TextEditingController();
  final _passwordController = TextEditingController();

  String nickname = '';
  String password = '';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) => isLoading
      ? const LoadingPage()
      : Scaffold(
          body: SingleChildScrollView(
          child: Container(
            decoration: backgroundBlueGradiend,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                children: [
                  Expanded(
                      flex: MediaQuery.of(context).size.height > 550 ? 3 : 2,
                      child: const PaulaTitleComponent()),
                  Expanded(
                    flex: 8,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: Column(
                              children: [
                                Text("LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height >
                                                    500
                                                ? 30
                                                : 20,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    "Use o apelido e senha \n cadastrados para acessar o Paula",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height >
                                                  500
                                              ? 18
                                              : 14,
                                      height: 1.5,
                                      fontWeight: FontWeight.w300,
                                    )),
                              ],
                            ),
                          ),
                          Form(
                              key: _formkey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20,
                                  ),
                                  const Text("Apelido",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300)),
                                  Container(
                                    decoration: const BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(50, 0, 0, 0),
                                        blurRadius: 15,
                                        offset: Offset(0, 5),
                                      ),
                                    ]),
                                    child: TextFormField(
                                      controller: _nicknameController,
                                      keyboardType: TextInputType.text,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[a-zA-Z0-9]'))
                                      ],
                                      validator: (nickname) {
                                        if (nickname == null ||
                                            nickname.isEmpty) {
                                          return 'Por favor, digite seu apelido';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 6),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        isDense: true,
                                      ),
                                      style: TextStyle(color: Colors.black),
                                      onChanged: (value) {
                                        nickname = value;
                                      },
                                    ),
                                  ),
                                  Container(height: 10),
                                  const Text("Senha",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300)),
                                  Container(
                                    decoration: const BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(50, 0, 0, 0),
                                        blurRadius: 15,
                                        offset: Offset(0, 5),
                                      ),
                                    ]),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      keyboardType: TextInputType.text,
                                      validator: (senha) {
                                        if (senha == null || senha.isEmpty) {
                                          return 'Por favor, digite sua senha';
                                        } else if (senha.length < 4) {
                                          return 'Por favor, digite uma senha maior';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 6),
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
                                      style:
                                          const TextStyle(color: Colors.black),
                                      onChanged: (value) {
                                        password = value;
                                      },
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                              width: 110,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: BorderSide.none))),
                                child: const Text('Entrar',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    )),
                                onLongPress: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomePage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                onPressed: () async {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (_formkey.currentState!.validate()) {
                                    bool log = false;
                                    setState(() => isLoading = true);
                                    try {
                                      if (await login()) {
                                        setState(() => isLoading = false);
                                        FocusScope.of(context).unfocus();
                                        log = true;
                                      } else {
                                        setState(() => isLoading = false);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              backgroundColor: Colors.white,
                                              content: Text(
                                                'Usuário ou senha inválidos',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 41, 171, 226),
                                                    fontSize: 20),
                                              )),
                                        );
                                      }
                                    } catch (e) {
                                      setState(() => isLoading = false);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.white,
                                            content: Text(
                                              'Verifique a sua conexão com a internet.',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 41, 171, 226),
                                                  fontSize: 20),
                                            )),
                                      );
                                    }
                                    if (log) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              HomePage(),
                                        ),
                                        (route) => false,
                                      );
                                    } else {}
                                  }
                                },
                              ),
                            ),
                          ),
                          Center(
                            child: TextButton(
                              child: const Text(
                                "Esqueci a minha senha!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.underline),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ChangePassword(),
                                  ),
                                  (route) => true,
                                );
                              },
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ));

  Future<bool> login() async {
    var usuarioLogado =
        await loginUsuario(_nicknameController.text, _passwordController.text);

    if (usuarioLogado != null) {
      var listaDeClientes = Provider.of<UsuarioState>(context, listen: false);
      listaDeClientes.adicionaUsuario(usuarioLogado);
      return true;
    } else {
      return false;
    }
  }
}
