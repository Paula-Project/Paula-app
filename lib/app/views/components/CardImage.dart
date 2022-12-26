import 'package:flutter/material.dart';
import 'package:paula/app/views/components/audioManager.dart';

class CardImage extends StatefulWidget {
  const CardImage({
    Key? key,
    required this.imageUrl,
    required this.scale,
    required this.isSelected,
    required this.audioUrl,
    required this.onPress,
    required this.audioManager,
  }) : super(key: key);
  final String audioUrl;
  final String imageUrl;
  final double scale;
  final bool isSelected;
  final VoidCallback onPress;
  final AudioManager audioManager;
  @override
  State<CardImage> createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (() {
        widget.audioManager.runAudio("audios/words/${widget.audioUrl}");
        widget.onPress();
      }),
      child: Container(
          height: (MediaQuery.of(context).size.height) * 0.17,
          width: (MediaQuery.of(context).size.width) * 0.35,
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
