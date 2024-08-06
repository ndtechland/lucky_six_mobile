import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cube2 extends StatelessWidget {
  const Cube2({
    Key? key,
    required this.x,
    required this.y,
    required this.size,
    required this.diceFace,
  }) : super(key: key);

  static const double _halfPi = pi / 2, _oneHalfPi = pi + pi / 2;
  final double x, y, size;
  final int diceFace;
  double get _sum => (y + (x > pi ? pi : 0.0)).abs() % (pi * 2);

  @override
  Widget build(BuildContext context) {
    final bool _topBottom = x < _halfPi || x > _oneHalfPi;
    final bool _northSouth = _sum < _halfPi || _sum > _oneHalfPi;
    final bool _eastWest = _sum < pi;

    // Get screen size
    final screenSize = MediaQuery.of(context).size;
    final double smallSize =
        min(screenSize.width, screenSize.height) * 0.258; // Smaller dice size

    return Center(
      child: SizedBox(
        width: smallSize,
        height: smallSize,
        child: Stack(
          children: <Widget>[
            _side(zRot: y, xRot: -x, moveZ: _topBottom),
            _side(yRot: y, xRot: _halfPi - x, moveZ: _northSouth),
            _side(yRot: -_halfPi + y, xRot: _halfPi - x, moveZ: _eastWest),
          ],
        ),
      ),
    );
  }

  Widget _side({
    bool moveZ = true,
    double xRot = 0.0,
    double yRot = 0.0,
    double zRot = 0.0,
  }) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateX(xRot)
        ..rotateY(yRot)
        ..rotateZ(zRot)
        ..translate(0.0, 0.0, moveZ ? -size / 1.92 : size / 1.92),
      child: Container(
        alignment: Alignment.center,
        child: Container(
          width: size + 3, // Slightly larger to cover the gap
          height: size + 3,
          decoration: BoxDecoration(
            color: Color(0xffc03129), // Background color to fill corners

            // color: Colors.black, // Black background color
            borderRadius: BorderRadius.circular(2.5), // Circular radius
          ),
          child: Container(
            margin: EdgeInsets.all(0), // Margin to create a gap between layers
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/svg_images/dcc$diceFace.png'),
                fit: BoxFit.contain,
              ),
              borderRadius:
                  BorderRadius.circular(2.5), // Slightly smaller radius
              border: Border.all(
                  color: Color(0xffc03129), width: 0), // Border color
            ),
          ),
        ),
      ),
    );
  }
}
