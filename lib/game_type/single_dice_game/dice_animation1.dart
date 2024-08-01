import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../../HomePage/homePage.dart';
import '../../price_listts/price_listtss.dart';

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
    // "assets/images/svg_images/3d1.png",
    // "assets/images/svg_images/3d2.png",
    // "assets/images/svg_images/3d3.png",
    // "assets/images/svg_images/3d4.png",
    // "assets/images/svg_images/3d5.png",
    // "assets/images/svg_images/3d6.png",
    ///
    // 'assets/images/dice1.png',
    // 'assets/images/dice2.png',
    // 'assets/images/dice3.png',
    // 'assets/images/dice4.png',
    // 'assets/images/dice5.png',
    // 'assets/images/dice6.png',
    ///
    'assets/images/svg_images/dice_1.png',
    'assets/images/svg_images/dice_2.png',
    'assets/images/svg_images/dice_3.png',
    'assets/images/svg_images/dice_4.png',
    'assets/images/svg_images/dice_5.png',
    'assets/images/svg_images/dice_6.png',
  ];

  // Map of messages for each dice index
  final Map<int, String> _messages = {
    0: 'Dice No. 1 won!',
    1: 'Dice No. 2 won!',
    2: 'Dice No. 3 won!',
    3: 'Dice No. 4 won!',
    4: 'Dice No. 5 won!',
    5: 'Dice No. 6 won!',
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
    Timer(Duration(seconds: 13), () {
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
      _controller.duration = Duration(milliseconds: _random.nextInt(200) + 100);
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
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var fontheight = isPortrait
        ? MediaQuery.of(context).size.height * 0.21
        : MediaQuery.of(context).size.height * 0.5;
    showCupertinoDialog(
      context: context,

      ///todo: commented its will remove after testing will be false 30 jul 2024,
      barrierDismissible: true,
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
                Get.to(PriceListss());
                //Navigator.of(context).pop();
              },
              child: Text('Play Again',
                  style: GoogleFonts.abyssinicaSil(
                    fontSize: fontheight * 0.08,
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Get.to(Home_Page());

                // Navigator.of(context).pop();
              },
              child: Text(
                "Exit",
                style: GoogleFonts.abyssinicaSil(
                  fontSize: fontheight * 0.08,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
        padding: const EdgeInsets.all(8.0),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * 3.14159,
              child: Image.asset(
                _diceImages[_currentIndex],
                width: 60,
                height: 60,
                //color: Colors.black,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
      ),
    );
  }
}
