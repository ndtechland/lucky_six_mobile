import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

import '../2_servicea_apis/api_services.dart';

class ForgotController extends GetxController {
  final GlobalKey<FormState> forgetpasswordkey =
      GlobalKey<FormState>(debugLabel: "_forgetkey");

  var Id = '';

  RxBool isLoading = true.obs;

  void forgetApi() async {
    http.Response r = await ApiProvider.ForgetPasswordApi(emailController.text);

    if (r.statusCode == 200) {
      // print("Password" ${r.body});
      //print("Account $")
    }
  }

  ///todo:raje

  late TextEditingController emailController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    Get.delete<ForgotController>();
    super.dispose();
  }

  @override
  void onClose() {
    emailController.dispose();
  }

  String? validEmail(String value) {
    if (value.isEmpty) {
      return "This field is required";
    }
    return null;
  }
}
