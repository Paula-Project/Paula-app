import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/ButtonNext.dart';
import '../home_page.dart';

class CongratulationsPage extends StatefulWidget {
  const CongratulationsPage({Key? key}) : super(key: key);

  @override
  State<CongratulationsPage> createState() => _CongratulationsPageState();
}

class _CongratulationsPageState extends State<CongratulationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/fireworks.png', scale: 6.0),
                          Image.asset('images/fireworks.png', scale: 6.0),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 40, 8, 0),
                      child: Text(
                        "VOCÊ ESTÁ \n INDO MUITO \n BEM!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Image.asset('images/fireworks.png', scale: 6.0),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70.0),
              child: const SizedBox(
                  width: 350,
                  height: 50,
                  child: ButtonNext(
                    pageWidget: HomePage(),
                    allowedReturn: false,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
