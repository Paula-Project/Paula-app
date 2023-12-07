import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CardParanoa extends StatefulWidget {
  final String imageUrl;
  final String nameTxt;
  final String audioUrl;

  const CardParanoa({
    Key? key,
    required this.imageUrl,
    required this.nameTxt,
    required this.audioUrl,
  }) : super(key: key);

  @override
  State<CardParanoa> createState() => _CardParanoaState();
}

class _CardParanoaState extends State<CardParanoa> {
  AudioPlayer? audioPlayer;

  _runAudio(String path) async {
    try {
      await audioPlayer?.play(AssetSource(path), balance:0.0);
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
      child: Container(
          height: 250.0,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 00.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                      height: 200,
                      child: Image.asset(
                        widget.imageUrl,
                        height: 200,
                      )),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Center(
                      child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 5.0,
                    alignment: WrapAlignment.center,
                    children: widget.nameTxt.runes
                        .map(
                          (int rune) => Text(
                            String.fromCharCode(rune).toUpperCase(),
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                                color:
                                    String.fromCharCode(rune).toUpperCase() ==
                                                'A' ||
                                            String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                "Á" ||
                                            String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                "Ã"
                                        ? Color.fromARGB(255, 76, 163, 175)
                                        : Color.fromARGB(255, 27, 26, 29),
                                letterSpacing: 0.0,
                                decoration:
                                    String.fromCharCode(rune).toUpperCase() ==
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
                  )),
                ),
              ],
            ),
          )),
    );
  }
}
