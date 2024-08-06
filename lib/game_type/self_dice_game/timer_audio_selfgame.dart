import 'package:flutter/material.dart';
import 'package:game_app/game_type/self_dice_game/self_audio_timer_controller.dart';
import 'package:get/get.dart';

class TimerScreenAudioSelf extends StatelessWidget {
  final AudioController controller = Get.put(AudioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // body: Center(
      //   child: Text(
      //     '',
      //     style: TextStyle(fontSize: 24, color: Colors.white),
      //   ),
      // ),
    );
  }
}
