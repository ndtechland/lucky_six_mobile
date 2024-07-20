import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_app/splash_pages/splash_screens.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LuckySix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // You can customize more theme settings here if needed
      ),
      home: SplashScreen(),
      //DiceRollingMusic(),

      ///Splash_screen(), // Initial screen when the app starts
    );
  }
}
