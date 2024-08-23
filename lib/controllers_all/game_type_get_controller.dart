import 'package:game_app/2_servicea_apis/api_services.dart';
import 'package:get/get.dart';

import '../1_models/game_type_model.dart';

class GetGameTypeController extends GetxController {
  RxBool isLoading = true.obs;
  GameTypeModel? gametypeModel;

  Future<void> gameTypeGetApi() async {
    isLoading(true);
    gametypeModel = await ApiProvider.GameTypeApi();

    // Print the response to debug
    print("Game Type Model Response: ${gametypeModel?.toJson()}");

    if (gametypeModel?.getGames != null) {
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    gameTypeGetApi();
  }

  @override
  void dispose() {
    Get.delete<GetGameTypeController>();
    super.dispose();
  }
}
