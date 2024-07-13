import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loadingone extends StatefulWidget {
  Loadingone({Key? key}) : super(key: key);

  @override
  _LoadingoneState createState() => _LoadingoneState();
}

class _LoadingoneState extends State<Loadingone>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Navigate to HomePage after 10 seconds (commented out for testing)
    // Future.delayed(Duration(seconds: 10), () {
    //   Get.to(Home_Page());
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double centerSize = screenWidth * 0.8;
    final double radius1 = centerSize * 0.6;
    final double radius2 = centerSize * 0.5;
    final double radius3 = centerSize * 0.4;
    final double radius4 = centerSize * 0.3;
    final double radius5 = centerSize * 0.2;
    final double radius6 = centerSize * 0.1;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red.shade300,
        title: Text(
          "Loading Game...",
          style: GoogleFonts.aBeeZee(fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                _buildCircularContainer(
                    centerSize, Colors.transparent, radius1),
                _buildCircularContainer(
                    centerSize, Colors.red.shade900, radius2),
                _buildCircularContainer(
                    centerSize, Colors.blue.shade700, radius3),
                _buildCircularContainer(
                    centerSize, Colors.green.shade500, radius4),
                _buildCircularContainer(
                    centerSize, Colors.orange.shade400, radius5),
                _buildCircularContainer(
                    centerSize, Colors.purple.shade100, radius6),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularContainer(
      double centerSize, Color color, double radius) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 4.0 * 3.14,
          child: Container(
            height: radius * 2,
            width: radius * 2,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.indigo),
              image: DecorationImage(
                image: AssetImage("assets/images/person1.png"),
              ),
            ),
            child: Text("Player"),
          ),
        );
      },
    );
  }
}
