import 'package:flutter/material.dart';
import 'package:game_app/2_servicea_apis/api_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../1_models/dice_list_model_bygameid.dart';

class GetDiceListController extends GetxController {
  RxBool isLoading = true.obs;
  GetDiceListModel? _getDiceListnumberModel;
  RxInt selectedIndex = (-1).obs; // Only one selection allowed

  Future<void> gameDiceListApi({String? gameTypeId2}) async {
    try {
      isLoading(true);
      _getDiceListnumberModel = await ApiProvider.diceListByIdApi(gameTypeId2);
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
      // Optional: Uncomment if you want to allow deselecting
      // selectedIndex.value = -1;
    } else {
      selectedIndex.value = index;
    }
  }

  // Method to get color based on selection status
  Color getContainerColor(int index) {
    return selectedIndex.value == index ? Colors.black54 : Colors.white;
  }

  // Method to save selected dice ID on Pay button click
  Future<void> saveSelectedDiceId() async {
    if (selectedIndex.value >= 0 &&
        selectedIndex.value <
            (_getDiceListnumberModel?.diceNumvers?.length ?? 0)) {
      num diceId =
          _getDiceListnumberModel?.diceNumvers![selectedIndex.value].id ?? -1;

      // Cast diceId to int
      int diceIdInt = diceId.toInt();

      // Save the dice ID in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('selected_dice_id', diceIdInt);

      // Save the dice ID in GetStorage
      GetStorage().write('selected_dice_id', diceIdInt);

      print("Dice ID saved: $diceIdInt");
    } else {
      Get.snackbar(
        "Selection Required",
        "Please select a dice before proceeding.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
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
