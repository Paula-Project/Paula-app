import 'package:flutter/material.dart';
import 'package:paula/app/controllers/web/depedency_injection.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:provider/provider.dart';
import 'package:paula/app_widget.dart';
import 'package:flutter/services.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ChangeNotifierProvider(
    create: (context) => UsuarioState(),
    child: const AppWidget(),
  ));
  DependencyInjection.init();
}
