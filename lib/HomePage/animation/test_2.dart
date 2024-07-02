import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _timerSeconds = 45;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

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
    super.dispose();
  }

  TextStyle _getTextStyle(int seconds) {
    // Different font weights for each second
    if (seconds <= 45 && seconds >= 36) {
      return TextStyle(
          fontSize: 14, fontWeight: FontWeight.w100, color: Colors.white);
    } else if (seconds <= 35 && seconds >= 26) {
      return TextStyle(
          fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white);
    } else if (seconds <= 25 && seconds >= 16) {
      return TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white);
    } else if (seconds <= 15 && seconds >= 6) {
      return TextStyle(
          fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);
    } else {
      return TextStyle(
          fontSize: 14, fontWeight: FontWeight.w900, color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: _timerSeconds > 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Game starts in ',
                      style: _getTextStyle(_timerSeconds),
                      children: <TextSpan>[
                        // TextSpan(
                        //   text: '$_timerSeconds',
                        //   style: _getTextStyle(_timerSeconds)
                        //       .copyWith(color: Colors.red)
                        //       .copyWith(fontSize: 18),
                        // ),
                        // TextSpan(
                        //   text: ' seconds',
                        //   style: _getTextStyle(_timerSeconds),
                        // ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: _timerSeconds / 45,
                        strokeWidth: 6,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        backgroundColor: Colors.grey[300],
                      ),
                      Text(
                        '$_timerSeconds',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: '',
                      style: _getTextStyle(_timerSeconds),
                      children: <TextSpan>[
                        // TextSpan(
                        //   text: '$_timerSeconds',
                        //   style: _getTextStyle(_timerSeconds)
                        //       .copyWith(color: Colors.red)
                        //       .copyWith(fontSize: 18),
                        // ),
                        TextSpan(
                          text: ' seconds',
                          style: _getTextStyle(_timerSeconds),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Text(
                'Now the game has been started!',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
