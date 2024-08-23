import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../2_servicea_apis/api_services.dart';
import '../HomePage/homePage.dart';

class BankUpdateController extends GetxController {
  final GlobalKey<FormState> updatebankFormKey = GlobalKey<FormState>();

  var isLoading = false.obs;
  var success = false.obs;
  // Instantiate the API provider
  final ApiProvider apiProvider = ApiProvider();

  Future<void> updateBankDetails({
    //required String userId,
    String? accountNo,
    String? accountHolderName,
    String? phone,
    String? email,
    String? bankName,
    String? ifsc,
    String? address,
    String? upiId,
  }) async {
    isLoading(true);

    try {
      bool result = await apiProvider.updateBankDetail(
        // userId: userId, // Required field
        accountNo: accountNo,
        accountHolderName: accountHolderName,
        phone: phone,
        email: email,
        bankName: bankName,
        ifsc: ifsc,
        address: address,
        upiId: upiId,
      );

      if (result) {
        success(true);
        Fluttertoast.showToast(
          msg: "Bank Updated successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
        Get.offAll(Home_Page());
        // Optionally, show a success message or navigate to another page
      } else {
        success(false);
        // Optionally, show an error message
      }
    } finally {
      isLoading(false);
    }
  }
}
