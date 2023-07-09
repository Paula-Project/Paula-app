import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DialogTextBoxDown extends StatelessWidget {
  final String textContent;

  const DialogTextBoxDown({
    Key? key,
    required this.textContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(199, 37, 85, 124),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AutoSizeText(
              textContent,
              minFontSize: 12,
              maxFontSize: 22,
              textScaleFactor: 1,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
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
      ],
    );
  }
}
