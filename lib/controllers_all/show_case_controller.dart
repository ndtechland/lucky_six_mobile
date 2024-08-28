// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:showcaseview/showcaseview.dart';
//
// class ShowcaseController extends GetxController {
//   final GlobalKey key1 = GlobalKey();
//   final GlobalKey key2 = GlobalKey();
//   final GlobalKey key3 = GlobalKey();
//
//   void startShowcase(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isFirstLogin = prefs.getBool('isFirstLogin') ?? true;
//
//     if (isFirstLogin) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         ShowCaseWidget.of(context).startShowCase([key1, key2, key3]);
//       });
//
//       // Set the flag to false after showing the showcase
//       await prefs.setBool('isFirstLogin', false);
//     }
//   }
// }
