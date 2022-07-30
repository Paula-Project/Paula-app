import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/paulaTitle.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({Key? key}) : super(key: key);

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  static const BackgroundBlueGradiend = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color.fromARGB(255, 100, 171, 226),
        Color.fromARGB(255, 41, 171, 226)
      ]));

  String nickname = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BackgroundBlueGradiend,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: PaulaTitleComponent(),
            ),
            Expanded(
              flex: 8,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: const [
                          Text("Vamos nos cadastrar?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.w500)),
                          Text("Queremos te conhecer!",
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
                    Container(
                      height: 20,
                    ),
                    Expanded(
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
                            child:Container()),
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
