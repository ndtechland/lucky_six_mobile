import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../price_listts/price_listfor_twodice.dart';
import 'double_dice_3d.dart';

class PlayAgainIconButton extends StatefulWidget {
  //final VoidCallback onPressed;

  const PlayAgainIconButton({Key? key}) : super(key: key);

  @override
  _PlayAgainIconButtonState createState() => _PlayAgainIconButtonState();
}

class _PlayAgainIconButtonState extends State<PlayAgainIconButton> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Set a timer to make the button visible after 18 seconds
    Timer(Duration(seconds: 18), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: _isVisible
          ? GestureDetector(
              onTap: () {
                _showResultDialog();
              },
              child: Container(
                width: screenWidth * 0.07,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.greenAccent, Colors.green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(-4, 4),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      offset: Offset(4, -4),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 30,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }

  void _showResultDialog() {
    showDialog(
      //barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final double dialogSize = min(
          MediaQuery.of(context).size.width * 0.5,
          MediaQuery.of(context).size.height * 0.5,
        );

        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
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
            //padding: EdgeInsets.all(15),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Play Again!',
                  style: GoogleFonts.abyssinicaSil(
                    color: Colors.green,
                    fontSize: 23, // Reduced title size
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12), // Reduced gap
                Text(
                  'You want to play again this game?',
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
                    NeumorphicButton2(
                      text: 'Yes',
                      gradient: LinearGradient(
                        colors: [Colors.redAccent, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      onPressed: () {
                        print("play again button pressed"); // Debugging
                        Get.to(PriceListssfortwodice());
                      },
                    ),
                    SizedBox(width: 4),
                    NeumorphicButton2(
                      text: 'No',
                      gradient: LinearGradient(
                        colors: [Colors.greenAccent, Colors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      onPressed: () {
                        print("back button pressed");
                        Navigator.pop(context);
                        // Debugging
                        //Get.to(Home_Page());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
