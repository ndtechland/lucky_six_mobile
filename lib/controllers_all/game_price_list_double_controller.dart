import 'package:get/get.dart';

import '../1_models/price_list_model.dart';
import '../2_servicea_apis/api_services.dart';
import '../price_listts/price_listfor_twodice.dart';

class GetGamePriceListDoubleController extends GetxController {
  RxBool isLoading = true.obs;
  GamePriceListModel? getpricelistModel;

  Future<void> gamePriceListDoubleApi({String? gameTypeId}) async {
    isLoading(true);
    getpricelistModel = await ApiProvider.GamePriceListDoubleApi(gameTypeId);

    print("Game price list : ${getpricelistModel?.toJson()}");

    if (getpricelistModel?.getGameAmount != null) {
      Get.to(() => PriceListssfortwodice());
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
    gamePriceListDoubleApi();
  }

  @override
  void dispose() {
    Get.delete<GetGamePriceListDoubleController>();
    super.dispose();
  }
}
