import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/views/components/ButtonNext.dart';
import '../home_page.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var cardSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.0,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(37, 85, 124, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Qual imagem começa com a letra “A”:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: <Widget>[
                      CardImage(
                        imageUrl: 'assets/images/oculos.png',
                        scale: 5.0,
                        audioUrl: 'oculos.mp3',
                        isSelected: cardSelected == 1 ? true : false,
                        onPress: () {
                          setState(() {
                            cardSelected = 1;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CardImage(
                        imageUrl: 'assets/images/uva.png',
                        audioUrl: 'uva.mp3',
                        scale: 8.0,
                        isSelected: cardSelected == 2 ? true : false,
                        onPress: () {
                          setState(() {
                            cardSelected = 2;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CardImage(
                        imageUrl: 'assets/images/arvore.png',
                        audioUrl: 'arvore.mp3',
                        scale: 5.0,
                        isSelected: cardSelected == 3 ? true : false,
                        onPress: () {
                          setState(() {
                            cardSelected = 3;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CardImage(
                        imageUrl: 'assets/images/escada.png',
                        scale: 8.0,
                        audioUrl: 'escada.mp3',
                        isSelected: cardSelected == 4 ? true : false,
                        onPress: () {
                          setState(() {
                            cardSelected = 4;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                    width: 200,
                    height: 40,
                    child: ButtonNext(
                      pageWidget: HomePage(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardImage extends StatefulWidget {
  const CardImage({
    Key? key,
    required this.imageUrl,
    required this.scale,
    required this.isSelected,
    required this.audioUrl,
    required this.onPress,
  }) : super(key: key);
  final String audioUrl;
  final String imageUrl;
  final double scale;
  final bool isSelected;
  final VoidCallback onPress;
  @override
  State<CardImage> createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
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
      onPressed: (() {
        _runAudio("audios/${widget.audioUrl}");
        widget.onPress();
      }),
      child: Container(
          height: (MediaQuery.of(context).size.height) * 0.17,
          width: (MediaQuery.of(context).size.width) * 0.38,
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? Colors.blue
                  : const Color.fromRGBO(209, 220, 221, 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              )),
          child: Image.asset(
            widget.imageUrl,
            scale: widget.scale,
          )),
    );
  }
}
