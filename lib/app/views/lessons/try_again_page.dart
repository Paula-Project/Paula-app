import 'package:flutter/material.dart';
import '../components/ButtonNext.dart';
import '../home_page.dart';

class TryAgainPage extends StatefulWidget {
  const TryAgainPage({Key? key}) : super(key: key);

  @override
  State<TryAgainPage> createState() => _TryAgainPageState();
}

class _TryAgainPageState extends State<TryAgainPage> {
  @override
  Widget build(BuildContext context) {
    Future<bool> _onwillpop() async {
      return false;
    }

    return WillPopScope(
      onWillPop: _onwillpop,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 100, 30, 10),
                child: Container(
                  height: (MediaQuery.of(context).size.height) * 0.6,
                  width: (MediaQuery.of(context).size.width) * 0.8,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(37, 85, 124, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.asset('assets/images/UnB_logo.png'),
                            ),
                            const Text(
                              "TENTE NOVAMENTE!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                "REFAÇA AS ATIVIDADES PARA CONSEGUIR MAIS ACERTOS",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white70,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Image.asset('assets/images/UnB_logo.png'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70.0),
                child: SizedBox(
                    width: 350,
                    height: 50,
                    child: ButtonNext(
                      pageWidget: HomePage(),
                      allowedReturn: false,
                      onPressed: () {},
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
