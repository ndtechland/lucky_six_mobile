import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _timerSeconds = 10;
  late Timer _timer;
  late AudioPlayer _audioPlayer;
  Timer? _speedTimer;
  Timer? _startTimer;
  Timer? _stopTimer;
  bool _gameStarted = false;
  bool _gameEnded = false;

  @override
  void initState() {
    super.initState();

    // Lock the device orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Initialize the audio player
    _audioPlayer = AudioPlayer();
    _preloadAudio();

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

  void _preloadAudio() async {
    try {
      await _audioPlayer.setAsset('assets/audios/diceroolingggg.mp3');
      print('Audio preloaded successfully.');
    } catch (e) {
      print('Error preloading audio: $e');
    }
  }

  void _startRollingMusic() {
    _startTimer = Timer(Duration(seconds: 0), () {
      _audioPlayer.play();

      // Stop the audio after 7 seconds
      _stopTimer = Timer(Duration(seconds: 9), () {
        _audioPlayer.stop();
      });
    });
  }

  void _startGameTimer() {
    setState(() {
      _gameStarted = true;
      _timerSeconds = 7;
    });

    // Start the music rolling
    _startRollingMusic();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          timer.cancel();
          setState(() {
            _gameEnded = true;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    // Restore the device orientation to default
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _timer.cancel();
    _speedTimer?.cancel();
    _startTimer?.cancel();
    _stopTimer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  TextStyle _getTextStyle(int seconds) {
    // Different font weights for each second
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: _gameEnded
            ? Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Game ended!',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              )
            : _gameStarted
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Game started!',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Game starts in ',
                          style: _getTextStyle(_timerSeconds),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: _timerSeconds / 10,
                            strokeWidth: 6,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red),
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
                            TextSpan(
                              text: ' seconds',
                              style: _getTextStyle(_timerSeconds),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
