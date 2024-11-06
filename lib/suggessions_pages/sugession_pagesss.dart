import 'package:flutter/material.dart';

class SuggestionOverlay extends StatefulWidget {
  final VoidCallback onFinish;

  const SuggestionOverlay({required this.onFinish});

  @override
  _SuggestionOverlayState createState() => _SuggestionOverlayState();
}

class _SuggestionOverlayState extends State<SuggestionOverlay>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..forward(); // Automatically start the animation

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      widget.onFinish();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return _buildSuggestionStep(index);
          },
        ),
      ),
    );
  }

  Widget _buildSuggestionStep(int index) {
    String stepTitle;
    String stepDescription;
    String buttonText;

    switch (index) {
      case 0:
        stepTitle = 'Step 1: Choose Game Type';
        stepDescription = 'Select the type of game you want to play.';
        buttonText = 'Next';
        break;
      case 1:
        stepTitle = 'Step 2: Select Game Price';
        stepDescription = 'Choose the price for the game.';
        buttonText = 'Next';
        break;
      case 2:
        stepTitle = 'Step 3: Select Dice Number';
        stepDescription = 'Pick the dice you want to use for the game.';
        buttonText = 'Next';
        break;
      case 3:
        stepTitle = 'Step 4: Play Now!';
        stepDescription = 'You are ready to play the game.';
        buttonText = 'Start';
        break;
      default:
        stepTitle = '';
        stepDescription = '';
        buttonText = '';
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            stepTitle,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            stepDescription,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              elevation: 8,
              shadowColor: Colors.orangeAccent,
            ),
            onPressed: _nextPage,
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (index < 3)
            TextButton(
              onPressed: () {
                widget.onFinish();
              },
              child: Text(
                'Skip Now',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
