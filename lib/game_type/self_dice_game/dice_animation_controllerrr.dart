import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiceController extends GetxController {
  RxDouble x = 0.0.obs;
  RxDouble y = 0.0.obs;
  RxInt diceFace = 1.obs;
  Timer? _timer;
  ScrollController scrollController = ScrollController();
  Timer? scrollTimer;

  // Method to roll the dice
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

  // Method to stop rolling
  void stopRolling() {
    _timer?.cancel();
    x.value = pi / 1;
  }

  // Method to start leftward scrolling
  void startScrollingLeftwards(double speed) {
    scrollTimer?.cancel();
    scrollTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (scrollController.hasClients) {
        // Calculate new scroll offset
        final newOffset = scrollController.offset - speed;
        // Ensure the new offset is within bounds
        if (newOffset < 0) {
          scrollController.jumpTo(0); // Stop at the left edge
          scrollTimer?.cancel(); // Stop the scrolling timer if at the edge
        } else {
          scrollController.animateTo(
            newOffset,
            duration: Duration(milliseconds: 100),
            curve: Curves.easeInCirc,
          );
        }
      }
    });
  }

  // Method to stop scrolling
  void stopScrolling() {
    scrollTimer?.cancel();
  }

  @override
  void onClose() {
    _timer?.cancel();
    scrollTimer?.cancel();
    super.onClose();
  }
}
