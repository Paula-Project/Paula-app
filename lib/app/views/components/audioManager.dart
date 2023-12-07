import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioManager {
  AudioPlayer audioPlayer = AudioPlayer();

  runAudio(String path) async {
    try {
      await audioPlayer.play(AssetSource(path), balance: 0.0);
    } catch (error) {
      print(error.toString());
    }
  }

  stopAudio() {
    audioPlayer.stop();
  }

  didLifecycleChange(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      audioPlayer.pause();
      return;
    } else if (state == AppLifecycleState.resumed) {
      audioPlayer.resume();
    }
  }
}
