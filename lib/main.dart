import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:provider/provider.dart';
import 'package:paula/app_widget.dart';
import 'package:flutter/services.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final AudioContext audioContext = AudioContext(
    iOS: AudioContextIOS(
      defaultToSpeaker: true,
      category: AVAudioSessionCategory.playback,
      options: [ 
        AVAudioSessionOptions.defaultToSpeaker,
        AVAudioSessionOptions.mixWithOthers, 
      ],
    ),       
    android: AudioContextAndroid(
      isSpeakerphoneOn: true,
      stayAwake: true,
      contentType: AndroidContentType.sonification,
      usageType: AndroidUsageType.assistanceSonification,
      audioFocus: AndroidAudioFocus.none,
    ),
  );
  AudioPlayer.global.setGlobalAudioContext(audioContext);

  runApp(ChangeNotifierProvider(
    create: (context) => UsuarioState(),
    child: const AppWidget(),
  ));
}
