import 'package:get/get.dart';

import '../1_models/list_user_single_game.dart';
import '../2_servicea_apis/api_services.dart';

class GetUserListSingleeeeController extends GetxController {
  RxBool isLoading = true.obs;
  UserListModelSingle? getuserlistModelsingle;

  Future<void> gameUserSingleListApi() async {
    isLoading(true);
    getuserlistModelsingle = await ApiProvider.UserRoomSingleListApi();

    print("Game user list : ${getuserlistModelsingle?.toJson()}");

    if (getuserlistModelsingle?.userId != null) {
      //DiceRollFaceSelection
      //Get.to(() => DiceRollFaceSelection());
      //        await Get.to(PriceListss());
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    gameUserSingleListApi();
  }

  @override
  void dispose() {
    Get.delete<GetUserListSingleeeeController>();
    super.dispose();
  }
}
