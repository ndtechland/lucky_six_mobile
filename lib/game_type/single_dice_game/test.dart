import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DiceAnimation extends StatefulWidget {
  @override
  _DiceAnimationState createState() => _DiceAnimationState();
}

class _DiceAnimationState extends State<DiceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentIndex = 0;
  final Random _random = Random();
  bool _isAnimating = false; // Set the initial state to false
  final List<String> _diceImages = [
    'assets/images/svg_images/dice1.png',
    'assets/images/svg_images/dice2.png',
    'assets/images/svg_images/dice3.png',
    'assets/images/svg_images/dice4.png',
    'assets/images/svg_images/dice5.png',
    'assets/images/svg_images/dice6.png',
  ];

  // Map of messages for each dice index
  final Map<int, String> _messages = {
    0: 'No. 1 won!',
    1: 'No. 2 won!',
    2: 'No. 3 won!',
    3: 'No. 4 won!',
    4: 'No. 5 won!',
    5: 'No. 6 won!',
  };

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 160),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed && _isAnimating) {
          _makeApiCall(_currentIndex);
          _changeImage();
          _controller.forward(from: 0);
        }
      });

    Timer(Duration(seconds: 12), () {
      setState(() {
        _isAnimating = true;
        _controller.forward(from: 0);
      });

      Timer(Duration(seconds: 7), () {
        setState(() {
          _isAnimating = false;
          _controller.stop();
          _currentIndex = 0; // Set to front face index
          _showMessage(context, _messages[_currentIndex]!);
        });
      });
    });
  }

  void _changeImage() {
    setState(() {
      _currentIndex = _random.nextInt(_diceImages.length);
      _controller.duration = Duration(milliseconds: _random.nextInt(300) + 300);
    });
  }

  Future<void> _makeApiCall(int index) async {
    // Simulate an API call
    await Future.delayed(Duration(milliseconds: 500));
  }

  void _showMessage(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Lottie.asset(
                    'assets/images/svg_images/congratulations.json',
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Congratulations!',
                        style: GoogleFonts.aBeeZee(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        message,
                        style: GoogleFonts.nunitoSans(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 4 * 3.14159,
              child: Image.asset(
                _diceImages[_currentIndex],
                width: 60,
                height: 60,
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      ),
    );
  }
}
