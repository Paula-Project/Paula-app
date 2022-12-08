import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lesson_controller.dart';
import 'package:paula/app/model/task_words_exemple_model.dart';
import 'package:paula/app/views/components/ButtonNext.dart';
import 'package:paula/app/views/home_page.dart';

class TaskWordsExemple extends StatefulWidget {
  final TaskWordsExempleModel task;
  final LessonController lessonController;
  const TaskWordsExemple({
    Key? key,
    required this.task,
    required this.lessonController,
  }) : super(key: key);

  @override
  State<TaskWordsExemple> createState() => _TaskWordsExempleState();
}

class _TaskWordsExempleState extends State<TaskWordsExemple> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
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
                        "Aqui estão alguns exemplos de objetos com “A”:",
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
                        .map((word) => LessonCard(
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
                    child: ButtonNext(
                      pageWidget: widget.lessonController.nextTask(),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class LessonCard extends StatefulWidget {
  final String imageUrl;
  final String nameTxt;
  final String audioUrl;

  const LessonCard({
    Key? key,
    required this.imageUrl,
    required this.nameTxt,
    required this.audioUrl,
  }) : super(key: key);

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  AudioPlayer? audioPlayer;

  _runAudio(String path) async {
    try {
      await audioPlayer?.play(AssetSource(path));
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        _runAudio("audios/words/${widget.audioUrl}");
      },
      focusColor: Color.fromARGB(255, 104, 106, 106),
      child: Container(
          height: 100.0,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(209, 220, 221, 1),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 00.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                      height: 100, child: Image.asset(widget.imageUrl)),
                ),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: widget.nameTxt.runes
                            .map(
                              (int rune) => Text(
                                String.fromCharCode(rune).toUpperCase(),
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w900,
                                    color: String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                'A' ||
                                            String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                "Á" ||
                                            String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                "Ã"
                                        ? Color.fromARGB(255, 76, 163, 175)
                                        : Colors.white,
                                    letterSpacing: 5.0,
                                    decoration: String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                'A' ||
                                            String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                "Á" ||
                                            String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                "Ã"
                                        ? TextDecoration.underline
                                        : TextDecoration.none),
                              ),
                            )
                            .toList(),
                      ),
                    )),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
