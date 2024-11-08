import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constantt/red_white_dilogbox/for_self_dice_game/red_dice_self_dilogbox.dart';
import '../../constantt/red_white_dilogbox/for_self_dice_game/white_dice_self_dilogue.dart';

///
class SelfDiceRollFaceSelection extends StatefulWidget {
  const SelfDiceRollFaceSelection({super.key});

  @override
  _SelfDiceRollFaceSelectionState createState() =>
      _SelfDiceRollFaceSelectionState();
}

class _SelfDiceRollFaceSelectionState extends State<SelfDiceRollFaceSelection> {
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
            padding: EdgeInsets.only(left: 15, right: 5, top: 5, bottom: 5),
            child: ElevatedButton(
              onPressed: selectedIndex == null
                  ? null
                  : () {
                      if (selectedIndex == 0) {
                        // Navigate to RedDiceDilogSingleGame
                        RedDiceDilogSelfGame.showDiceSelectionDialog(context);
                      } else if (selectedIndex == 1) {
                        // Navigate to WhiteDiceDilogSingleGame
                        WhiteDiceDilogSelfGame.showDiceSelectionDialog(context);
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
                foregroundColor: Colors.white,
                backgroundColor: selectedIndex == null
                    ? Colors.grey.shade300
                    : Colors.white70,
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
                    child: Container(
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
                              width: MediaQuery.of(context).size.width * 0.57,
                              height: MediaQuery.of(context).size.height * 0.45,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  final isSelected = selectedIndex == index;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex =
                                            isSelected ? null : index;
                                      });
                                    },
                                    child: Container(
                                      width: 190,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors
                                                .blue.shade300 // Selected color
                                            : Colors.grey
                                                .shade300, // Unselected color
                                        borderRadius: BorderRadius.circular(12),
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
                                          SizedBox(height: 4),
                                          Text(
                                            items[index]['label'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 3.0,
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  offset: Offset(0.0, 0.0),
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
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final isSelected = selectedIndex == index;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = isSelected ? null : index;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors
                                              .blue.shade300 // Selected color
                                          : Colors.grey
                                              .shade300, // Unselected color
                                      borderRadius: BorderRadius.circular(12),
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
                                          height: 80, // Adjust height as needed
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          items[index]['label'],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 3.0,
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                offset: Offset(0.0, 0.0),
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
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
