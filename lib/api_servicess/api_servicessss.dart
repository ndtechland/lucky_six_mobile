// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;
//
// import '../1_models/test_model_delete/test_maf.dart';
//
// class ApiProvider {
//   static String userid = ''.toString();
//
//   //'https://organicdeal.in/api/';
//   // banner Api
//
//   ///14.payment.......history........
//
//   static PaymentHistoryApi() async {
//     var prefs = GetStorage();
//
//     //saved userid..........
//     //prefs.write("Id".toString(), json.decode(r.body)['Id']);
//     userid = prefs.read("Id").toString();
//     print('wwwuseridEsfsaEsasa:${userid}');
//     var url = "https://new.signatureresorts.in/api/CommonApi/MafNumberList";
//     try {
//       http.Response r = await http.get(Uri.parse(url));
//       if (r.statusCode == 200) {
//         MafListKp? paymenthisModel = mafListKpFromJson(r.body);
//         print("amcduedetailmodeel : ${paymenthisModel.data?[0]?.id}");
//         return paymenthisModel;
//       }
//     } catch (error) {
//       print('amcdetazxcilerorss: $error');
//       return;
//     }
//   }
// }
//
// //https://new.signatureresorts.in/api/CommonApi/PayEmi
