import 'package:flutter/material.dart';

import '../registrationscreen.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    teenpatti();
  }

  void teenpatti() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            registration(), // Assume Registration() is defined
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              // Getting the size of the screen
              var screenWidth = constraints.maxWidth;
              var screenHeight = constraints.maxHeight;

              // Calculating sizes based on orientation
              var imageWidth = orientation == Orientation.portrait
                  ? screenWidth * 0.4
                  : screenWidth * 0.3;
              var imageHeight = orientation == Orientation.portrait
                  ? screenHeight * 0.2
                  : screenHeight * 0.4;

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: screenHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      width: screenWidth,
                      color: const Color(0xff600103),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Spacer(),
                          Container(
                            width: imageWidth,
                            height: imageHeight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/rlg.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          const SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
//
// class Registration extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Registration')),
//       body: Center(child: Text('Registration Screen')),
//     );
//   }
// }
