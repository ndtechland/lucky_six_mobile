import 'package:get/get.dart';

import '../1_models/get_user_list_model.dart';
import '../2_servicea_apis/api_services.dart';

class GetUserListController extends GetxController {
  RxBool isLoading = true.obs;
  UserListModel? getuserlistModel;

  Future<void> gameUserListApi() async {
    isLoading(true);
    getuserlistModel = await ApiProvider.diceRoomListApi();

    print("Game user list : ${getuserlistModel?.toJson()}");

    if (getuserlistModel?.data != null) {
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
    gameUserListApi();
  }

  @override
  void dispose() {
    Get.delete<GetUserListController>();
    super.dispose();
  }
}
