import 'package:flutter/material.dart';
import 'lesson_a.dart';

class TaskVogalSelection extends StatefulWidget {
  const TaskVogalSelection({Key? key}) : super(key: key);

  @override
  State<TaskVogalSelection> createState() => _TaskVogalSelectionState();
}

class _TaskVogalSelectionState extends State<TaskVogalSelection> {
  final List<String> _vogais = ['A', 'E', 'I', 'O', 'U'];
  List<String> _vogaisSelecionadas = [];

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
                        onSelected: addVogal,
                        onUnselected: removeVogal,
                      ),
                      SelectLetterButton(
                        letter: 'S',
                        onSelected: addVogal,
                        onUnselected: removeVogal,
                      ),
                      SelectLetterButton(
                        letter: 'C',
                        onSelected: addVogal,
                        onUnselected: removeVogal,
                      ),
                      SelectLetterButton(
                        letter: 'A',
                        onSelected: addVogal,
                        onUnselected: removeVogal,
                      ),
                      SelectLetterButton(
                        letter: 'D',
                        onSelected: addVogal,
                        onUnselected: removeVogal,
                      ),
                      SelectLetterButton(
                        letter: 'A',
                        onSelected: addVogal,
                        onUnselected: removeVogal,
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
                        onSelected: addVogal,
                        onUnselected: removeVogal,
                      ),
                      SelectLetterButton(
                        letter: 'A',
                        onSelected: addVogal,
                        onUnselected: removeVogal,
                      ),
                      SelectLetterButton(
                        letter: 'C',
                        onSelected: addVogal,
                        onUnselected: removeVogal,
                      ),
                      SelectLetterButton(
                        letter: 'A',
                        onSelected: addVogal,
                        onUnselected: removeVogal,
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
                debugPrint(_vogaisSelecionadas.toString()),
                if (verifyAnswer())
                  {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Lesson(),
                      ),
                      (route) => false,
                    ),
                  }
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

  void addVogal(String vogal) {
    setState(() {
      _vogaisSelecionadas.add(vogal);
    });
  }

  void removeVogal(String vogal) {
    setState(() {
      _vogaisSelecionadas.remove(vogal);
    });
  }

  bool verifyAnswer() {
    return _vogaisSelecionadas.every((element) => _vogais.contains(element));
  }
}

class SelectLetterButton extends StatefulWidget {
  final String letter;
  final Function(String) onSelected;
  final Function(String) onUnselected;

  SelectLetterButton({
    Key? key,
    required this.letter,
    required this.onSelected,
    required this.onUnselected,
  }) : super(key: key);

  @override
  State<SelectLetterButton> createState() => _SelectLetterButtonState();
}

class _SelectLetterButtonState extends State<SelectLetterButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 40,
      margin: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: () => {
          setState(() => {
                isSelected = !isSelected,
                if (isSelected) {widget.onSelected(widget.letter)},
                if (!isSelected) {widget.onUnselected(widget.letter)},
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
