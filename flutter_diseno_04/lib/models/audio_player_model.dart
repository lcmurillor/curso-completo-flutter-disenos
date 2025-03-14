// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _playing = false;
  Duration _songDuration = const Duration(milliseconds: 0);
  Duration _current = const Duration(milliseconds: 0);

  String get songTotalDuration => printDuration(_songDuration);
  String get currentSecond => printDuration(_current);

  double get porcentaje => (_songDuration.inSeconds == 0)
      ? 0
      : _current.inSeconds / _songDuration.inSeconds;

  late AnimationController _controller;

  set controller(AnimationController value) {
    _controller = value;
  }

  AnimationController get controller => _controller;

  set playing(bool value) {
    _playing = value;
    notifyListeners();
  }

  bool get playing => _playing;

  set songDuration(Duration value) {
    _songDuration = value;
    notifyListeners();
  }

  Duration get songDuration => _songDuration;

  set current(Duration value) {
    _current = value;
    notifyListeners();
  }

  Duration get current => _current;

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    // return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
