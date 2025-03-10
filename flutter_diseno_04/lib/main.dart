import 'package:flutter/material.dart';
import 'package:music_player/models/audio_player_model.dart';
import 'package:music_player/pages/music_player_pages.dart';
import 'package:music_player/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AudioPlayerModel(),
        )
      ],
      child: MaterialApp(
          title: 'Music player',
          debugShowCheckedModeBanner: false,
          theme: miTema,
          home: const MusciPlayerPages()),
    );
  }
}
