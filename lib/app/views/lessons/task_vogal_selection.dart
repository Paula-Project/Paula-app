import 'package:flutter/material.dart';
import 'package:paula/app/views/lessons/task_page.dart';

import '../components/ButtonNext.dart';

class TaskVogalSelection extends StatelessWidget {
  const TaskVogalSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
        Container(
                height: 100.0,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(37, 85, 124, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Selecione as vogais: ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),  
                    ),
                  ),
                ),
              // ignore: dead_code   
         
              child: Row(
                children: const [
                  SelectLetterButton(
                    letter: 'E',
                  ),
                  SelectLetterButton(
                    letter: 'S',
                  ),
                  SelectLetterButton(
                    letter: 'C',
                  ),
                  SelectLetterButton(
                    letter: 'A',
                  ),
                  SelectLetterButton(
                    letter: 'D',
                  ),
                  SelectLetterButton(
                    letter: 'A',
                  ),
                ],
              ),

              child: Row(
                children: const[
                  SelectLetterButton(
                    letter: 'F',
                  ),
                  SelectLetterButton(
                    letter: 'A',
                  ),
                  SelectLetterButton(
                    letter: 'C',
                  ),
                  SelectLetterButton(
                    letter: 'A',
                  ),
                ]

              child: const Center(
                  child: SizedBox(
                    width: 180,
                    height: 50,
                    child: ButtonNext(pageWidget: TaskPage()),
                  ),
              ),
          ),
        );
  }
}

class SelectLetterButton extends StatelessWidget {
  final String letter;

  const SelectLetterButton({
    Key? key,
    required this.letter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 40,
      margin: const EdgeInsets.all(5),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white70,
          primary: Colors.black,
          textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
        ),
        onPressed: () {},
        child: Text(letter),
      ),
    );
  }
}
