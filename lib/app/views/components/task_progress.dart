import 'package:flutter/material.dart';

class TaskProgress extends StatelessWidget {
  final int tasksNUmber;
  const TaskProgress({
    Key? key,
    required this.tasksNUmber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(color: Colors.green),
            width: 40,
            height: 10),
        const SizedBox(width: 5.0),
        Container(
            decoration: BoxDecoration(color: Colors.green),
            width: 40,
            height: 10),
        const SizedBox(width: 5.0),
        Container(
            decoration: BoxDecoration(color: Colors.grey),
            width: 40,
            height: 10),
        const SizedBox(width: 5.0),
        Container(
            decoration: BoxDecoration(color: Colors.grey),
            width: 40,
            height: 10),
        const SizedBox(width: 5.0),
        Container(
            decoration: BoxDecoration(color: Colors.grey),
            width: 40,
            height: 10)
      ],
    );
  }
}
