import 'package:flutter/material.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/lessons/task_page.dart';
import '../components/ButtonNext.dart';
import 'lesson_a.dart';

class TaskVogalSelection extends StatelessWidget {
  const TaskVogalSelection({super.key});

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
                padding: EdgeInsets.all(28.0),
                child: Text(
                  "SELECIONE AS VOGAIS ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
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
                color: Color.fromARGB(255, 194, 197, 199),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0, top: 12.0),
                  child: Container(
                      height: 87.0, child: Image.asset('images/escada.png')),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                color: Color.fromARGB(255, 194, 197, 199),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Container(
                      height: 87.0, child: Image.asset('images/uva.png')),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
            height: 45.0,
            width: 200.0,
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide.none))),
              onPressed: () => {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Lesson(),
                  ),
                  (route) => false,
                ),
              },
              child: const Text('Confirmar',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

class SelectLetterButton extends StatefulWidget {
  final String letter;

  SelectLetterButton({
    Key? key,
    required this.letter,
  }) : super(key: key);

  @override
  State<SelectLetterButton> createState() => _SelectLetterButtonState();
}

class _SelectLetterButtonState extends State<SelectLetterButton> {
  bool isSelected = false;

  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 40,
      margin: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: () => {
          setState(() => {
                isSelected = !isSelected,
              }),
        },
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.white70,
          primary: Colors.black,
          textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
        ),
        child: Text(widget.letter),
      ),
    );
  }
}
