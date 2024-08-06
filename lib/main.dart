import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'game_type/single_dice_game/playnow.dart';

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
        home: Play_Now()
        //Dice3DAnimation(),
        ///Play_Now_self_game(),

        ///PaymentHistory(),
        ///Play_Now_2dice(),
        // HomePageDicetest(),
        /// Play_Now_test(),

        ///Play_Now_2dice(),

        ///Play_Now_2dice(),
        ///Play_Now()
        /// SplashScreen(),

        ///PlayerLists(),
        //DiceRollingMusic(),

        ///Splash_screen(), // Initial screen when the app starts
        );
  }
}

///
///
