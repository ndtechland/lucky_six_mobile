// // lib/controllers/profile_controller.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../2_servicea_apis/api_services.dart';

class ProfileUpdateController extends GetxController {
  final ApiProvider apiService;

  ProfileUpdateController({required this.apiService});
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  Future<void> updateProfile({
    String? id,
    String? fullName,
    String? phoneNumber,
    String? email,
    String? address,
    String? pinCode,
    String? dob,
    String? profileImagePath,
    required File profileImage,
  }) async {
    try {
      var response = await apiService.updateProfile(
        id: id,
        fullName: fullName,
        phoneNumber: phoneNumber,
        email: email,
        address: address,
        pinCode: pinCode,
        dob: dob,
        profileImagePath: profileImagePath,
        profileImage: profileImage,
      );

      if (response?.statusCode == 200) {
        print('Profile updated successfully: $response');
      } else {
        print('Failed to update profile: ${response?.statusCode}');
        print('Response body: ${response?.body}');
        throw Exception('Failed to update profile: ${response?.statusCode}');
      }
    } catch (e) {
      print('Error updating profile: $e');
    }
  }
}
