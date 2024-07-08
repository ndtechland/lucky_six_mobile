import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
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
      duration: const Duration(milliseconds: 200),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed && _isAnimating) {
          _makeApiCall(_currentIndex);
          _changeImage();
          _controller.forward(from: 0);
        }
      });

    // Start the animation after 10 seconds
    Timer(Duration(seconds: 10), () {
      setState(() {
        _isAnimating = true;
        _controller.forward(from: 0);
      });

      // Stop the animation after 5 seconds
      Timer(Duration(seconds: 6), () {
        setState(() {
          _isAnimating = false;
          _controller.stop();
          // Check the current index when the animation stops
          if (_messages.containsKey(_currentIndex)) {
            _showMessage(
                context, _messages[_currentIndex]!); // Corrected the parameters
          }
        });
      });
    });
  }

  void _changeImage() {
    setState(() {
      _currentIndex = _random.nextInt(_diceImages.length);
      _controller.duration = Duration(milliseconds: _random.nextInt(200) + 200);
    });
  }

  Future<void> _makeApiCall(int index) async {
    // Replace with your actual API endpoint
    final response =
        await http.get(Uri.parse('https://your-api-endpoint.com?index=$index'));
    if (response.statusCode == 200) {
      // Handle the API response if necessary
      print('API response for index $index: ${json.decode(response.body)}');
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  void _showMessage(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Container(
            width: 300,
            //double.infinity,
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
        padding: const EdgeInsets.all(10.0),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * 3.14159,
              child: Image.asset(
                _diceImages[_currentIndex],
                width: 60,
                height: 60,
                color: Colors.black,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
      ),
    );
  }
}