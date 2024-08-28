// change_password_controller.dart

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:game_app/2_servicea_apis/api_services.dart';
import 'package:get/get.dart';

import '../HomePage/homePage.dart';

class ChangePasswordController extends GetxController {
  final GlobalKey<FormState> changepasswordFormKey = GlobalKey<FormState>();

  var isLoading = false.obs;
  var success = false.obs;
  var Id = '';
  var passwordError = "".obs;
  var newpasswordError = "".obs;
  var newconfirmpasswordError = "".obs;

  final ApiProvider apiProvider = ApiProvider();

  Future<void> cngPasswordApi({
    required String currentPassword,
    required String currentNewPassword,
    required String currentNewConfirmPassword,
  }) async {
    isLoading(true);

    try {
      bool result = await apiProvider.changePasswordApi(
        currentPassword: currentPassword,
        currentNewPassword: currentNewPassword,
        currentNewConfirmPassword: currentNewConfirmPassword,
      );

      if (result) {
        success(true);
        // Fluttertoast.showToast(
        //   msg: "Password changed successfully",
        //   backgroundColor: Colors.green,
        //   textColor: Colors.white,
        //   toastLength: Toast.LENGTH_LONG,
        //   gravity: ToastGravity.CENTER,
        // );
        Get.offAll(() => Home_Page());
      } else {
        success(false);
        // Fluttertoast.showToast(
        //   msg: "Failed to change password",
        //   backgroundColor: Colors.red,
        //   textColor: Colors.white,
        //   toastLength: Toast.LENGTH_LONG,
        //   gravity: ToastGravity.CENTER,
        // );
      }
    } catch (e) {
      success(false);
      Fluttertoast.showToast(
        msg: "Error: ${e.toString()}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    } finally {
      isLoading(false);
    }
  }
}
