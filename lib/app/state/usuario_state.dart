import 'package:flutter/material.dart';

import 'package:paula/app/model/usuarioAPI.dart';

class UsuarioState extends ChangeNotifier {
  late UsuarioAPI _usuario = UsuarioAPI("", "", "", 0, "2002-10-03", 0);

  UsuarioAPI getUsuario() => _usuario;
  void adicionaUsuario(UsuarioAPI usuarioLogado) {
    _usuario = usuarioLogado;
    notifyListeners();
  }

  void progressUpdate(UsuarioAPI usuarioLogado, int progress) {
    usuarioLogado.progress = progress;
    notifyListeners();
  }

  void resetUSER() {
    _usuario = UsuarioAPI("", "", "", 0, "2002-10-03", 0);
    notifyListeners();
  }
}
