// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../constantt/circular_loader/circular_loaderr.dart';
// import '../../game_type/single_dice_game/player_lists.dart';
//
// class DiceRollSpeedList extends StatefulWidget {
//   @override
//   _DiceRollSpeedListState createState() => _DiceRollSpeedListState();
// }
//
// class _DiceRollSpeedListState extends State<DiceRollSpeedList> {
//   final List<String> items = [
//     '10 time roll',
//     '23 time roll',
//     '40 time roll',
//     '57 time roll',
//     '100 time roll', // Added fifth item
//   ];
//
//   final List<String> items2 = [
//     'Wining Amt: 50',
//     'Wining Amt: 100',
//     'Wining Amt: 150',
//     'Wining Amt: 200',
//     'Wining Amt: 250',
//     'Wining Amt: 300', // Added sixth item
//   ];
//
//   final List<Color> colors = [
//     Colors.red.shade300,
//     Colors.red.shade300,
//     Colors.red.shade300,
//     Colors.red.shade300,
//     Colors.red.shade300, // Color for the fifth item
//   ];
//
//   int? selectedIndex; // To track the selected item
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Dice Speed List'),
//         backgroundColor: Colors.red.shade200,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Stack(
//         children: [
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/svg_images/ludobackblack.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Center(
//             child: Container(
//               margin: EdgeInsets.all(16),
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white, // Light white background color
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     spreadRadius: 1,
//                     blurRadius: 5,
//                     offset: Offset(0, 2), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: OrientationBuilder(
//                 builder: (context, orientation) {
//                   return orientation == Orientation.portrait
//                       ? Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             ListView.builder(
//                               shrinkWrap: true,
//                               itemCount: items.length,
//                               itemBuilder: (context, index) {
//                                 final isSelected = selectedIndex == index;
//                                 return GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       selectedIndex = isSelected ? null : index;
//                                     });
//                                   },
//                                   child: Container(
//                                     margin: EdgeInsets.only(bottom: 16),
//                                     padding: EdgeInsets.all(16),
//                                     decoration: BoxDecoration(
//                                       color: isSelected
//                                           ? colors[index].withOpacity(
//                                               1.0) // Selected color
//                                           : colors[index].withOpacity(
//                                               0.5), // Default color
//                                       borderRadius: BorderRadius.circular(12),
//                                       border: Border.all(
//                                         color: isSelected
//                                             ? Colors.white
//                                             : colors[index].withOpacity(1.0),
//                                         width: 2,
//                                       ),
//                                     ),
//                                     child: Center(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             items[index],
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.bold,
//                                               shadows: [
//                                                 Shadow(
//                                                   blurRadius: 10.0,
//                                                   color: Colors.black
//                                                       .withOpacity(0.5),
//                                                   offset: Offset(2.0, 2.0),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           SizedBox(height: 8),
//                                           Text(
//                                             items2[index],
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 16,
//                                               shadows: [
//                                                 Shadow(
//                                                   blurRadius: 10.0,
//                                                   color: Colors.black
//                                                       .withOpacity(0.5),
//                                                   offset: Offset(2.0, 2.0),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         )
//                       : Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: SizedBox(
//                             height: 120, // Fixed height for horizontal layout
//                             child: SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                 children: List.generate(
//                                   items.length,
//                                   (index) {
//                                     final isSelected = selectedIndex == index;
//                                     return GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           selectedIndex =
//                                               isSelected ? null : index;
//                                         });
//                                       },
//                                       child: Container(
//                                         width:
//                                             150, // Fixed width for horizontal layout
//                                         margin: EdgeInsets.only(right: 16),
//                                         padding: EdgeInsets.all(16),
//                                         decoration: BoxDecoration(
//                                           color: isSelected
//                                               ? colors[index].withOpacity(
//                                                   1.0) // Selected color
//                                               : colors[index].withOpacity(
//                                                   0.5), // Default color
//                                           borderRadius:
//                                               BorderRadius.circular(12),
//                                           border: Border.all(
//                                             color: isSelected
//                                                 ? Colors.white
//                                                 : colors[index]
//                                                     .withOpacity(1.0),
//                                             width: 2,
//                                           ),
//                                         ),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               items[index],
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold,
//                                                 shadows: [
//                                                   Shadow(
//                                                     blurRadius: 10.0,
//                                                     color: Colors.black
//                                                         .withOpacity(0.5),
//                                                     offset: Offset(2.0, 2.0),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             SizedBox(height: 8),
//                                             Text(
//                                               items2[index],
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 16,
//                                                 shadows: [
//                                                   Shadow(
//                                                     blurRadius: 10.0,
//                                                     color: Colors.black
//                                                         .withOpacity(0.5),
//                                                     offset: Offset(2.0, 2.0),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                 },
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 1,
//             left: MediaQuery.of(context).size.width * 0.25,
//             right: MediaQuery.of(context).size.width * 0.25,
//             child: ElevatedButton(
//               onPressed: () {
//                 if (selectedIndex == null) {
//                   Fluttertoast.showToast(
//                     msg: "Please select an item first.",
//                     toastLength: Toast.LENGTH_SHORT,
//                     gravity: ToastGravity.BOTTOM,
//                     timeInSecForIosWeb: 1,
//                     backgroundColor: Colors.red,
//                     textColor: Colors.white,
//                     fontSize: 16.0,
//                   );
//                 } else {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) => CupertinoAlertDialog(
//                       title: GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: Colors.red.shade300,
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           padding: EdgeInsets.all(12.0),
//                           child: Text(
//                             "NOTE!",
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                       ),
//                       content: Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Your wining amount chances 80% during this speed of dice ",
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 14,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       actions: <Widget>[
//                         CupertinoDialogAction(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           child: Text(
//                             "Cancel",
//                             style: GoogleFonts.poppins(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.red,
//                             ),
//                           ),
//                         ),
//                         CupertinoDialogAction(
//                           onPressed: () async {
//                             Get.back();
//                             CallLoader.loader();
//                             await Future.delayed(Duration(seconds: 1));
//                             CallLoader.hideLoader();
//
//                             await Get.to(() => PlayerLists());
//                           },
//                           child: Text(
//                             "OK",
//                             style: GoogleFonts.poppins(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.green.shade700,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(1.0),
//                 child: Text(
//                   'Enter Room',
//                   style: GoogleFonts.abel(
//                     letterSpacing: 1,
//                     fontSize: 18,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.red.shade200, // Button background color
//                 onPrimary: Colors.white, // Text color
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
