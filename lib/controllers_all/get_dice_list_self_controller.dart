import 'package:get/get.dart';

import '../1_models/dice_list_model_bygameid.dart';
import '../2_servicea_apis/api_services.dart';

class GetDiceListSelfController extends GetxController {
  RxBool isLoading = true.obs;
  GetDiceListModel? _getDiceListnumberModel;

  GetDiceListModel? get diceList => _getDiceListnumberModel;

  Future<void> gameDiceSelfListApi({String? gameTypeId2}) async {
    try {
      isLoading(true);
      _getDiceListnumberModel =
          await ApiProvider.diceSelfListByIdApi(gameTypeId2);

      print("Game price list : ${_getDiceListnumberModel?.toJson()}");

      if (_getDiceListnumberModel?.diceNumvers != null &&
          _getDiceListnumberModel!.diceNumvers!.isNotEmpty) {
        //Get.to(() => NumberSelection());

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

  @override
  void onInit() {
    super.onInit();
    gameDiceSelfListApi();
  }

  @override
  void dispose() {
    Get.delete<GetDiceListSelfController>();
    super.dispose();
  }
}
