import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/web/depedency_injection.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:provider/provider.dart';
import 'package:paula/app_widget.dart';
import 'package:flutter/services.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final AudioContext audioContext = AudioContext(
    iOS: AudioContextIOS(
      category: AVAudioSessionCategory.playback,
      options: [
        AVAudioSessionOptions.defaultToSpeaker,
        AVAudioSessionOptions.mixWithOthers,
      ], defaultToSpeaker: true,
    ),
    android: AudioContextAndroid(
      isSpeakerphoneOn: true,
      stayAwake: true,
      contentType: AndroidContentType.music,
      usageType: AndroidUsageType.assistanceSonification,
      audioFocus: AndroidAudioFocus.gain,
    ),
  );
  AudioPlayer.global.setGlobalAudioContext(audioContext);

  runApp(ChangeNotifierProvider(
    create: (context) => UsuarioState(),
    child: const AppWidget(),
  ));
  DependencyInjection.init();
}
