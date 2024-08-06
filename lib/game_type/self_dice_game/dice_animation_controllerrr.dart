import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

class DiceController extends GetxController {
  var x = (pi * 0.25).obs; // Observable double for x
  var y = (pi * 0.25).obs; // Observable double for y
  var diceFace = 1.obs; // Observable int for diceFace
  Timer? _diceRollTimer;

  void rollDice({required Duration duration}) {
    _diceRollTimer?.cancel(); // Ensure only one timer is running
    _diceRollTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      x.value = (Random().nextDouble() * pi * 2);
      y.value = (Random().nextDouble() * pi * 2);
      diceFace.value = Random().nextInt(6) + 1;
    });

    // Stop rolling after the specified duration
    Timer(duration, () {
      _diceRollTimer?.cancel();
      update(); // Notify the UI
    });
  }

  void updatePosition({required double x, required double y}) {
    this.x.value = x;
    this.y.value = y;
  }
}
