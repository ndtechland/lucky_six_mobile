import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeeeController extends GetxController {
  var isLoading = false.obs;
  var selectedIndices = <int>[].obs; // RxList to store selected indices

  // Method to toggle selection of an index
  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      selectedIndices.add(index);
    }
  }

  // Method to get color based on selection status
  Color getContainerColor(int index) {
    return selectedIndices.contains(index) ? Colors.black54 : Colors.white;
  }
}
