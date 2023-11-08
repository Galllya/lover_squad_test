import 'package:flame_audio/bgm.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:lover_squad_test/services/audio_service.dart';
import 'package:lover_squad_test/presentation/home/home_page.dart';
import 'package:lover_squad_test/style/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  Bgm flameAudio = FlameAudio.bgm;
  flameAudio.initialize();

  AudioService(
    sharedPreferences: sharedPreferences,
    flameAudio: flameAudio,
  ).initAudio();

  runApp(
    MultiProvider(
      providers: [
        Provider<SharedPreferences>.value(value: sharedPreferences),
        Provider<Bgm>.value(value: flameAudio),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lover Squad Test',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
