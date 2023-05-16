import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/model/task_words_exemple_model.dart';
import 'package:paula/app/views/components/ButtonNext.dart';
import 'package:paula/app/views/components/CardExemple.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/exitDialog.dart';

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
    audioManager.runAudio("audios/paula/${widget.task.audio}");
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
    return WillPopScope(
      onWillPop: (() => exitDialog(context)),
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      audioManager
                          .runAudio("audios/paula/${widget.task.audio}");
                    },
                    padding: EdgeInsets.zero,
                    child: Stack(children: [
                      Container(
                        height: 100.0,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(37, 85, 124, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              widget.task.title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 10,
                        bottom: 10,
                        child: Icon(
                          Icons.spatial_audio_off_sharp,
                          color: Colors.white,
                        ),
                      )
                    ]),
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
              )),
        ),
      ),
    );
  }
}
