import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SelectedDiceController extends GetxController {
  var selectedIndex = Rxn<int>(); // Nullable int for no selection

  // Function to select index
  void selectIndex(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = null; // Deselect if already selected
    } else {
      selectedIndex.value = index;
    }
  }
}
