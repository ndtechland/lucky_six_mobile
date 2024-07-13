// import 'dart:async';
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:get/get.dart';
//
// class MusicController extends GetxController {
//   final AudioPlayer audioPlayer = AudioPlayer();
//   final isPlaying = false.obs;
//   Timer? _timer;
//
//   void playLocalMusic(int durationInSeconds) async {
//     await audioPlayer.play(AssetSource('assets/musicc/musicdice.mp3'));
//     isPlaying.value = true;
//
//     _timer?.cancel();
//     _timer = Timer(Duration(seconds: durationInSeconds), () {
//       stopMusic();
//     });
//   }
//
//   void stopMusic() async {
//     await audioPlayer.stop();
//     isPlaying.value = false;
//     _timer?.cancel();
//   }
//
//   @override
//   void onClose() {
//     audioPlayer.dispose();
//     super.onClose();
//   }
// }
