import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../HomePage/homePage.dart';
import '../../price_listts/price_listtss.dart';
import 'dice.dart'; // Make sure to import your Cube widget

class NeumorphicButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Gradient gradient;

  const NeumorphicButton({
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
          primary: Colors.transparent,
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

class Dice3DAnimation extends StatefulWidget {
  const Dice3DAnimation({super.key});

  @override
  Dice3DAnimationState createState() => Dice3DAnimationState();
}

class Dice3DAnimationState extends State<Dice3DAnimation> {
  RxDouble _x = 0.0.obs;
  RxDouble _y = 0.0.obs;
  RxInt _diceFace = 1.obs;
  Timer? _diceRollTimer;
  Timer? _startTimer;

  @override
  void initState() {
    super.initState();
    _startDiceRollAfterDelay();
  }

  void _startDiceRollAfterDelay() {
    _startTimer = Timer(Duration(seconds: 10), () {
      _rollDice(duration: Duration(seconds: 8));
    });
  }

  void _rollDice({required Duration duration}) {
    _diceRollTimer?.cancel();

    _diceRollTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _diceFace.value = Random().nextInt(6) + 1;
        _x.value = Random().nextDouble() * pi * 2;
        _y.value = Random().nextDouble() * pi * 2;
      });
    });

    Future.delayed(duration, () {
      stopRolling();
      Timer(Duration(milliseconds: 400), () {
        _showResultDialog();
      });
    });
  }

  void stopRolling() {
    _diceRollTimer?.cancel();
    setState(() {
      _x.value = pi / 1; // Ensure it shows the top view
      _y.value = 0; // Adjust as needed for top view
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
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Dice face ${_diceFace.value} won!',
                        style: GoogleFonts.raleway(
                          color: Colors.yellow,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 25),
                      Image.asset(
                        'assets/images/svg_images/dcc${_diceFace.value}.png',
                        height: dialogSize * 0.31,
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: NeumorphicButton(
                              text: 'Play Again',
                              gradient: LinearGradient(
                                colors: [Colors.greenAccent, Colors.green],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              onPressed: () {
                                Get.to(PriceListss());
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: NeumorphicButton(
                              text: 'Exit',
                              gradient: LinearGradient(
                                colors: [Colors.redAccent, Colors.red],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              onPressed: () {
                                Get.to(Home_Page());
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

  @override
  Widget build(BuildContext context) {
    final double size = min(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ) *
        0.128;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Cube(
          x: _x.value,
          y: _y.value,
          size: size,
          diceFace: _diceFace.value,
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
