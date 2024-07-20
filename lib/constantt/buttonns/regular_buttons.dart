import 'package:flutter/material.dart';

import '../padinggss.dart'; // Assuming this contains your appPadding and other constants

class RectangularButton extends StatefulWidget {
  final String text;
  final VoidCallback press;

  const RectangularButton({Key? key, required this.text, required this.press})
      : super(key: key);

  @override
  _RectangularButtonState createState() => _RectangularButtonState();
}

class _RectangularButtonState extends State<RectangularButton> {
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
            top: appPadding / 16,
            //bottom: appPadding / 9,
            left: appPadding / 1,
            right: appPadding / 1),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          width: isPortrait
              ? (_isPressed ? size.width * 0.32 : size.width * 0.35)
              : (_isPressed ? size.width * 0.27 : size.width * 0.25),
          height: isPortrait
              ? (_isPressed ? size.height * 0.052 : size.height * 0.052)
              : (_isPressed ? size.height * 0.08 : size.height * 0.08),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(
                  //'assets/images/svg_images/rlg.jpg',
                  'assets/images/svg_images/diceback.jpg'
                  // 'assets/images/svg_images/backgroundddice2.jpeg'
                  ), // Update with your image path
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(3, 3),
                spreadRadius: 2,
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
            child: Text(
              widget.text,
              style: TextStyle(
                backgroundColor: Colors.white60,
                //background:Image.asset(""),
                fontSize: isPortrait ? size.width * 0.059 : size.width * 0.023,
                fontWeight: FontWeight.w800,
                color:
                    Colors.black, // Ensure text is visible on background image
              ),
            ),
          ),
        ),
      ),
    );
  }
}
