import 'package:flutter/material.dart';

class TaskVogalSelection extends StatelessWidget {
  const TaskVogalSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.green),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
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
        ));
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
