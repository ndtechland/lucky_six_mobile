import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

import '../2_servicea_apis/api_services.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginpasswordformkey =
      GlobalKey<FormState>(debugLabel: '_loginKey1111');

  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';

  var Id = '';
  RxBool isLoading = true.obs;
  var isChecked = false.obs;
  void toggleCheckbox(bool? value) {
    if (value != null) {
      isChecked.value = value;

      @override
      void onInit() {
        super.onInit();
        emailController = TextEditingController();
        passwordController = TextEditingController();
      }

      @override
      void dispose() {
        // Get.delete<LoginPasswordController>();
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

      Future<void> loginApi() async {
        http.Response r = await ApiProvider.LoginApi(
          emailController.text,
          passwordController.text,
        );
        if (r.statusCode == 200) {
          print("account${r.body}");
        }
      }
    }
  }
}
