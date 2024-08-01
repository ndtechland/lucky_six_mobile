import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomePageDicetest extends StatefulWidget {
  const HomePageDicetest({super.key});

  @override
  State<HomePageDicetest> createState() => _HomePageDicetestState();
}

class _HomePageDicetestState extends State<HomePageDicetest> {
  Random random = Random();
  int currentImageIndex = 0;
  double rotationAngle = 0.0;
  List<String> images = [
    'assets/images/svg_images/dice_1.png',
    'assets/images/svg_images/dice_2.png',
    'assets/images/svg_images/dice_3.png',
    'assets/images/svg_images/dice_4.png',
    'assets/images/svg_images/dice_5.png',
    'assets/images/svg_images/dice_6.png',
  ];
  AudioPlayer player = AudioPlayer();
  int countdown = 3; // Countdown timer starting value

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown == 0) {
        timer.cancel();
        rollDice();
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  Future<void> rollDice() async {
    // Play sound
    await player.setAsset('assets/audios/diceroolingggg.mp3');
    player.play();

    // Rolling the dice faster
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      // Decreased interval for faster updates
      setState(() {
        currentImageIndex = random.nextInt(6);
        rotationAngle += 0.2; // Increased rotation for a more dynamic effect
      });

      if (timer.tick >= 300) {
        // 100 iterations * 30ms = 3000ms ~ 3 seconds of rolling
        timer.cancel();
        player.stop();

        // Show dialog with final dice value
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Dice Rolled"),
            content: Image.asset(images[currentImageIndex]),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    });

    // Stop audio after 7 seconds
    Timer(Duration(seconds: 8), () {
      player.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Roll'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.rotate(
                  angle: rotationAngle,
                  child: Image.asset(
                    images[currentImageIndex],
                    height: 100,
                  ),
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: rollDice,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Roll',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Text(
              countdown > 0 ? '$countdown' : '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
