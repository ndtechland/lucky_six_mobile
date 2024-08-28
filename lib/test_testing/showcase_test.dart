import 'package:flutter/material.dart';
import 'package:game_app/test_testing/showcase_test_controller.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowcaseViewExample extends StatelessWidget {
  final ShowcaseController _showcaseController = Get.put(ShowcaseController());

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          // Start the showcase after the widget is built
          _showcaseController.startShowcase(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('ShowcaseView Example'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Showcase(
                    key: _showcaseController.key1,
                    description: 'This is the first button',
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Button 1'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Showcase(
                    key: _showcaseController.key2,
                    description: 'This is the second button',
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Button 2'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Showcase(
                    key: _showcaseController.key3,
                    description: 'This is the third button',
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Button 3'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
