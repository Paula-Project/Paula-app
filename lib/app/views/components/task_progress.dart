import 'package:flutter/material.dart';

class TaskProgress extends StatelessWidget {
  final int tasksNumber;
  final int correctAnswer;
  const TaskProgress(
      {Key? key, required this.tasksNumber, required this.correctAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < tasksNumber; i++)
          Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: i < correctAnswer ? Colors.green : Colors.grey),
              width: 30,
              height: 10),
      ],
    );
  }
}
