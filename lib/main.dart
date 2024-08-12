import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_app/splash_pages/splash_screens.dart';
import 'package:get/get.dart';
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

// Override for handling self-signed certificates
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
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
      home:
          //Play_Now()
          //Dice3DAnimation(),
          //Play_Now_self_game(),

          ///PaymentHistory(),
          ///Play_Now_2dice(),
          // HomePageDicetest(),
          /// Play_Now_test(),

          ///Play_Now_2dice(),

          ///Play_Now_2dice(),
          ///Play_Now()
          SplashScreen(),

      ///PlayerLists(),
      //DiceRollingMusic(),

      ///Splash_screen(), // Initial screen when the app starts
    );
  }
}

///
///
