import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/views/components/exitDialog.dart';

class TaskLayout extends StatelessWidget {
  final Widget body;
  final Widget taskProgress;
  final bool paddingDefault;
  final bool shouldPop;
  final LessonControllerInterface lessonController;
  const TaskLayout(
      {super.key,
      this.paddingDefault = true,
      required this.body,
      required this.shouldPop,
      required this.taskProgress, required this.lessonController});

  @override
  Widget build(BuildContext context) {
    onwillpop() {
      if (shouldPop) {
        return exitDialog(context, lessonController);
      } else {
        return Future.value(false);
      }
    }

    return WillPopScope(
      onWillPop: () => onwillpop(),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: taskProgress,
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: IconButton(
              alignment: Alignment.centerRight,
              color: Colors.black54,
              onPressed: () {

                exitDialog(context, lessonController);
              },
              icon: const Icon(
                Icons.close,
                size: 40,
              ),
              padding: EdgeInsets.zero,
            ),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: paddingDefault
                ? const EdgeInsets.only(left: 15, right: 15, bottom: 20)
                : EdgeInsets.zero,
            child: body,
          )),
    );
  }
}
