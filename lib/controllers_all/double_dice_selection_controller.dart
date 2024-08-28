import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DoublediceSelectionController extends GetxController {
  var isLoading = false.obs;
  var selectedIndices = <int>[].obs; // RxList to store selected indices

  // Method to toggle selection of an index
  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      if (selectedIndices.length < 2) {
        selectedIndices.add(index);
      } else {
        // Show a stylish toast message
        Fluttertoast.showToast(
          msg: "You can only select up to 2 dice.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  // Method to get color based on selection status
  Color getContainerColor(int index) {
    return selectedIndices.contains(index) ? Colors.black54 : Colors.white;
  }
}
