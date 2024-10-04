import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constantt/red_white_dilogbox/for_double_dice_game/red_dice_double_dilogbox.dart';
import '../../constantt/red_white_dilogbox/for_double_dice_game/white_dice_double_dilogue.dart';
import '../../controllers_all/game_type_wht_rd_controller.dart';

// class DoubleDiceRollFaceSelection extends StatefulWidget {
//   const DoubleDiceRollFaceSelection({super.key});
//
//   @override
//   _DoubleDiceRollFaceSelectionState createState() =>
//       _DoubleDiceRollFaceSelectionState();
// }
//
// class _DoubleDiceRollFaceSelectionState
//     extends State<DoubleDiceRollFaceSelection> {
//   final List<Map<String, dynamic>> items = [
//     {
//       'label': 'Red Dice',
//       'icon': Icons.casino_rounded,
//     },
//     {
//       'label': 'White Dice',
//       'icon': Icons.casino,
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
//         title: Text('Select Dice Color'),
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
//                                 ? Colors.green.shade300
//                                 : Colors.red.shade300,
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
//                               Icon(
//                                 items[index]['icon'],
//                                 color: Colors.white,
//                                 size: 40,
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 items[index]['label'],
//                                 style: TextStyle(
//                                   color: Colors.white,
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
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) => CupertinoAlertDialog(
//                       title: GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           padding: EdgeInsets.all(10.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Dice Selection",
//                                 style: GoogleFonts.abyssinicaSil(
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               // Text(
//                               //   "!",
//                               //   style: GoogleFonts.abyssinicaSil(
//                               //     fontSize: 13,
//                               //     color: Colors.red.shade300,
//                               //     fontWeight: FontWeight.w600,
//                               //   ),
//                               // ),
//                             ],
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
//                                 "If your selection dice will be Red then 3-5 time will be left and 5 to 7 time right. \n"
//                                 "If your selection dice will be White then 3-5 time left , 2-7 time center, 2-5 time right and 2-3 time bounce",
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
//                           onPressed: () {
//                             Get.back();
//
//                             ///Get.to(DiceRollFaceSelection());
//
//                             /// _rozarpayamountController.openCheckout();
//                             Get.to(() => PriceListssfortwodice());
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
//
//                   // Get.to(() => PriceListss());
//
//                   // Navigate to the next screen
//                   // Navigator.of(context).push(
//                   //   MaterialPageRoute(
//                   //       builder: (context) => DiceRollSpeedList()),
//                   // );
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

///
class DoubleDiceRollFaceSelection extends StatefulWidget {
  const DoubleDiceRollFaceSelection({super.key});

  @override
  _DoubleDiceRollFaceSelectionState createState() =>
      _DoubleDiceRollFaceSelectionState();
}

GetDiceColorController _getDiceColorColorController =
    Get.put(GetDiceColorController());

class _DoubleDiceRollFaceSelectionState
    extends State<DoubleDiceRollFaceSelection> {
  final List<Map<String, dynamic>> items = [
    {
      'label': 'Red Dice',
      'image': 'assets/images/svg_images/3d_dice_red.png',
    },
    {
      'label': 'White Dice',
      'image': 'assets/images/svg_images/3d_dice_white.png',
    },
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Select Color'),
        backgroundColor: Colors.red.shade200,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 15, right: 5, top: 10, bottom: 7),
            child: ElevatedButton(
              onPressed: selectedIndex == null
                  ? null
                  : () {
                      if (selectedIndex == 0) {
                        // Navigate to RedDiceDilogSingleGame
                        RedDiceDilogDoubleGame.showDiceSelectionDialog(context);
                      } else if (selectedIndex == 1) {
                        // Navigate to WhiteDiceDilogSingleGame
                        WhiteDiceDilogDoubleGame.showDiceSelectionDialog(
                            context);
                      } else {
                        Fluttertoast.showToast(
                          msg: "Invalid selection.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
              child: Text(
                'Next',
                style: GoogleFonts.roboto(
                  letterSpacing: 1,
                  fontSize: 18,
                  color: selectedIndex == null ? Colors.black12 : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: selectedIndex == null
                    ? Colors.grey.shade300
                    : Colors.white70,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get the screen width and height
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          // Check if the device is in landscape or portrait mode
          final isLandscape = width > height;

          return Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  'assets/images/svg_images/ludobackblack.png',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Obx(
                      () => (_getDiceColorColorController.isLoading.value)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              margin: EdgeInsets.all(16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: isLandscape
                                  ? SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.57,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.45,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _getDiceColorColorController
                                            .diceList?.data?.length,
                                        itemBuilder: (context, index) {
                                          final isSelected =
                                              selectedIndex == index;
                                          return GestureDetector(
                                            onTap: () async {
                                              SharedPreferences sharedPrefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              final box =
                                                  GetStorage(); // GetStorage instance

                                              String? gameColorID =
                                                  _getDiceColorColorController
                                                      .diceList?.data![index].id
                                                      .toString();

                                              // Save the game color ID in SharedPreferences
                                              await sharedPrefs.setString(
                                                  'gameColorID', gameColorID!);

                                              // Save the game color ID in GetStorage
                                              box.write(
                                                  'gameColorID21', gameColorID);

                                              print(
                                                  'Game color ID saved2: $gameColorID');
                                              setState(() {
                                                selectedIndex =
                                                    isSelected ? null : index;
                                              });
                                            },
                                            child: Container(
                                              width: 190,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? Colors.blue
                                                        .shade300 // Selected color
                                                    : Colors.grey
                                                        .shade300, // Unselected color
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Colors.transparent,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    items[index]['image'],
                                                    height:
                                                        80, // Adjust height as needed
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    "${_getDiceColorColorController.diceList?.data![index].name} Dice",

                                                    // items[index]['label'],
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      shadows: [
                                                        Shadow(
                                                          blurRadius: 3.0,
                                                          color: Colors.black
                                                              .withOpacity(0.4),
                                                          offset:
                                                              Offset(0.0, 0.0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                      ),
                                      itemCount: _getDiceColorColorController
                                          .diceList?.data?.length,
                                      // itemCount: items.length,
                                      itemBuilder: (context, index) {
                                        final isSelected =
                                            selectedIndex == index;
                                        return GestureDetector(
                                          onTap: () async {
                                            SharedPreferences sharedPrefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            final box =
                                                GetStorage(); // GetStorage instance

                                            String? gameColorID =
                                                _getDiceColorColorController
                                                    .diceList?.data![index].id
                                                    .toString();

                                            // Save the game color ID in SharedPreferences
                                            await sharedPrefs.setString(
                                                'gameColorID', gameColorID!);

                                            // Save the game color ID in GetStorage
                                            box.write(
                                                'gameColorID21', gameColorID);

                                            print(
                                                'Game color ID saved2: $gameColorID');
                                            setState(() {
                                              selectedIndex =
                                                  isSelected ? null : index;
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? Colors.blue
                                                      .shade300 // Selected color
                                                  : Colors.grey
                                                      .shade300, // Unselected color
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: isSelected
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                width: 2,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  items[index]['image'],
                                                  height:
                                                      80, // Adjust height as needed
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  "${_getDiceColorColorController.diceList?.data?[index].name}Dice",

                                                  // items[index]['label'],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 3.0,
                                                        color: Colors.black
                                                            .withOpacity(0.4),
                                                        offset:
                                                            Offset(0.0, 0.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
