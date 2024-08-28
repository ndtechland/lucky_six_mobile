import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_app/HomePage/select_dice/select_22_dice.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controllersss/rezaypay_controller/pay_amount_controller.dart';
import '../../controllers_all/dicelist_for_double_dice_controller.dart';
import '../../controllers_all/double_dice_selection_controller.dart';

class TwiceNumberSelection extends StatelessWidget {
  static const String id = 'Company';

  final DoublediceSelectionController _doublediceController =
      Get.put(DoublediceSelectionController());
  final RozarpayamountController _rozarpayamountController =
      Get.put(RozarpayamountController());

  GetTwoDiceListController _getTwoDiceListController =
      Get.put(GetTwoDiceListController());

  final List<String> _diceImages2 = [
    'assets/images/dice1.png',
    'assets/images/dice2.png',
    'assets/images/dice3.png',
    'assets/images/dice4.png',
    'assets/images/dice5.png',
    'assets/images/dice6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.red.shade300,
        title: const Text('Select Dices 1'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            child: GestureDetector(
              onTap: () {
                Get.to(TwiceNumberSelection2());
              },
              child: PhysicalModel(
                color: Colors.white10,
                shadowColor: Colors.black26,
                elevation: 15,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 18,
                  width: 60,
                  child: Center(
                      child: Text(
                    "NEXT",
                    style:
                        GoogleFonts.alatsi(fontSize: 13, color: Colors.black),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/svg_images/ludobackblack.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return buildGridView(context);
              } else {
                return buildListView(context);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildGridView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18.0,
          mainAxisSpacing: 18.0,
          childAspectRatio: 1.0,
        ),
        itemCount: _getTwoDiceListController.diceList!.diceNumvers!.length,
        //_diceImages2.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected =
                _doublediceController.selectedIndices.contains(index);
            return InkWell(
              onTap: () {
                _doublediceController.toggleSelection(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                transform:
                    isSelected ? Matrix4.identity() : Matrix4.rotationX(0.1)
                      ..rotateY(0.1),
                transformAlignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade300,
                      isSelected ? Colors.red.shade200 : Colors.grey.shade300,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(4, 4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.7),
                      offset: Offset(-4, -4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/svg_images/ludobackblack.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: isSelected ? Colors.red.shade100 : Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          transform: isSelected
                              ? Matrix4.identity()
                              : Matrix4.rotationX(0.1)
                            ..rotateY(0.1),
                          transformAlignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: isSelected
                                    ? Colors.red.shade300
                                    : Colors.grey.shade400,
                                offset: Offset(4, 4),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Colors.white.withOpacity(0.7),
                                offset: Offset(-4, -4),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                            color:
                                isSelected ? Colors.red.shade300 : Colors.grey,
                            border: Border.all(
                              color: isSelected
                                  ? Colors.red.shade300
                                  : Colors.white,
                              width: 4,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(_diceImages2[index]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget buildListView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 30),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _getTwoDiceListController.diceList!.diceNumvers!.length,

        //_diceImages2.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected =
                _doublediceController.selectedIndices.contains(index);
            return InkWell(
              onTap: () {
                _doublediceController.toggleSelection(index);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 13),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  transform:
                      isSelected ? Matrix4.identity() : Matrix4.rotationX(0.1)
                        ..rotateY(0.1),
                  transformAlignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade300,
                        isSelected ? Colors.red.shade700 : Colors.grey.shade100,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(2, 2),
                        blurRadius: 10,
                        spreadRadius: 3,
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.7),
                        offset: Offset(-2, -2),
                        blurRadius: 10,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/svg_images/ludobackblack.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                        color: isSelected ? Colors.red.shade100 : Colors.white,
                      ),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        transform: isSelected
                            ? Matrix4.identity()
                            : Matrix4.rotationX(0.1)
                          ..rotateY(0.1),
                        transformAlignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: isSelected
                                  ? Colors.red.shade300
                                  : Colors.grey.shade400,
                              offset: Offset(4, 4),
                              blurRadius: 4,
                              spreadRadius: 12,
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.7),
                              offset: Offset(-4, -4),
                              blurRadius: 4,
                              spreadRadius: 12,
                            ),
                          ],
                          color: isSelected ? Colors.red.shade300 : Colors.grey,
                          border: Border.all(
                            color:
                                isSelected ? Colors.red.shade300 : Colors.white,
                            width: 4,
                          ),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.40,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(_diceImages2[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
