import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/model/task_words_exemple_model.dart';
import 'package:paula/app/views/components/ButtonNext.dart';
import 'package:paula/app/views/components/CardExemple.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/taskTitle.dart';
import 'package:paula/app/views/components/task_progress.dart';
import 'package:paula/app/views/layout/task_layout.dart';

class TaskWordsExemple extends StatefulWidget {
  final TaskWordsExempleModel task;
  final LessonControllerInterface lessonController;
  const TaskWordsExemple({
    Key? key,
    required this.task,
    required this.lessonController,
  }) : super(key: key);

  @override
  State<TaskWordsExemple> createState() => _TaskWordsExempleState();
}

class _TaskWordsExempleState extends State<TaskWordsExemple>
    with WidgetsBindingObserver {
  AudioManager audioManager = AudioManager();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    audioManager.stopAudio();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    audioManager.didLifecycleChange(state);
  }

  @override
  Widget build(BuildContext context) {
    return TaskLayout(
      shouldPop: true,
      taskProgress: TaskProgress(
                tasksNumber: widget.lessonController.getTaskQuantity(),
                correctAnswer:
                    widget.lessonController.getTaskCorrectAnswers(),
      ),
      body: Material(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TaskTitle(
                title: widget.task.title,
                audio: widget.task.audio,
                audioManager: audioManager
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.task.words
                      .map((word) => CardExemple(
                          imageUrl: "assets/images/words/${word.imagePath}",
                          nameTxt: word.text,
                          audioUrl: word.soundPath,
                          letters: widget.task.letter))
                      .toList(),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 180,
                  height: 50,
                  child: ButtonNext(
                    pageWidget: widget.lessonController.nextTask(),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
