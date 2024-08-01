// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:game_app/api_servicess/test_controller/test_controller.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class PaymentHistory extends StatelessWidget {
//   PaymentHistory({Key? key}) : super(key: key);
//
//   PaymentDetailController _paymentcontroller =
//       Get.put(PaymentDetailController());
//
//   final List<String> text0 = [
//     '31 Jan 2021',
//     '12 Jan 2020',
//     '12 Mar 2019',
//     '23 Jul 2017',
//     '20 May 2016',
//   ];
//   final List<String> text1 = [
//     'Rs.5000',
//     'Rs.8500',
//     'Rs.9500',
//     'Rs.6500',
//     'Rs.5500',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     //"${(_paymentcontroller.paymentHisModel?.totalCost?.toDouble())! - ((_paymentcontroller.paymentHisModel?.balance?.toDouble())!).toInt()}");
//     return Scaffold(
//       backgroundColor: Colors.green,
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           'Fee',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 14,
//           ),
//         ),
//       ),
//       body: Obx(
//         () => (_paymentcontroller.isLoading.value)
//             ? Center(child: CircularProgressIndicator())
//             : _paymentcontroller.paymentHisModel?.data == null
//                 ? Center(
//                     child: Text('No Data'),
//                   )
//                 : SafeArea(
//                     child: Container(
//                       //height: 94,
//                       //width: 400,
//                       color: Colors.white,
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 120,
//                             width: 300,
//                             color: Colors.white,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: SizedBox(
//                                       height: 40,
//                                       //width: 10,
//                                       child: Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.stretch,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "ID:${_paymentcontroller.paymentHisModel?.data![0].id}",
//                                             // 'Rs. 107000',
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               color: Colors.red,
//                                               fontSize: 10,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Divider(
//                             color: Colors.black,
//                             thickness: 0.1,
//                           ),
//                           Material(
//                             elevation: 2,
//                             child: Container(
//                               height: 90,
//                               //width: ,
//                               color: Colors.white,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   //crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Align(
//                                       alignment: Alignment.center,
//                                       child: SizedBox(
//                                         height: 30,
//                                         //width: 60,
//                                         child: Row(
//                                           //crossAxisAlignment: CrossAxisAlignment.stretch,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Mobile',
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w400,
//                                                 color: Colors.black,
//                                                 fontSize: 10,
//                                               ),
//                                             ),
//                                             Text(
//                                               "${_paymentcontroller.paymentHisModel?.data![0].mobileNumber}",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w400,
//                                                 color: Colors.green,
//                                                 fontSize: 10,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: Alignment.center,
//                                       child: SizedBox(
//                                         //height: 30,
//                                         //width: 60,
//                                         child: Row(
//                                           ///crossAxisAlignment: CrossAxisAlignment.stretch,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text(
//                                               "ApprovalNo.${_paymentcontroller.paymentHisModel?.data![0].approvalNumber}",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w400,
//                                                 color: Colors.red,
//                                                 fontSize: 10,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {},
//                                       child: Container(
//                                         height: 30,
//                                         width: 60,
//                                         color: Colors.yellow,
//                                         child: Center(child: Text("Next")),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//       ),
//     );
//   }
// }
