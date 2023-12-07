import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/model/task_words_paranoa_model.dart';
import 'package:paula/app/views/components/CardParanoa.dart';
import 'package:paula/app/views/components/buttonContinue.dart';
import 'package:paula/app/views/layout/task_layout.dart';

class TaskWordsParanoa extends StatefulWidget {
  final TaskWordsParanoaModel task;
  final LessonControllerInterface lessonController;
  const TaskWordsParanoa({
    Key? key,
    required this.task,
    required this.lessonController,
  }) : super(key: key);

  @override
  State<TaskWordsParanoa> createState() => _TaskWordsParanoaState();
}

class _TaskWordsParanoaState extends State<TaskWordsParanoa> {
  @override
  Widget build(BuildContext context) {
    return TaskLayout(
      lessonController: widget.lessonController,
      shouldPop: true,
      taskProgress: Container(),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100.0,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(37, 85, 124, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Vocẽ sabia que Paranoá também possui a letra “A”?",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.task.words
                        .map((word) => CardParanoa(
                              imageUrl: "assets/images/words/${word.imagePath}",
                              nameTxt: word.text,
                              audioUrl: word.soundPath,
                            ))
                        .toList(),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 180,
                    height: 50,
                    child: ButtonContinue(
                      lessonController: widget.lessonController,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
