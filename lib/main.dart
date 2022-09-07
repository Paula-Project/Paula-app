import 'package:flutter/material.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:provider/provider.dart';
import 'app_widget.dart';

main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UsuarioState(),
    child: const AppWidget(),
  ));
}
