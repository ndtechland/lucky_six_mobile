import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../HomePage/homePage.dart';
import '../../price_listts/price_listfor_twodice.dart';
import 'dice2.dart';

// NeumorphicButton widget
class NeumorphicButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Gradient gradient;

  const NeumorphicButton2({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(3, 3),
            blurRadius: 6,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            offset: Offset(-3, -3),
            blurRadius: 6,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.raleway(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

// Dice3DAnimation widget
class Dice3DAnimation2 extends StatefulWidget {
  const Dice3DAnimation2({super.key});

  @override
  Dice3DAnimation2State createState() => Dice3DAnimation2State();
}

class Dice3DAnimation2State extends State<Dice3DAnimation2> {
  ///double _x1 = pi * 0.25, _y1 = pi * 0.25;
  ///double _x2 = pi * 0.25, _y2 = pi * 0.25;
  //int _diceFace1 = 1;
  // int _diceFace2 = 1;
  Timer? _diceRollTimer;
  Timer? _startTimer;

  RxDouble _x1 = 0.0.obs;
  RxDouble _y1 = 0.0.obs;
  RxDouble _x2 = 0.0.obs;
  RxDouble _y2 = 0.0.obs;
  RxInt _diceFace1 = 1.obs;
  RxInt _diceFace2 = 1.obs;

  //Timer? _diceRollTimer;
  //Timer? _startTimer;

  @override
  void initState() {
    super.initState();
    _startDiceRollAfterDelay();
  }

  void _startDiceRollAfterDelay() {
    _startTimer = Timer(Duration(seconds: 10), () {
      _rollDice(duration: Duration(seconds: 8));

      ///_startStopTimer();
    });
  }

  ///
  void _rollDice({required Duration duration}) {
    _diceRollTimer?.cancel();

    _diceRollTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _diceFace1.value = Random().nextInt(6) + 1;
        _x1.value = Random().nextDouble() * pi * 2;
        _y1.value = Random().nextDouble() * pi * 2;
        _diceFace2.value = Random().nextInt(6) + 1;
        _x2.value = (Random().nextDouble() * pi * 2);
        _y2.value = (Random().nextDouble() * pi * 2);
      });
    });

    ///

    // void _rollDice() {
    //   _diceRollTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
    //     setState(() {
    //       _diceFace1 = Random().nextInt(6) + 1;
    //       _x1 = (Random().nextDouble() * pi * 2);
    //       _y1 = (Random().nextDouble() * pi * 2);
    //       _diceFace2 = Random().nextInt(6) + 1;
    //       _x2 = (Random().nextDouble() * pi * 2);
    //       _y2 = (Random().nextDouble() * pi * 2);
    //     });
    //   });
    // }

    Future.delayed(duration, () {
      stopRolling();
      Timer(Duration(milliseconds: 400), () {
        _showResultDialog();
        //_showResultDialog();
      });
    });
  }

  // void _startStopTimer() {
  //   Timer(Duration(seconds: 8), () {
  //     _diceRollTimer?.cancel(); // Stop the dice roll after 8 seconds
  //     Timer(Duration(milliseconds: 400), () {
  //       _showResultDialog(); // Show the dialog after a 400ms delay
  //     });
  //   });
  // }

  void stopRolling() {
    _diceRollTimer?.cancel();
    setState(() {
      _x1.value = pi / 1; // Ensure it shows the top view
      _y1.value = 0;
      _x2.value = pi / 1; // Ensure it shows the top view
      _y2.value = 0; // Adjust as needed for top view
    });
  }

  void _showResultDialog() {
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
                          fontSize: 23, // Reduced title size
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12), // Reduced gap
                      Text(
                        'Dice face $_diceFace1 and $_diceFace2 won!',
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
                          Image.asset(
                            'assets/images/svg_images/dcc$_diceFace1.png',
                            height: dialogSize * 0.31, // Reduced dice size
                          ),
                          Image.asset(
                            'assets/images/svg_images/dcc$_diceFace2.png',
                            height: dialogSize * 0.31, // Reduced dice size
                          ),
                        ],
                      ),
                      SizedBox(height: 25), // Reduced gap
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: NeumorphicButton2(
                              text: 'Play Again',
                              gradient: LinearGradient(
                                colors: [Colors.greenAccent, Colors.green],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              onPressed: () {
                                Get.to(PriceListssfortwodice());
                                // Add logic to restart the game or roll the dice again
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: NeumorphicButton2(
                              text: 'Exit',
                              gradient: LinearGradient(
                                colors: [Colors.redAccent, Colors.red],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              onPressed: () {
                                Get.offAll(Home_Page());
                                // Add logic to exit the game or navigate away
                              },
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
                top: 0,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double size = min(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height) *
        0.13; // Adjust size to be smaller

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: Cube2(
                x: _x1.value,
                y: _y1.value,
                size: size,
                diceFace: _diceFace1.value,
              ),
            ),
            SizedBox(width: 11), // Space between the dice
            Cube2(
              x: _x2.value,
              y: _y2.value,
              size: size,
              diceFace: _diceFace2.value,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _diceRollTimer?.cancel();
    _startTimer?.cancel();
    super.dispose();
  }
}
