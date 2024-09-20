// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../constantt/red_white_dilogbox/red_dice_single_dilogbox.dart';
// import '../constantt/red_white_dilogbox/white_dice_single_dilogue.dart';
//
// class DiceRollFaceSelection extends StatefulWidget {
//   const DiceRollFaceSelection({super.key});
//
//   @override
//   _DiceRollFaceSelectionState createState() => _DiceRollFaceSelectionState();
// }
//
// class _DiceRollFaceSelectionState extends State<DiceRollFaceSelection> {
//   final List<Map<String, dynamic>> items = [
//     {
//       'label': 'Red Dice',
//       'image': 'assets/images/svg_images/3d_dice_red.png',
//       'nextScreen': RedDiceDilogSingleGame() // Navigate to PriceListss screen
//     },
//     {
//       'label': 'White Dice',
//       'image': 'assets/images/svg_images/3d_dice_white.png',
//       'nextScreen':
//           WhiteDiceDilogSingleGame(), // Replace with a different screen if needed
//     },
//   ];
//
//   int? selectedIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Select Dice Colors'),
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
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     spreadRadius: 1,
//                     blurRadius: 5,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: OrientationBuilder(
//                 builder: (context, orientation) {
//                   return GridView.builder(
//                     shrinkWrap: true,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount:
//                           orientation == Orientation.portrait ? 2 : 4,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 16,
//                     ),
//                     itemCount: items.length,
//                     itemBuilder: (context, index) {
//                       final isSelected = selectedIndex == index;
//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedIndex = isSelected ? null : index;
//                           });
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             color: isSelected
//                                 ? Colors.blue.shade300 // Selected color
//                                 : Colors.grey.shade300, // Unselected color
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(
//                               color: isSelected
//                                   ? Colors.white
//                                   : Colors.transparent,
//                               width: 2,
//                             ),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 items[index]['image'],
//                                 height: 80, // Adjust height as needed
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 items[index]['label'],
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   shadows: [
//                                     Shadow(
//                                       blurRadius: 10.0,
//                                       color: Colors.black.withOpacity(0.5),
//                                       offset: Offset(2.0, 2.0),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0.5,
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
//                   // Navigate to the selected screen
//                   Get.to(items[selectedIndex!]['nextScreen']);
//                 }
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(1.0),
//                 child: Text(
//                   'Select Price',
//                   style: GoogleFonts.abel(
//                     letterSpacing: 1,
//                     fontSize: 18,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.red.shade200,
//                 onPrimary: Colors.white,
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
