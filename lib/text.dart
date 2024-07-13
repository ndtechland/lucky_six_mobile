import 'dart:async';

import 'package:flutter/material.dart';

class SliderBanner extends StatefulWidget {
  const SliderBanner({super.key});

  @override
  State<SliderBanner> createState() => _SliderBannerState();
}

class _SliderBannerState extends State<SliderBanner> {
  List<String> bannerImages = [
    'assets/ban1.png',
    'assets/ban2.png',
  ];

  late PageController _pageController;
  int activePage = 0;
  late Timer _timer;

  @override
  void initState() {
    print("ban: $bannerImages");
    super.initState();
    _pageController =
        PageController(viewportFraction: 0.9, initialPage: 0, keepPage: true);

    // Initialize the timer to auto-scroll every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (activePage < bannerImages.length - 1) {
        activePage++;
      } else {
        activePage = 0;
      }
      _pageController.animateToPage(
        activePage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  List<Widget> indicators(int imagesLength, int currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: w / 1.1,
          height: h / 5,
          child: PageView.builder(
            allowImplicitScrolling: true,
            itemCount: bannerImages.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              bool active = pagePosition == activePage;
              return slider(bannerImages, pagePosition, active);
            },
          ),
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(bannerImages.length, activePage),
        ),
      ],
    );
  }
}

AnimatedContainer slider(List<String> images, int pagePosition, bool active) {
  double margin = active ? 10 : 20;
  return AnimatedContainer(
    child: Image.asset(
      images[pagePosition],
      fit: BoxFit.cover,
    ),
    duration: Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
    ),
  );
}
