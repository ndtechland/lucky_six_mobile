import 'package:get/get.dart';

import '../1_models/dice_selection_red_white_model.dart';
import '../2_servicea_apis/api_services.dart';

class GetDiceColorController extends GetxController {
  RxBool isLoading = true.obs;
  DiceSelection? _getDiceColorSelectModel;

  DiceSelection? get diceList => _getDiceColorSelectModel;

  Future<void> gameDiceColorListApi() async {
    try {
      isLoading(true);
      _getDiceColorSelectModel =
          await ApiProvider.diceColorListApi();

      print("Game dice color list : ${_getDiceColorSelectModel?.toJson()}");

      if (_getDiceColorSelectModel?.data?[0].id != null &&
          _getDiceColorSelectModel!.data!.isNotEmpty) {
        //Get.to(() => NumberSelection());

        print("Dice color ID: ${_getDiceColorSelectModel?.data?[0].id}");
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

  @override
  void onInit() {
    super.onInit();
    gameDiceColorListApi();
  }

  @override
  void dispose() {
    Get.delete<GetDiceColorController>();
    super.dispose();
  }
}
