import 'package:flutter/material.dart';
import 'package:paula/app/views/home_page.dart';
import 'package:paula/app/views/components/exitDialog.dart';

class TaskProgress extends StatelessWidget {
  final int tasksNumber;
  final int correctAnswer;
  const TaskProgress(
      {Key? key, required this.tasksNumber, required this.correctAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: IconButton(
            color: Colors.black54,
            onPressed: () {
              exitDialog(context);
            },
            icon: const Icon(
              Icons.close,
              size: 40,
            ),
            padding: EdgeInsets.zero,
          ),
        ),
        for (int i = 0; i < tasksNumber; i++)
          Container(
              margin: EdgeInsets.only(left: ((width / 6) / (tasksNumber + 1))),
              decoration: BoxDecoration(
                color: i < correctAnswer ? Colors.green : Colors.black26,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              width: (width - 150) / tasksNumber,
              height: 10),
      ],
    );
  }
}
