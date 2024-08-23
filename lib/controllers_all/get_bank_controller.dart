import 'package:game_app/2_servicea_apis/api_services.dart';
import 'package:get/get.dart';

import '../1_models/get_bank_model.dart';

class GetBankDEtailsController extends GetxController {
  RxBool isLoading = true.obs;
  GetBankModel? getbankModel;

  Future<void> BankDetailsGetApi() async {
    isLoading(true);
    getbankModel = await ApiProvider.GetBankDetailsApi();

    // Print the response to debug
    print("Game Type Model Response: ${getbankModel?.toJson()}");

    if (getbankModel?.bankDetail != null) {
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    BankDetailsGetApi();
  }

  @override
  void dispose() {
    Get.delete<GetBankDEtailsController>();
    super.dispose();
  }
}
