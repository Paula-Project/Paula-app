import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  static const backgroundBlueGradiend = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color.fromARGB(255, 100, 171, 226),
        Color.fromARGB(255, 41, 171, 226)
      ]));

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: backgroundBlueGradiend,
        //color: Colors.blue[200]?.withOpacity(0.9),
        child: const SpinKitCubeGrid(
          size: 100,
          color: Colors.white,
        ));
  }
}
