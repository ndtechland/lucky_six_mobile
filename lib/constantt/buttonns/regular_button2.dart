import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../padinggss.dart';

class RectangularButton2 extends StatefulWidget {
  final String text;
  final String text2; // Added second text
  final VoidCallback press;

  const RectangularButton2({
    Key? key,
    required this.text,
    required this.text2, // Added second text
    required this.press,
  }) : super(key: key);

  @override
  _RectangularButton2State createState() => _RectangularButton2State();
}

class _RectangularButton2State extends State<RectangularButton2> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.press();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: appPadding / 19,
          // bottom: appPadding / 21,
          left: appPadding / 2,
          right: appPadding / 2,
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          width: isPortrait
              ? (_isPressed ? size.width * 0.75 : size.width * 0.70)
              : (_isPressed ? size.width * 0.50 : size.width * 0.40),
          height: isPortrait
              ? (_isPressed ? size.height * 0.042 : size.height * 0.042)
              : (_isPressed ? size.height * 0.063 : size.height * 0.063),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: AssetImage(
                'assets/images/svg_images/diceback.jpg', // Update with your image path
              ),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 0,
                color: Colors.black,
              ),
              BoxShadow(
                offset: Offset(-1, -1),
                spreadRadius: 0,
                blurRadius: 0,
                color: Colors.black38,
              ),
            ],
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.text,
                    style: TextStyle(
                      backgroundColor: Colors.white60,
                      fontSize:
                          isPortrait ? size.width * 0.036 : size.width * 0.020,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: widget.text2,
                    style: TextStyle(
                      backgroundColor: Colors.white60,
                      fontSize:
                          isPortrait ? size.width * 0.041 : size.width * 0.023,
                      fontWeight: FontWeight.w800,
                      color: Colors.red.shade700, // Second text color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
