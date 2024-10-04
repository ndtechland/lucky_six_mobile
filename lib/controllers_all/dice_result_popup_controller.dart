import 'package:get/get.dart';

import '../1_models/dice_result_popup_model.dart';
import '../2_servicea_apis/api_services.dart';

class DiceResultController extends GetxController {
  Rx isLoading = true.obs;
  DiceResultModel? diceResultModel;
  Future<void> DiceResultPopupApiii() async {
    isLoading(true);
    diceResultModel = await ApiProvider.DiceResultApi();
    print("table details: ${diceResultModel?.toJson()}");
    if (diceResultModel?.data?.die1 != null) {
      isLoading(false);
    } else {
      isLoading(false);
    }
  }
}
