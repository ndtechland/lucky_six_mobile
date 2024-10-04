import 'package:get/get.dart';

import '../1_models/win_loss_model.dart';
import '../2_servicea_apis/api_services.dart';

class GetWinLossListController extends GetxController {
  RxBool isLoading = true.obs;
  WinLossListModel? winlosslistModel;

  Future<void> gameWinlossListtApi() async {
    isLoading(true);
    winlosslistModel = await ApiProvider.GameWinLoassApi();

    print("Game price list : ${winlosslistModel?.toJson()}");

    if (winlosslistModel?.response != null) {
      //Get.to(() => DoubleDiceRollFaceSelection());
      //await Get.to(PriceListssfortwodice());

      //        await Get.to(PriceListss());
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    gameWinlossListtApi();
  }

  @override
  void dispose() {
    Get.delete<GetWinLossListController>();
    super.dispose();
  }
}
