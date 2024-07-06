import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import the package
import 'package:get/get.dart';

class TwodiceController extends GetxController {
  var isLoading = false.obs;
  var selectedIndices = <int>[].obs; // RxList to store selected indices

  // Method to toggle selection of an index
  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      if (selectedIndices.length < 6) {
        selectedIndices.add(index);
      } else {
        Fluttertoast.showToast(
            msg: 'You can select a maximum of 6 items.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  // Method to get color based on selection status
  Color getContainerColor(int index) {
    return selectedIndices.contains(index) ? Colors.black54 : Colors.white;
  }
}
