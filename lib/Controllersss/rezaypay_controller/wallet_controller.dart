import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../1_models/get_wallet_model.dart';
import '../../2_servicea_apis/api_services.dart';

class Wallet_2_Controller extends GetxController {
  final GlobalKey<FormState> walletformkey = GlobalKey<FormState>();
  // RxBool isLoading = false.obs;
  RxBool isLoading = false.obs;

  //WalletModel? getwalletlist;
  GetWallettModel? getWallettModel;

  /// wallet list api..............
  ///
  Future<void> getWalletApi() async {
    isLoading(true);
    getWallettModel = await ApiProvider.GetWalletApi();

    // Print the response to debug
    print("Profile Model Response: ${getWallettModel?.toJson()}");

    if (getWallettModel?.getWallet?.id != null) {
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  // void walletListssApi() async {
  //   isLoading(true);
  //   getwalletlist = await ApiProvider.walletAmountApi();
  //   if (getwalletlist != null) {
  //     isLoading(false);
  //   }
  // }

  ///.......................lower method is commented on 28 feb .................by rahul
  Future<int?> walletPostApi() async {
    isLoading(true);
    http.Response? r = await ApiProvider.WalletPostApi(walletAmount.text);
    if (r?.statusCode == 200) {
      ///TODO: we can navigate directly this page through this navigation with add to cart with Id.
      // Get.to(
      //       () => HomePagePractice(), //next page class
      //   duration: Duration(
      //       milliseconds: 300), //duration of transitions, default 1 sec
      //   transition:
      //
      //   Transition.zoom,
      // );
    }
    isLoading(false);
    //todo///////01/03
    return r?.statusCode;
  }

  ///.............................................
  ///
  ///
  ///.......................lower method is commented on 28 feb .................
  // Future<int> walletPostUpdateApi(double newWalletAmount) async {
  //   SharedPreferences p = await SharedPreferences.getInstance();
  //   //p.setString("rrrrrrrrrr4567", "${_checkoutController.checkoutModel?.result?.totalCost.toString()}");
  //   var v = p.getString("rrrrrrrrrr4567");
  //   print("object3&&&&&&&&&&&&&&&:${v}");
  //   isLoading(true);
  //   http.Response r = await ApiProvider.WalletPostUpdateApi(
  //     UserId.text,
  //     "$newWalletAmount",
  //   );
  //   if (r.statusCode == 200) {
  //     print("ewalletpostttupdat:${r.body}");
  //
  //     ///TODO: we can navigate directly this page through this navigation with add to cart with Id.
  //     // Get.to(
  //     //       () => HomePagePractice(), //next page class
  //     //   duration: Duration(
  //     //       milliseconds: 300), //duration of transitions, default 1 sec
  //     //   transition:
  //     //
  //     //   Transition.zoom,
  //     // );
  //   } else if (r.statusCode == 400) {
  //     Get.to(
  //           () => WolletUser(), //next page class
  //       duration: Duration(
  //           milliseconds: 300), //duration of transitions, default 1 sec
  //       transition: Transition.zoom,
  //     );
  //     Get.snackbar('message', r.body);
  //   }
  //   isLoading(false);
  //   //todo///////01/03
  //   return r.statusCode;
  // }

  ///............................................................................................
  TextEditingController walletAmount = TextEditingController();
  TextEditingController walletAmount2 = TextEditingController();

  late TextEditingController ammountController;
  late TextEditingController walletAmountController;
  //var walletAmount = '';

  var amount = '';

  //get stateCitymap => null;

  @override
  void onInit() {
    getWalletApi();
    // stateCitymap((key, value) {
    //   states.add(key);
    // }
    //);

    //editingController = TextEditingController();

    ammountController = TextEditingController();
    walletAmountController = TextEditingController();

    ///walletListssApi();

    super.onInit();
    //UserId;
    amount;
    walletAmount;
  }

  @override
  void dispose() {
    //Get.delete<Wallet_2_Controller>();
    super.dispose();
    //UserId.dispose();
    //amount.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //ammountController.dispose();
  }

  String? validAmount(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  // void checkAmount() {
  //   final isValid = walletformkey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   walletformkey.currentState!.save();
  //   //Get.to(() => HomePage());
  // }

  String? validateAmount(value) {
    if (value == '') {
      return "Select Amount";
    }
    return null;
  }

// void checkAmount() {
//   if (walletformkey.currentState!.validate()) {
//     walletPostApi();
//     walletPostUpdateApi();
//   }
//   walletformkey.currentState!.save();
// }
//
// void checkupdateAmount() {
//   if (walletformkey.currentState!.validate()) {
//     walletPostUpdateApi();
//   }
//   walletformkey.currentState!.save();
// }
}
