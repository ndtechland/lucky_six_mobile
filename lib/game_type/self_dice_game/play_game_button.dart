import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import '../../HomePage/homePage.dart';
import 'dice_animation_controllerrr.dart';

class PlayGameButtonSelf extends StatefulWidget {
  PlayGameButtonSelf({Key? key}) : super(key: key);

  @override
  _PlayGameButtonSelfState createState() => _PlayGameButtonSelfState();
}

class _PlayGameButtonSelfState extends State<PlayGameButtonSelf> {
  late AudioPlayer _audioPlayer;
  bool _isVisible = false;
  bool _isPlayAgain = false;
  final DiceController diceController = Get.put(DiceController());

  int _timerSeconds = 5;
  late Timer _timer;
  Timer? _speedTimer;
  Timer? _startTimer;
  Timer? _stopTimer;
  bool _gameStarted = false;
  bool _gameEnded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _preloadAudio(); // Preload audio during initialization

    Timer(Duration(seconds: 0), () {
      setState(() {
        _isVisible = true;
      });
    });

    Timer(Duration(seconds: 5), () {
      setState(() {
        _isPlayAgain = true;
      });
    });
  }

  void _preloadAudio() async {
    try {
      await _audioPlayer.setAsset('assets/audios/dice.mp3'
          //'assets/audios/diceroolingggg.mp3'
          );
      print('Audio preloaded successfully.');
    } catch (e) {
      print('Error preloading audio: $e');
    }
  }

  void _playAudio() {
    _audioPlayer.play();

    // Stop the audio after 5 seconds
    Timer(Duration(seconds: 5), () {
      _audioPlayer.stop();
    });
  }

  void _startGameTimer() {
    setState(() {
      _timerSeconds = 7;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: _isVisible
          ? GestureDetector(
              onTap: () async {
                Future.delayed(Duration(seconds: 4), () {
                  _playAudio(); // Play audio when button is clicked
                });
                // _playAudio(); // Play audio when button is clicked
                diceController.rollDice(duration: Duration(seconds: 5));

                // Delay dialog display until after dice roll completes
                Future.delayed(Duration(seconds: 5), () {
                  _showResultDialog(context, diceController.diceFace.value);
                });
              },
              child: Container(
                width: screenWidth * 0.7,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _isPlayAgain
                        ? [Colors.blueAccent, Colors.blue]
                        : [Colors.blueAccent, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(-4, 4),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      offset: Offset(4, -4),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _isPlayAgain
                          ? Icons.play_circle_filled_sharp
                          : Icons.play_circle_filled_sharp,
                      color: Colors.white,
                      size: 25,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2, 2),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Text(
                      _isPlayAgain ? 'Play' : 'Play',
                      style: GoogleFonts.abyssinicaSil(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2, 2),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }

  void _showResultDialog(BuildContext context, int diceFace) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final double dialogSize = min(
          MediaQuery.of(context).size.width * 0.8,
          MediaQuery.of(context).size.height * 0.8,
        );

        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Container(
                width: dialogSize,
                height: dialogSize,
                decoration: BoxDecoration(
                  color: Color(0xFF2E2E2E),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(3, 3),
                      blurRadius: 8,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      offset: Offset(-3, -3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Game Result',
                        style: GoogleFonts.abyssinicaSil(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Dice face $diceFace won!',
                        style: GoogleFonts.raleway(
                          color: Colors.yellow,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 25),
                      Image.asset(
                        'assets/images/svg_images/dcc$diceFace.png',
                        height: dialogSize * 0.31,
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                onPrimary: Colors.green,
                              ),
                              onPressed: () {
                                Get.back();
                                // Trigger a new dice roll
                              },
                              child: Text('Close',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent,
                                onPrimary: Colors.red,
                              ),
                              onPressed: () {
                                Get.to(Home_Page());
                              },
                              child: Text(
                                'Exit',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
