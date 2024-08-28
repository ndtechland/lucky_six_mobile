import 'package:flutter/cupertino.dart';
import 'package:game_app/1_models/login_model/account_service.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

import '../1_models/login_model/login_modell.dart';
import '../2_servicea_apis/api_services.dart';
import '../HomePage/homePage.dart';
import '../constantt/circular_loader/circular_loaderr.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginpasswordformkey =
      GlobalKey<FormState>(debugLabel: '_loginKey');

  final key1 = GlobalKey<FormState>();
  final key2 = GlobalKey<FormState>();

  ///new experiment....
  //User_1_Controller _user_1_controller = Get.put(User_1_Controller());

  var Id = '';
  var emailError = "".obs;
  var passwordError = "".obs;

  RxBool isLoading = true.obs;
  // bool termsAccepted = true;

  // var isAccepted = false.obs;
  var isChecked = false.obs;

  void toggleCheckbox(bool? value) {
    if (value != null) {
      isChecked.value = value;
    }
  }

  void emailApi() async {
    //isLoading(true);
    //CallLoader.loader();
    http.Response r = await ApiProvider.UserLoginApi(
      emailController.text,
      passwordController.text,
    );

    if (r.statusCode == 200) {
      // CallLoader.loader();
      print("ACCOUNT ${r.body}");
      final accountData = messageFromJson(r.body);
      print("ACCOUNT ${accountData.toJson()}");
      await accountService.setAccountData(accountData);

      // Assuming the user has successfully logged in
      // final ShowcaseController showcaseController =
      //     Get.put(ShowcaseController());
      /// showcaseController.markUserLoggedIn();

      // Navigate to the home page

      Get.to(() => Home_Page());

      CallLoader.hideLoader();

      //isLoading(false);
    } else {
      //CallLoader.loader();
      await Future.delayed(Duration(seconds: 1));
      Get.snackbar("Failed", "${r.body}");
      // CallLoader.hideLoader();
      isLoading(false);
    }
  }

  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validEmail(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    // if (!GetUtils.isEmail(value)) {
    //   return "              Email is not valid";
    // }
    return null;
  }

  String? validPassword(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 5) {
      return '              Password should have atleast 5 characters';
    }
    // if (!RegExp(r'[A-Z0-9a-z]*').hasMatch(value)) {
    //   return '              Enter a stronger password';
    // }
    //return null;
  }

  void checkLoginpassword() {
    if (loginpasswordformkey.currentState!.validate()) {
      emailApi();
    }
    loginpasswordformkey.currentState!.save();
  }
}

//}
//     final isValid = loginpasswordformkey.currentState!.validate();
//
//     if (!isValid) {
//       emailApi();
//
//       return;
//     }
//     loginpasswordformkey.currentState!.save();
//     //Get.to(SignUpList());
//   }
// }
