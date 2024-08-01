import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_email.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Print screen size for debugging
    print('Screen Width: $screenWidth');
    print('Screen Height: $screenHeight');

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              final isPortrait = orientation == Orientation.portrait;
              final imageWidth =
                  isPortrait ? screenWidth * 0.24 : screenWidth * 0.15;
              final imageHeight =
                  isPortrait ? screenHeight * 0.11 : screenHeight * 0.25;
              final imageWidth2 =
                  isPortrait ? screenWidth * 0.24 : screenWidth * 0.4;
              final imageHeight2 =
                  isPortrait ? screenHeight * 0.23 : screenHeight * 0.01;
              final textsize = isPortrait ? screenHeight * 0.55 : screenHeight;

              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/svg_images/ludobackblack.png', // Your background image asset
                    fit: BoxFit.cover,
                  ),
                  // Positioned(
                  //   bottom: imageHeight2 * 1.2,
                  //   right: imageWidth2,
                  //   child: Stack(
                  //     children: [
                  //       // Layer for shadow 1
                  //       Text(
                  //         "LOADING....",
                  //         style: GoogleFonts.poppins(
                  //           fontSize: textsize * 0.07,
                  //           color: Colors.black.withOpacity(0.3),
                  //           fontWeight: FontWeight.w500,
                  //           shadows: [
                  //             Shadow(
                  //               offset: Offset(1.5, 1.5),
                  //               blurRadius: 1,
                  //               color: Colors.black.withOpacity(0.5),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       // Layer for shadow 2
                  //       Text(
                  //         "LOADING....",
                  //         style: GoogleFonts.poppins(
                  //           fontSize: textsize * 0.07,
                  //           color: Colors.black.withOpacity(0.3),
                  //           fontWeight: FontWeight.w500,
                  //           shadows: [
                  //             Shadow(
                  //               offset: Offset(3, 3),
                  //               blurRadius: 3,
                  //               color: Colors.black.withOpacity(0.5),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       // Main text layer
                  //       Text(
                  //         "LOADING....",
                  //         style: GoogleFonts.abyssinicaSil(
                  //             fontSize: textsize * 0.07,
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w500,
                  //             backgroundColor: Colors.black54),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  GetBuilder<SplashScreenControllers>(
                    init: SplashScreenControllers(),
                    builder: (controller) {
                      if (controller.animation.status ==
                          AnimationStatus.completed) {
                        //Start the timer
                        Timer(Duration(seconds: 2), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginEmail()),
                          );
                        });
                      }

                      return Center(
                        child: AnimatedBuilder(
                          animation: controller.animation,
                          builder: (context, child) {
                            return Transform.scale(
                              //scaleX: 2,
                              //scaleY: 2,
                              scale: controller.animation.value * 2.1,
                              child: Container(
                                width: imageWidth,
                                height: imageHeight,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/svg_images/play_store_512.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
