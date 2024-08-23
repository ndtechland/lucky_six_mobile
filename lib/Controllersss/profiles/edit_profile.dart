import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../2_servicea_apis/api_services.dart';
import '../../controllers_all/get_profile_controller.dart';

class UserProfileUodateController extends GetxController {
  final isLoading = false.obs;
  var selectedGender = ''.obs;

  static String userId = ''; // Consider if this should remain static
  final GlobalKey<FormState> userprifileFormKey = GlobalKey<FormState>();
  final UserProfilesController _getprofilee = Get.put(UserProfilesController());

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> updateUserProfile({
    String? fullName,
    String? emailID,
    String? mobileNumber,
    String? dateOfBirth,
    String? pincode,
    String? address,
    required String profileImagePath,
    required Uint8List profileImage,
  }) async {
    try {
      isLoading(true);

      // Retrieve user ID from the profile controller
      String userId = _getprofilee.profileModel?.profile?.id ?? '';

      final Map<String, String> formData = {
        'userId': userId,
        'FullName': fullName ?? "",
        'EmailID': emailID ?? "",
        'MobileNumber': mobileNumber ?? "",
        'DateOfBirth': dateOfBirth ?? "",
        'Pincode': pincode ?? "",
        'Address': address ?? "",
        'ProfileImagePath':
            profileImagePath, // Added ProfileImagePath to formData
      };

      print('Form Data: $formData');

      final response = await ApiProvider.updateuserProfileApi(
        formData,
        profileImage,
        profileImagePath,
      );

      print('Response: ${response.body}');
      print('Form Data: $formData');

      if (response.statusCode == 200) {
        print('Profile updated successfully!');
        Fluttertoast.showToast(
          msg: 'Profile updated successfully!',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1, // Show toast for 1 second
        );

        // Show loading dialog before navigating
        Get.dialog(
          Center(
            child: CircularProgressIndicator(),
          ),
          barrierDismissible: false,
        );

        // Navigate to Home screen after a short delay (simulating asynchronous operation)
        Future.delayed(Duration(seconds: 1), () {
          Get.back(); // Close the loading dialog
          // Uncomment the following line to navigate to the Home screen
          // Get.off(Home());
        });
      } else {
        print('Error updating profile: ${response.statusCode}');
        Fluttertoast.showToast(
          msg: 'Failed to update profile. Status code: ${response.statusCode}',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (error) {
      print('Network error: $error');
      Fluttertoast.showToast(
        msg: 'Network error. Please try again.',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }
}
