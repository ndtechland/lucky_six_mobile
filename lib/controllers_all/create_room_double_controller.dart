import 'package:game_app/2_servicea_apis/api_services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreateRoomDoubleController extends GetxController {
  // Observable for loading state
  RxBool isLoading = false.obs;

  // Method to call the CreateRoom API
  Future<void> createRoomApi() async {
    try {
      isLoading(true); // Start the loader
      http.Response r = await ApiProvider.UserCreateRoomDoubleApi();

      if (r.statusCode == 200) {
        print("ACCOUNT: ${r.body}");
        // Handle successful response, such as parsing the body and updating UI
      } else {
        // Show error message on API failure
        Get.snackbar("Failed", "Error: ${r.body}");
      }
    } catch (e) {
      // Handle exception
      Get.snackbar("Error", "Something went wrong. Please try again.");
      print("Error: $e");
    } finally {
      isLoading(false); // Stop the loader
    }
  }

  // Email validation logic

  // Controller lifecycle methods
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
