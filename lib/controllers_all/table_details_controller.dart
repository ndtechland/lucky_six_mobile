import 'package:game_app/2_servicea_apis/api_services.dart';
import 'package:get/get.dart';

import '../1_models/table_details.dart';

class TableDetailsController extends GetxController {
  RxBool isLoading = true.obs;

  TableDetailsModel? tabledetailsModel;

  Future<void> TableDetailsApi() async {
    isLoading(true);
    tabledetailsModel = await ApiProvider.TableDetailsApi();
    //print the response...
    print("Table Details model: ${tabledetailsModel?.toJson()}");
    if (tabledetailsModel?.data?.userId0 != null) {
      print("Table Details model id: ${tabledetailsModel?.data?.userId0}");

      isLoading(false);
    } else {
      //isLoading(false);
    }
  }
}
