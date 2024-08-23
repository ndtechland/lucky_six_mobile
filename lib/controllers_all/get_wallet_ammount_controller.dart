// import 'package:game_app/2_servicea_apis/api_services.dart';
// import 'package:get/get.dart';
//
// import '../1_models/get_wallet_model.dart';
//
// class GetWelletController extends GetxController {
//   RxBool isLoading = true.obs;
//   GetWallettModel? getWallettModel;
//
//   Future<void> userwalletgetApi() async {
//     isLoading(true);
//     getWallettModel = await ApiProvider.GetWalletApi();
//
//     // Print the response to debug
//     print("Profile Model Response: ${getWallettModel?.toJson()}");
//
//     if (getWallettModel?.getWallet?.id != null) {
//       isLoading(false);
//     } else {
//       isLoading(false);
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     userwalletgetApi();
//   }
//
//   @override
//   void dispose() {
//     Get.delete<GetWelletController>();
//     super.dispose();
//   }
// }
