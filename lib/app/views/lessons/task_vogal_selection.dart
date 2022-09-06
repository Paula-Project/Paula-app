import 'package:flutter/material.dart';
import 'package:paula/app/views/lessons/task_page.dart';

import '../components/ButtonNext.dart';

class TaskVogalSelection extends StatelessWidget {
  const TaskVogalSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
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
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 200.0,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 105, 112, 118),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Container(
                      height: 87.0, child: Image.asset('images/escada.png')),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    ])
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 200.0,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 105, 112, 118),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Container(
                      height: 87.0, child: Image.asset('images/uva.png')),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
                    ]),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            height: 50.0,
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide.none))),
              child: const Text('CONTINUAR',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
              onPressed: () {},
            ),
          ),
        ),
      ],
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
