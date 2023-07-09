import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DialogTextBox extends StatefulWidget {
  final String TextContent;
  final String audioUrl;

  const DialogTextBox({
    Key? key,
    required this.TextContent,
    required this.audioUrl,
  }) : super(key: key);

  @override
  State<DialogTextBox> createState() => _DialogTextBoxState();
}

class _DialogTextBoxState extends State<DialogTextBox> {
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
      onPressed: () {
        _runAudio("audios/paula/${widget.audioUrl}");
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipPath(
                clipper: CustomTriangleClipper(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(199, 37, 85, 124)),
                  ),
                ),
              ),
            ],
          ),
          Stack(children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(199, 37, 85, 124),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(
                    MediaQuery.of(context).size.height > 510 ? 10.0 : 5),
                child: AutoSizeText(
                  widget.TextContent,
                  textScaleFactor: 1,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                  minFontSize: 10,
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
        ],
      ),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
