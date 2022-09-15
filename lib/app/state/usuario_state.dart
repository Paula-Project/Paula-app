import 'package:flutter/material.dart';

import 'package:paula/app/model/usuarioAPI.dart';

class UsuarioState extends ChangeNotifier {
  UsuarioAPI? _usuario;

  UsuarioAPI? getUsuario() => _usuario;

  void adicionaUsuario(UsuarioAPI usuarioLogado) {
    _usuario = usuarioLogado;
    notifyListeners();
  }

  void progressUpdate(UsuarioAPI usuarioLogado, int progress) {
    usuarioLogado.progress = progress;
    notifyListeners();
  }
}
