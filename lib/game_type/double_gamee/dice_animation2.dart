import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_app/price_listts/price_listfor_twodice.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../../HomePage/homePage.dart';

class DiceAnimation2 extends StatefulWidget {
  @override
  _DiceAnimation2State createState() => _DiceAnimation2State();
}

class _DiceAnimation2State extends State<DiceAnimation2>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;

  int _currentIndex = 0;
  int _currentIndex2 = 0;

  final Random _random = Random();
  bool _isAnimating = false;
  final List<String> _diceImages = [
    'assets/images/svg_images/dice_1.png',
    'assets/images/svg_images/dice_2.png',
    'assets/images/svg_images/dice_3.png',
    'assets/images/svg_images/dice_4.png',
    'assets/images/svg_images/dice_5.png',
    'assets/images/svg_images/dice_6.png',
  ];

  final Map<int, String> _messages = {
    0: 'Dice No. 1 ',
    1: 'Dice No. 2 ',
    2: 'Dice No. 3 ',
    3: 'Dice No. 4 ',
    4: 'Dice No. 5 ',
    5: 'Dice No. 6 ',
  };

  final Map<int, String> _messages2 = {
    0: ' 1 won!',
    1: ' 2 won!',
    2: ' 3 won!',
    3: ' 4 won!',
    4: ' 5 won!',
    5: ' 6 won!',
  };

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed && _isAnimating) {
          _changeImage();
          _controller.forward(from: 0);
        }
      });

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed && _isAnimating) {
          _changeImage2();
          _controller2.forward(from: 0);
        }
      });

    // Start the animation after 10 seconds
    Timer(Duration(seconds: 11), () {
      setState(() {
        _isAnimating = true;
        _controller.forward(from: 0);
        _controller2.forward(from: 0);
      });

      // Stop the animation after 6 seconds
      Timer(Duration(milliseconds: 7300), () {
        setState(() {
          _isAnimating = false;
          _controller.stop();
          _controller2.stop();
          // Check the current index when the animation stops
          if (_messages.containsKey(_currentIndex) &&
              _messages2.containsKey(_currentIndex2)) {
            _showMessage(context, _messages[_currentIndex]!,
                _messages2[_currentIndex2]!);
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

  void _changeImage2() {
    setState(() {
      _currentIndex2 = _random.nextInt(_diceImages.length);
      _controller2.duration =
          Duration(milliseconds: _random.nextInt(200) + 100);
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

  void _showMessage(BuildContext context, String message, String message2) {
    showCupertinoDialog(
      // barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        var isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        var fontheight = isPortrait
            ? MediaQuery.of(context).size.height * 0.21
            : MediaQuery.of(context).size.height * 0.5;
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            message,
                            style: GoogleFonts.nunitoSans(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            " & ${message2}",
                            style: GoogleFonts.nunitoSans(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
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
                Get.to(PriceListssfortwodice());
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
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.375),
        child: SizedBox(
          height: 70,
          width: 180,
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //color: Colors.red,
                    //border: Border.all(color: Colors.red.shade200, width: 4)
                  ),
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
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.022,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //color: Colors.red,
                    // border: Border.all(color: Colors.red.shade200, width: 4)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedBuilder(
                      animation: _controller2,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _controller2.value * 2 * 3.14159,
                          child: Image.asset(
                            _diceImages[_currentIndex2],
                            width: 60,
                            height: 60,
                            // color: Colors.black,
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
