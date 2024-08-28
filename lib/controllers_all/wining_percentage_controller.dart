import 'package:game_app/2_servicea_apis/api_services.dart';
import 'package:get/get.dart';

import '../1_models/wining_amount_model_percentage.dart';

class WiningAmtPercentageController extends GetxController {
  RxBool isLoading = true.obs;
  GeWiningPercentModel? winingPercentModel;

  Future<void> winningamtpercentageApi() async {
    isLoading(true);
    winingPercentModel = await ApiProvider.WiningPricePercentageApi();

    // Print the response to debug
    print(
        "Wining amt percentage Model Response: ${winingPercentModel?.toJson()}");

    if (winingPercentModel?.data?.id != null) {
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    winningamtpercentageApi();
  }

  @override
  void dispose() {
    Get.delete<WiningAmtPercentageController>();
    super.dispose();
  }
}
