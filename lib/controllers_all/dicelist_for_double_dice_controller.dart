import 'package:get/get.dart';

import '../1_models/dice_list_model_bygameid.dart';
import '../2_servicea_apis/api_services.dart';

class GetTwoDiceList1Controller extends GetxController {
  RxBool isLoading = true.obs;
  GetDiceListModel? _getDiceListnumberModel;

  GetDiceListModel? get diceList => _getDiceListnumberModel;

  Future<void> gameDiceList2Api({String? gameTypeId3}) async {
    try {
      isLoading(true);
      _getDiceListnumberModel =
          await ApiProvider.diceDoubleListByIdApi(gameTypeId3);

      print("Game price list 2 : ${_getDiceListnumberModel?.toJson()}");

      if (_getDiceListnumberModel?.diceNumvers != null &&
          _getDiceListnumberModel!.diceNumvers!.isNotEmpty) {
        // Navigate to the next screen or handle dice number selection
        print("Dice number ID: ${_getDiceListnumberModel!.diceNumvers![0].id}");
      }
    } catch (e, stackTrace) {
      print("Error fetching dice list: $e");
      print("Stacktrace: $stackTrace");
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
    gameDiceList2Api(); // Consider passing gameTypeId3 as a parameter when needed
  }

  @override
  void onClose() {
    // No need to manually delete the controller; GetX will handle this.
    super.onClose();
  }
}
