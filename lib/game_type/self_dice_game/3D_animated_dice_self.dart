import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../HomePage/homePage.dart';
import 'dice_3d_cube.dart';
import 'dice_animation_controllerrr.dart';

class NeumorphicButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Gradient gradient;

  const NeumorphicButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(3, 3),
            blurRadius: 6,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            offset: Offset(-3, -3),
            blurRadius: 6,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.raleway(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

// Update the import to the correct path

// Update the import to the correct path
// Update the import to the correct path

// Update the import to the correct path

class Dice3DAnimationSelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DiceController diceController = Get.put(DiceController());
    final double size = min(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ) *
        0.138;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Obx(() => GestureDetector(
                  onPanUpdate: (DragUpdateDetails u) {
                    final double newX =
                        (diceController.x.value + -u.delta.dy / 120) % (pi * 2);
                    final double newY =
                        (diceController.y.value + -u.delta.dx / 120) % (pi * 2);
                    diceController.updatePosition(x: newX, y: newY);
                  },
                  child: CubeSelf(
                    x: diceController.x.value,
                    y: diceController.y.value,
                    size: size,
                    diceFace: diceController.diceFace.value,
                  ),
                )),
          ),
          // Positioned(
          //   top: MediaQuery.of(context).size.height * 0.05,
          //   left: MediaQuery.of(context).size.width * 0.05,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width * 0.18,
          //     height: MediaQuery.of(context).size.height * 0.08,
          //     color: Colors
          //         .transparent, // Ensure container is transparent to visualize position
          //     child: InkWell(
          //       onTap: () {
          //         diceController.rollDice(duration: Duration(seconds: 5));
          //         // Delay dialog display until after dice roll completes
          //         Future.delayed(Duration(seconds: 5), () {
          //           _showResultDialog(context, diceController.diceFace.value);
          //         });
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           gradient: LinearGradient(
          //             colors: [Colors.blueAccent, Colors.blue],
          //             begin: Alignment.topLeft,
          //             end: Alignment.bottomRight,
          //           ),
          //           borderRadius: BorderRadius.circular(10),
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.black.withOpacity(0.3),
          //               offset: Offset(-4, 4),
          //               blurRadius: 10,
          //             ),
          //             BoxShadow(
          //               color: Colors.white.withOpacity(0.3),
          //               offset: Offset(4, -4),
          //               blurRadius: 10,
          //             ),
          //           ],
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Icon(
          //               Icons.play_circle,
          //               color: Colors.white,
          //               size: 25,
          //               shadows: [
          //                 Shadow(
          //                   color: Colors.black.withOpacity(0.5),
          //                   offset: Offset(2, 2),
          //                   blurRadius: 2,
          //                 ),
          //               ],
          //             ),
          //             SizedBox(width: 10),
          //             Text(
          //               'Play Now',
          //               style: GoogleFonts.abyssinicaSil(
          //                 color: Colors.white,
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w600,
          //                 shadows: [
          //                   Shadow(
          //                     color: Colors.black.withOpacity(0.5),
          //                     offset: Offset(2, 2),
          //                     blurRadius: 2,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void _showResultDialog(BuildContext context, int diceFace) {
    final DiceController diceController = Get.put(DiceController());

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final double dialogSize = min(
          MediaQuery.of(context).size.width * 0.8,
          MediaQuery.of(context).size.height * 0.8,
        );

        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Container(
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
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Game Result',
                        style: GoogleFonts.abyssinicaSil(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Dice face $diceFace won!',
                        style: GoogleFonts.raleway(
                          color: Colors.yellow,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 25),
                      Image.asset(
                        'assets/images/svg_images/dcc$diceFace.png',
                        height: dialogSize * 0.31,
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.greenAccent,
                                onPrimary: Colors.green,
                              ),
                              onPressed: () {
                                Get.back();
                                // Trigger a new dice roll
                                diceController.rollDice(
                                    duration: Duration(seconds: 5));
                              },
                              child: Text('Play Again'),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent,
                                onPrimary: Colors.red,
                              ),
                              onPressed: () {
                                Get.to(Home_Page());
                              },
                              child: Text(
                                'Exit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
