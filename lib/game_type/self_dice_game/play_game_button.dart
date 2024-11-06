import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_app/game_type/self_dice_game/self_audio_timer_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../HomePage/homePage.dart';
import '../3d_dice/double_dice_3d.dart';
import 'dice_animation_controllerrr.dart';

class PlayGameButtonSelf extends StatefulWidget {
  PlayGameButtonSelf({Key? key}) : super(key: key);

  @override
  _PlayGameButtonSelfState createState() => _PlayGameButtonSelfState();
}

class _PlayGameButtonSelfState extends State<PlayGameButtonSelf>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  bool _isPlaying = false;
  bool _isPlayAgain = false;
  final DiceController diceController = Get.put(DiceController());
  AudioController controller = Get.put(AudioController());

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  int _timerSeconds = 8;
  late Timer _timer;
  Timer? _stateChangeTimer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _colorAnimation =
        ColorTween(begin: Colors.blueAccent, end: Colors.redAccent).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    Timer(Duration(seconds: 0), () {
      setState(() {
        _isVisible = true;
      });
    });

    Timer(Duration(seconds: 8), () {
      setState(() {
        _isPlayAgain = true;
      });
    });
  }

  void _startGame() {
    setState(() {
      _isPlaying = true;
      _isPlayAgain = false;
    });

    controller.startRollingMusic(); // Call the audio feature
    diceController.rollDice(duration: Duration(seconds: 8));

    // Start a timer to revert button state after 8 seconds
    _stateChangeTimer = Timer(Duration(seconds: 8), () {
      if (mounted) {
        setState(() {
          _isPlaying = false;
          _isPlayAgain = true;
        });

        // Show result dialog after dice roll completes
        Future.delayed(Duration(milliseconds: 100), () {
          _showResultDialog(context, diceController.diceFace.value);
        });
      }
    });

    // Trigger animation
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _stateChangeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _isVisible
            ? GestureDetector(
                key: ValueKey<bool>(_isPlaying),
                onTap:
                    _isPlaying ? null : _startGame, // Disable tap when running
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    width: screenWidth * 0.7,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _isPlayAgain
                            ? [Colors.blueAccent, Colors.blue]
                            : _colorAnimation.value != null
                                ? [Colors.redAccent, _colorAnimation.value!]
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
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            _isPlaying
                                ? Icons.pause_circle_filled
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
                          SizedBox(width: 1),
                          Text(
                            _isPlaying ? 'Running..' : 'Play Now',
                            style: GoogleFonts.abyssinicaSil(
                              color: Colors.white,
                              fontSize: 15,
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
                  ),
                ),
              )
            : SizedBox.shrink(),
      ),
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
                                foregroundColor: Colors.green,
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Reset game state
                                setState(() {
                                  _isPlaying = false;
                                  _isPlayAgain = true;
                                });
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
                                foregroundColor: Colors.red,
                                backgroundColor: Colors.redAccent,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
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
                  onTap: () {
                    Navigator.of(context).pop();
                    // Reset game state
                    setState(() {
                      _isPlaying = false;
                      _isPlayAgain = true;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
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

  void _showResultDialog2() {
    showDialog(
      //barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final double dialogSize = min(
          MediaQuery.of(context).size.width * 0.5,
          MediaQuery.of(context).size.height * 0.5,
        );

        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
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
            //padding: EdgeInsets.all(15),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Play Game!',
                  style: GoogleFonts.abyssinicaSil(
                    color: Colors.red,
                    fontSize: 23, // Reduced title size
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12), // Reduced gap
                Text(
                  'Your selected price is: 50 coins\n'
                  'Your Selected dice is : 4',
                  style: GoogleFonts.raleway(
                    color: Colors.yellow,
                    fontSize: 16, // Reduced subtitle size
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25), // Reduced gap
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NeumorphicButton2(
                      text: 'Yes',
                      gradient: LinearGradient(
                        colors: [Colors.redAccent, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      onPressed: () {
                        print("exit button pressed"); // Debugging
                        //Get.to(Home_Page());
                      },
                    ),
                    SizedBox(width: 4),
                    NeumorphicButton2(
                      text: 'No',
                      gradient: LinearGradient(
                        colors: [Colors.greenAccent, Colors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      onPressed: () {
                        print("back button pressed");
                        Navigator.pop(context);
                        // Debugging
                        //Get.to(Home_Page());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
