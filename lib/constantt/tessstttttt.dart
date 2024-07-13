import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DiceRollingMusic extends StatefulWidget {
  @override
  _DiceRollingMusicState createState() => _DiceRollingMusicState();
}

class _DiceRollingMusicState extends State<DiceRollingMusic> {
  late AudioPlayer _audioPlayer;
  Timer? _startTimer;
  Timer? _stopTimer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _startRollingMusic();
  }

  void _startRollingMusic() {
    _startTimer = Timer(Duration(seconds: 15), () {
      _audioPlayer.play(UrlSource(
          'https://admin.hirejobindia.com/BannerImages/gamemusic.mp3'));
      _stopTimer = Timer(Duration(seconds: 15), () {
        _audioPlayer.stop();
      });
    });
  }

  @override
  void dispose() {
    _startTimer?.cancel();
    _stopTimer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Rolling Music'),
      ),
      body: Center(
        child:
            Text('Music will play after 15 seconds and stop after 10 seconds'),
      ),
    );
  }
}
