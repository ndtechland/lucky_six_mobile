import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceListController extends GetxController {
  var isLoading = false.obs;
  var selectedIndex = (-1).obs; // RxInt to store the selected index

  // Method to toggle selection of an index
  void toggleSelection(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1; // Deselect if the same item is selected again
    } else {
      selectedIndex.value = index; // Select the new item
    }
  }

  // Method to get color based on selection status
  Color getContainerColor(int index) {
    return selectedIndex.value == index ? Colors.black54 : Colors.white;
  }
}
