import 'package:get/get.dart';

import '../1_models/price_list_model.dart';
import '../2_servicea_apis/api_services.dart';
import '../game_speed_list/self_game/self_dice_face_selection.dart';

class GetGamePriceListSelfController extends GetxController {
  RxBool isLoading = true.obs;
  GamePriceListModel? getpricelistModel;

  Future<void> gamePriceListSelfApi({String? gameTypeId}) async {
    isLoading(true);
    getpricelistModel = await ApiProvider.GamePriceListSelfApi(gameTypeId);

    print("Game price list : ${getpricelistModel?.toJson()}");

    if (getpricelistModel?.getGameAmount != null) {
      // Get.to(() => PriceListssfortwodice());
      //await Get.to(PriceListssfortwodice());
      // await Get.to(Play_Now_self_game());
      ///Get.to(() => Play_Now_self_game());
      ///SelfDiceRollFaceSelection
      Get.to(() => SelfDiceRollFaceSelection());

      //        await Get.to(PriceListss());
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    gamePriceListSelfApi();
  }

  @override
  void dispose() {
    Get.delete<GetGamePriceListSelfController>();
    super.dispose();
  }
}
