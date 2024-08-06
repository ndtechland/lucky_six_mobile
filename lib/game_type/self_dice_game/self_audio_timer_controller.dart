import 'dart:async';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  late AudioPlayer audioPlayer;
  Timer? _stopTimer;

  @override
  void onInit() {
    super.onInit();
    // Initialize the audio player
    audioPlayer = AudioPlayer();
    _preloadAudio();
  }

  void _preloadAudio() async {
    try {
      await audioPlayer.setAsset('assets/audios/diceroolingggg.mp3');
      print('Audio preloaded successfully.');
    } catch (e) {
      print('Error preloading audio: $e');
    }
  }

  void startRollingMusic() {
    // Cancel any existing timer before starting a new one
    _stopTimer?.cancel();

    // Restart the audio from the beginning
    audioPlayer.seek(Duration.zero);
    audioPlayer.play();

    // Stop the audio after 7 seconds
    _stopTimer = Timer(Duration(seconds: 9), () {
      audioPlayer.stop();
    });
  }

  @override
  void onClose() {
    _stopTimer?.cancel();
    audioPlayer.dispose();
    super.onClose();
  }
}
