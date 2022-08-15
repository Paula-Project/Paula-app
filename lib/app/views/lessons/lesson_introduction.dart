import 'dart:async';
import 'package:flutter/material.dart';
import 'package:paula/app/views/components/DIalogTextBoxDown.dart';
import 'package:get/get.dart';
import 'package:paula/app/views/lessons/lesson.dart';

class LessonIntroduction extends StatefulWidget {
  const LessonIntroduction({Key? key}) : super(key: key);

  @override
  State<LessonIntroduction> createState() => _LessonIntroductionState();
}

class _LessonIntroductionState extends State<LessonIntroduction> {
  final _timer =
      Timer(const Duration(seconds: 5), () => {Get.to(const Lesson())});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                    alignment: Alignment.topCenter,
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(37, 85, 124, 1),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    child: const Center(
                      child: Text(
                        'A',
                        style: TextStyle(fontSize: 200.0),
                      ),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: const DialogTextBoxDown(
                    TextContent:
                        "Esta é a letra “A”, ela é a primeira letra do alfabeto."),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  width: (MediaQuery.of(context).size.width - 150),
                  child: Image.asset('assets/images/Avatar-Maker(2).png')),
            ],
          )),
    );
  }
}
