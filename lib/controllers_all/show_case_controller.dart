import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowcaseController extends GetxController {
  var showShowcase = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkIfShowcaseNeeded();
  }

  Future<void> _checkIfShowcaseNeeded() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? hasLoggedIn = prefs.getBool('hasLoggedIn');
    bool? hasShownShowcase = prefs.getBool('hasShownShowcase');

    if (hasLoggedIn != null &&
        hasLoggedIn &&
        (hasShownShowcase == null || !hasShownShowcase)) {
      showShowcase.value = true;
      prefs.setBool('hasShownShowcase', true);
    }
  }

  Future<void> markUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasLoggedIn', true);
  }
}
