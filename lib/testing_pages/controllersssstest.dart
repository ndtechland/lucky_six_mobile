// document_controller.dart

import 'package:game_app/testing_pages/servives_test_apii.dart';
import 'package:get/get.dart';

import 'model_test.dart';

class DocumentController extends GetxController {
  var isLoading = true.obs;
  DocumentResponse? documentResponse;

  @override
  void onInit() {
    super.onInit();
    fetchDocuments(3625); // Example memberNameId
  }

  void fetchDocuments(int memberNameId) async {
    try {
      isLoading(true);
      documentResponse = await ApiService.fetchAllDocuments(memberNameId);
    } finally {
      isLoading(false);
    }
  }
}
