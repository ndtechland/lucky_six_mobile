import 'package:game_app/2_servicea_apis/api_services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../1_models/dice_popup_avlbalance_bidbalancemodel.dart';

class DiceAvlBalpopupController extends GetxController {
  // Observables for the loading state and the model
  RxBool isLoading = false.obs;
  Rx<DataBal?> data2 = Rx<DataBal?>(null);
  RxString errorMessage = ''.obs;

  // Method to fetch the data
  Future<void> fetchGameDiceBalance() async {
    isLoading(true); // Start loading
    try {
      DicepipupBidAvlPriceModel? result =
          await ApiProvider.diceAvlBalPopupApi();
      if (result != null && result.data2 != null) {
        data2.value = result.data2;
      } else {
        errorMessage.value = "Failed to fetch game dice balance";
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
    } finally {
      isLoading(false); // Stop loading
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchGameDiceBalance(); // Call the API when the controller initializes
  }
}
