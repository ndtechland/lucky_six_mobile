import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'double_dice_game.dart';

class TimerClockPlayer2dice extends StatefulWidget {
  @override
  _TimerClockPlayer2diceState createState() => _TimerClockPlayer2diceState();
}

class _TimerClockPlayer2diceState extends State<TimerClockPlayer2dice> {
  int _timerSeconds = 10;
  late Timer _timer;
  bool _gameStarted = false;

  @override
  void initState() {
    super.initState();

    // Lock the device orientation
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    // Start the countdown timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          timer.cancel();
          _startGameTimer();
        }
      });
    });
  }

  void _startGameTimer() {
    setState(() {
      _gameStarted = true;
      // _timerSeconds = 1;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          timer.cancel();

          /// Automatically redirect to another screen after timer reaches 0
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Play_Now_2dice()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    // Restore the device orientation to default
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);

    _timer.cancel();
    super.dispose();
  }

  TextStyle _getTextStyle(int seconds) {
    if (seconds <= 45 && seconds >= 36) {
      return TextStyle(
          fontSize: 12, fontWeight: FontWeight.w100, color: Colors.white);
    } else if (seconds <= 35 && seconds >= 26) {
      return TextStyle(
          fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white);
    } else if (seconds <= 25 && seconds >= 16) {
      return TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white);
    } else if (seconds <= 15 && seconds >= 6) {
      return TextStyle(
          fontSize: 11, fontWeight: FontWeight.w400, color: Colors.white);
    } else {
      return TextStyle(
          fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var fontheight = isPortrait
        ? MediaQuery.of(context).size.height * 0.21
        : MediaQuery.of(context).size.height * 0.5;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: _gameStarted
            ? Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'GO',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: _timerSeconds / 10,
                    strokeWidth: 6,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    backgroundColor: Colors.grey[300],
                  ),
                  Text(
                    '$_timerSeconds',
                    style: GoogleFonts.abyssinicaSil(
                      fontSize: fontheight * 0.14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
