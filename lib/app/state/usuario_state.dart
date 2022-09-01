import 'package:flutter/material.dart';

import '../model/usuario.dart';



class UsuarioState extends ChangeNotifier {
  late Usuario _usuario;

  Usuario getUsuario() => _usuario;

  void adicionaUsuario(Usuario usuarioLogado) {
    _usuario = usuarioLogado;
    notifyListeners();
  }

}