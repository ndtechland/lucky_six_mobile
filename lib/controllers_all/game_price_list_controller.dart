import 'package:get/get.dart';

import '../1_models/price_list_model.dart';
import '../2_servicea_apis/api_services.dart';
import '../price_listts/price_listtss.dart';

class GetGamePriceListController extends GetxController {
  RxBool isLoading = true.obs;
  GamePriceListModel? getpricelistModel;

  Future<void> gamePriceListApi({String? gameTypeId}) async {
    isLoading(true);
    getpricelistModel = await ApiProvider.GamePriceListApi(gameTypeId);

    print("Game price list : ${getpricelistModel?.toJson()}");

    if (getpricelistModel?.getGameAmount != null) {
      Get.to(() => PriceListss());
      //        await Get.to(PriceListss());
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    gamePriceListApi();
  }

  @override
  void dispose() {
    Get.delete<GetGamePriceListController>();
    super.dispose();
  }
}