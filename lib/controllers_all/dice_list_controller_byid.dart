import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../1_models/dice_list_model_bygameid.dart';
import '../2_servicea_apis/api_services.dart';

class GetDiceListController extends GetxController {
  RxBool isLoading = true.obs;
  GetDiceListModel? _getDiceListnumberModel;
  RxInt selectedIndex = (-1).obs; // Only one selection allowed

  Future<void> gameDiceListApi({String? gameTypeId2}) async {
    try {
      isLoading(true);
      _getDiceListnumberModel = await ApiProvider.diceListByIdApi(gameTypeId2);

      print("Game price list : ${_getDiceListnumberModel?.toJson()}");

      if (_getDiceListnumberModel?.diceNumvers != null &&
          _getDiceListnumberModel!.diceNumvers!.isNotEmpty) {
        print("Dice number ID: ${_getDiceListnumberModel!.diceNumvers![0].id}");
      }
    } catch (e) {
      print("Error fetching dice list: $e");
      Get.snackbar(
        "Error",
        "Failed to fetch dice list. Please try again later.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  // Method to toggle selection of an index
  void toggleSelection(int index) {
    if (selectedIndex.value == index) {
      // Optionally handle the case where the user clicks the already selected item
      // For example, you might want to deselect the item if it is clicked again
      // selectedIndex.value = -1; // Uncomment this line if you want to allow deselecting
    } else {
      selectedIndex.value = index;
    }
  }

  // Method to get color based on selection status
  Color getContainerColor(int index) {
    return selectedIndex.value == index ? Colors.black54 : Colors.white;
  }

  num? getSelectedDiceNumber() {
    if (selectedIndex.value >= 0 &&
        selectedIndex.value <
            (_getDiceListnumberModel?.diceNumvers?.length ?? 0)) {
      return _getDiceListnumberModel!.diceNumvers![selectedIndex.value].id;
    }
    return -1; // Return -1 if no valid dice is selected
  }

  @override
  void onInit() {
    super.onInit();
    gameDiceListApi();
  }

  @override
  void dispose() {
    Get.delete<GetDiceListController>();
    super.dispose();
  }
}
