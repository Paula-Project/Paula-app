import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:paula/app/views/components/audioManager.dart';

class TaskTitle extends StatefulWidget{
  final String title;
  final String audio;
  const TaskTitle({super.key, required this.title, required this.audio, });

  @override
  State<TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<TaskTitle> with WidgetsBindingObserver {


  AudioManager audioManager = AudioManager();
   @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    audioManager.runAudio("audios/paula/${widget.audio}");
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
    return MaterialButton(
      onPressed: () { 
        audioManager.runAudio(widget.audio);
       },
      textColor: Colors.white,
      color: const Color.fromRGBO(37, 85, 124, 1),
      padding: const EdgeInsets.all(0),
      elevation: 1,
      minWidth: double.infinity,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:15, bottom: 20, left: 18, right: 18),
            child: AutoSizeText(
              widget.title,
              textScaleFactor: 1,
              minFontSize: 15, 
              maxFontSize: 20,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
              )
            ),
          ),
          const Positioned(
            right: 5,
            bottom: 5,
            child: Icon(
              size: 20,
              Icons.spatial_audio_off_sharp,
              color: Colors.white,
            ),
          )
        ],
      )
        );
  }
}
