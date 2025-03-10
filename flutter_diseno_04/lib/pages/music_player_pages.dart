// ignore_for_file: avoid_unnecessary_containers

import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/helpers/helpers.dart';
import 'package:music_player/models/audio_player_model.dart';
import 'package:music_player/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class MusciPlayerPages extends StatelessWidget {
  const MusciPlayerPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const _Background(),
        Column(
          children: const [
            CustomAppBar(),
            _ImagenDiscoDuracion(),
            _TituloPlay(),
            Expanded(child: _Letras())
          ],
        ),
      ],
    ));
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.8,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.center,
              colors: [
                Color(0xff33333e),
                Color(0xff201e28),
              ]),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60))),
    );
  }
}

class _Letras extends StatelessWidget {
  const _Letras({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final letras = getLyrics();
    return Container(
      child: ListWheelScrollView(
        itemExtent: 42,
        diameterRatio: 1.5,
        physics: const BouncingScrollPhysics(),
        children: letras
            .map((linea) => Text(
                  linea,
                  style: TextStyle(
                      fontSize: 20, color: Colors.white.withOpacity(0.6)),
                ))
            .toList(),
      ),
    );
  }
}

class _TituloPlay extends StatefulWidget {
  const _TituloPlay({
    Key? key,
  }) : super(key: key);

  @override
  State<_TituloPlay> createState() => _TituloPlayState();
}

class _TituloPlayState extends State<_TituloPlay>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool firstTime = true;
  late AnimationController controller;

  final assetAudioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void open() {
    final audioPlayerModel =
        Provider.of<AudioPlayerModel>(context, listen: false);

    //! assetAudioPlayer.open('assets/Breaking-Benjamin-Far-Away.mp3');
    assetAudioPlayer.open(Audio('assets/Breaking-Benjamin-Far-Away.mp3'),
        autoStart: true, showNotification: true);

    assetAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.current = duration;
    });

    assetAudioPlayer.current.listen((playingAudio) {
      //! audioPlayerModel.songDuration = playingAudio.duration;
      audioPlayerModel.songDuration =
          playingAudio?.audio.duration ?? const Duration(seconds: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Far Away',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Text(
                '-Breaking Benjamin-',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.4),
                ),
              )
            ],
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              final audioPlayerModel =
                  Provider.of<AudioPlayerModel>(context, listen: false);

              if (isPlaying) {
                controller.reverse();
                isPlaying = false;
                audioPlayerModel.controller.stop();
              } else {
                controller.forward();
                isPlaying = true;
                audioPlayerModel.controller.repeat();
              }
              if (firstTime) {
                open();
                firstTime = false;
              } else {
                assetAudioPlayer.playOrPause();
              }
            },
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: const Color(0xfff8cb51),
            child: AnimatedIcon(
                icon: AnimatedIcons.play_pause, progress: controller),
          )
        ],
      ),
    );
  }
}

class _ImagenDiscoDuracion extends StatelessWidget {
  const _ImagenDiscoDuracion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 80),
      child: Row(
        children: const [
          _ImagenDisco(),
          SizedBox(width: 20),
          _BarraProgreso(),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class _BarraProgreso extends StatelessWidget {
  const _BarraProgreso({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final estilo = TextStyle(color: Colors.white.withOpacity(0.4));
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final porcentaje = audioPlayerModel.porcentaje;
    return Container(
      child: Column(
        children: [
          Text(
            audioPlayerModel.songTotalDuration,
            style: estilo,
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                width: 3,
                height: 230,
                color: Colors.white.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 230 * porcentaje,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            audioPlayerModel.currentSecond,
            style: estilo,
          ),
        ],
      ),
    );
  }
}

class _ImagenDisco extends StatelessWidget {
  const _ImagenDisco({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AudioPlayerModel>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      width: 230,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: const LinearGradient(
              colors: [Color(0xff484750), Color(0xff1e1c24)],
              begin: Alignment.topLeft)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              duration: const Duration(seconds: 10),
              infinite: true,
              manualTrigger: true,
              controller: (animationController) =>
                  controller.controller = animationController,
              child: const Image(
                image: AssetImage('assets/aurora.jpg'),
              ),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(100)),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: const Color(0xff201E28),
                  borderRadius: BorderRadius.circular(100)),
            ),
          ],
        ),
      ),
    );
  }
}
