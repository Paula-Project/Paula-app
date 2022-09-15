import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/views/components/ButtonNext.dart';
import 'package:paula/app/views/home_page.dart';

class Lesson extends StatefulWidget {
  const Lesson({Key? key}) : super(key: key);

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
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
                const EdgeInsets.symmetric(vertical: 60.0, horizontal: 25.0),
            child: Column(
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
                const SizedBox(
                  height: 60,
                ),
                const LessonCard(
                  imageUrl: 'assets/images/lata.png',
                  nameTxt: "L A T A",
                  audioUrl: 'lata.mp3',
                ),
                const SizedBox(
                  height: 40,
                ),
                const LessonCard(
                  imageUrl: 'assets/images/aviao.png',
                  nameTxt: "A V I Ã O",
                  audioUrl: 'aviao.mp3',
                ),
                const SizedBox(
                  height: 40,
                ),
                const LessonCard(
                  imageUrl: 'assets/images/pineapple.png',
                  nameTxt: "A B A C A X I",
                  audioUrl: 'abacaxi.mp3',
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: SizedBox(
                    width: 180,
                    height: 50,
                    child: ButtonNext(
                      pageWidget: HomePage(),
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
        _runAudio("audios/${widget.audioUrl}");
      },
      child: Container(
          height: 120.0,
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
                  child: Container(
                      height: 120, child: Image.asset(widget.imageUrl)),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(widget.nameTxt,
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w900)),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
