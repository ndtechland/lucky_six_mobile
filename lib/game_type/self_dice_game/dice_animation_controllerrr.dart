import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

class DiceController extends GetxController {
  RxDouble x = 0.0.obs;
  RxDouble y = 0.0.obs;
  RxInt diceFace = 1.obs;
  Timer? _timer;

  void rollDice({required Duration duration}) {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      x.value = Random().nextDouble() * pi * 2;
      y.value = Random().nextDouble() * pi * 2;
      diceFace.value = Random().nextInt(6) + 1;
    });

    // Stop rolling after the specified duration
    Future.delayed(duration, () {
      stopRolling();
    });
  }

  void stopRolling() {
    _timer?.cancel();
    x.value = pi / 1;
  }
} // Ensure it shows the top
//bs bs...
