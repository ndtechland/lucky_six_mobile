import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicController with ChangeNotifier {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  static const String url = 'https://angavastram.com/images/pirates_bgm.mp3';

  MusicController() {
    _audioPlayer = AudioPlayer();
    _initAudioPlayer();
  }

  bool get isPlaying => _isPlaying;

  void _initAudioPlayer() {
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.completed) {
        _isPlaying = false;
        notifyListeners();
      }
    });
  }

  Future<void> playMusic(url) async {
    try {
      await _audioPlayer.play(url);
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      print('Error playing music: $e');
    }
  }

  Future<void> pauseMusic() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> stopMusic() async {
    await _audioPlayer.stop();
    _isPlaying = false;
    notifyListeners();
  }
}
