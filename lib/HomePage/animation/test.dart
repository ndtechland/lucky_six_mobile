import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DiceAnimation extends StatefulWidget {
  @override
  _DiceAnimationState createState() => _DiceAnimationState();
}

class _DiceAnimationState extends State<DiceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentIndex = 0;
  final Random _random = Random();
  bool _isAnimating = true;
  final List<String> _diceImages = [
    'assets/images/dice1.png',
    'assets/images/dice2.png',
    'assets/images/dice3.png',
    'assets/images/dice4.png',
    'assets/images/dice5.png',
    'assets/images/dice6.png',
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
    Timer(Duration(seconds: 45), () {
      setState(() {
        _isAnimating = true;
        _controller.forward(from: 0);
      });

      // Stop the animation after 5 seconds
      Timer(Duration(seconds: 5), () {
        setState(() {
          _isAnimating = false;
          _controller.stop();
          // Check the current index when the animation stops
          if (_messages.containsKey(_currentIndex)) {
            _showMessage(_messages[_currentIndex]!);
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

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
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
