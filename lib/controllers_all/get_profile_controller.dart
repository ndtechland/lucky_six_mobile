import 'package:game_app/2_servicea_apis/api_services.dart';
import 'package:get/get.dart';

import '../1_models/profile_model.dart';

class UserProfilesController extends GetxController {
  RxBool isLoading = true.obs;
  ProfileModel? profileModel;

  Future<void> userprofileApi() async {
    isLoading(true);
    profileModel = await ApiProvider.PriofileApi();

    // Print the response to debug
    print("Profile Model Response: ${profileModel?.toJson()}");

    if (profileModel?.profile?.id != null) {
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    userprofileApi();
  }

  @override
  void dispose() {
    Get.delete<UserProfilesController>();
    super.dispose();
  }
}
