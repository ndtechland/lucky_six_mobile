import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controllersss/rezaypay_controller/pay_amount_controller.dart';
import '../../controllers_all/create_list_players.dart';
import '../../controllers_all/create_single_room_controller.dart';
import '../../controllers_all/dice_list_controller_byid.dart';
import '../../controllers_all/dice_popup_avlbal_controller.dart';
import '../../game_type/single_dice_game/player_lists.dart';

class NumberSelection extends StatelessWidget {
  static const String id = 'Company';

  DiceAvlBalpopupController _diceAvlBalpopupController =
      Get.put(DiceAvlBalpopupController());
  final RozarpayamountController _rozarpayamountController =
      Get.put(RozarpayamountController());
  GetDiceListController _getDiceListController =
      Get.put(GetDiceListController());

  CreateRoomSingleController _createRoomSingleController =
      Get.put(CreateRoomSingleController());
  GetUserListController _getUserListController =
      Get.put(GetUserListController());

  final List<String> _diceImages2 = [
    'assets/images/dice1.png',
    'assets/images/dice2.png',
    'assets/images/dice3.png',
    'assets/images/dice4.png',
    'assets/images/dice5.png',
    'assets/images/dice6.png',
  ];

  ///todo:........................................
  ///todo:........................................

  @override
  Widget build(BuildContext context) {
    // DiceAvlBalpopupController _diceAvlBalpopupController = Get.put(DiceAvlBalpopupController());

    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var fontheight = isPortrait
        ? MediaQuery.of(context).size.height * 0.21
        : MediaQuery.of(context).size.height * 0.5;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.red.shade300,
        title: const Text('Select Dices'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => _diceAvlBalpopupController.isLoading.value
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text(
                                        "Avl Balance: ",
                                        style: GoogleFonts.abyssinicaSil(
                                          fontSize: fontheight * 0.12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                              Obx(
                                () => Text(
                                  "${_diceAvlBalpopupController.data2.value?.totalAvlAmt?.toInt()}", // Use .value for RxString
                                  style: GoogleFonts.abyssinicaSil(
                                    fontSize: fontheight * 0.13,
                                    color: Colors.red.shade300,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    content: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              /// "${_getDiceListController.selectedIndex.value + 1}",
                              "Your Selected dice is  ${_getDiceListController.selectedIndex.value + 1} \n You have to pay your payable Coins for start your game and your payable Coins is:-",
                              style: GoogleFonts.poppins(
                                fontSize: 14,

                                ///todo:.......................
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Obx(
                            () => _diceAvlBalpopupController.isLoading.value
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    "${_diceAvlBalpopupController.data2.value?.bettingAmount.toString()}", // Use .value for RxString
                                    style: GoogleFonts.poppins(
                                      fontSize: fontheight * 0.12,
                                      color: Colors.green.shade900,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      CupertinoDialogAction(
                        onPressed: () async {
                          Get.back();

                          await _createRoomSingleController
                              .createRoomSingleApi();
                          await _getUserListController.gameUserListApi();

                          await _getDiceListController.saveSelectedDiceId();
                          // Fetch saved ID for confirmation
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          int? savedDiceId = prefs.getInt('selected_dice_id');
                          print("Saved Dice ID: $savedDiceId");
                          // Or from GetStorage
                          int? storedDiceId =
                              GetStorage().read('selected_dice_id');
                          print("Saved Dice ID from GetStorage: $storedDiceId");

                          /// _rozarpayamountController.openCheckout();
                          await Get.to(PlayerLists());
                        },
                        child: Text(
                          "Pay",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
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
    GetDiceListController _getDiceListController =
        Get.put(GetDiceListController());
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18.0,
          mainAxisSpacing: 18.0,
          childAspectRatio: 1.0,
        ),
        itemCount: 6,
        //_getDiceListController.diceList?.diceNumvers?.length,

        /// _diceImages2.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected =
                _getDiceListController.selectedIndex.value == index;
            // bool isSelected =
            //     _getDiceListController.selectedIndices.contains(index);
            return InkWell(
              onTap: () {
                _getDiceListController.toggleSelection(index);
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
        itemCount: _diceImages2.length, // Make sure this is correct
        itemBuilder: (context, index) {
          return Obx(() {
            // Determine if the current index is selected
            bool isSelected =
                _getDiceListController.selectedIndex.value == index;

            return InkWell(
              onTap: () {
                _getDiceListController.toggleSelection(index);
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
                          ///
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
