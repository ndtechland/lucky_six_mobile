import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../2_servicea_apis/api_services.dart';
import '../constantt/circular_loader/circular_loaderr.dart';
import '../login_email.dart';

class RegistrationController extends GetxController {
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();

  late TextEditingController nameController,
      emailController,
      phoneController,
      passwordController,
      confirmPasswordController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  String? validateName(String value) {
    if (value.length < 2) {
      return "Provide a valid name";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    if (value.length != 10) {
      return 'A valid phone number should be 10 digits';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    if (!value.contains('@')) {
      return "A valid email should contain '@'";
    }
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter a password";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters long";
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Must contain at least one uppercase letter";
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "Must contain at least one lowercase letter";
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "Must contain at least one special character";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return "Please confirm your password";
    }
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  /// User registration API call
  Future<void> registrationApi() async {
    CallLoader.loader();
    http.Response response = await ApiProvider.UserSignUpApi(
      nameController.text,
      phoneController.text,
      emailController.text,
      passwordController.text,
      confirmPasswordController.text,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Get.snackbar('Message', "${response.body}",
          duration: Duration(seconds: 1));

      await Future.delayed(Duration(milliseconds: 500));
      Get.to(() => LoginEmail());
    } else {
      Get.snackbar("Message", "${response.body}",
          duration: Duration(seconds: 1));
    }
  }

  void checkRegistration() {
    if (registrationFormKey.currentState!.validate()) {
      registrationApi();
    }
    registrationFormKey.currentState!.save();
  }
}
