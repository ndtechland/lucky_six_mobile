import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'HomePage/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DiceKing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // You can customize more theme settings here if needed
      ),
      home: Splash_screen(), // Initial screen when the app starts
    );
  }
}
