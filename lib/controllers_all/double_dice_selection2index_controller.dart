import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DoublediceSelection22Controller extends GetxController {
  var isLoading = false.obs;
  var selectedIndices2 = <int>[].obs; // RxList to store selected indices

  // Method to toggle selection of an index
  void toggleSelection(int index) {
    if (selectedIndices2.contains(index)) {
      selectedIndices2.remove(index);
    } else {
      if (selectedIndices2.length < 2) {
        selectedIndices2.add(index);
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
    return selectedIndices2.contains(index) ? Colors.black54 : Colors.white;
  }
}
