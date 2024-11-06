import 'package:flutter/material.dart';

class NeumorphicButton2 extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final VoidCallback onPressed;

  const NeumorphicButton2({
    Key? key,
    required this.text,
    required this.gradient,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.7),
            offset: Offset(3, 3),
            blurRadius: 1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(-4, -4),
            blurRadius: 1,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(0),
        ),
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
