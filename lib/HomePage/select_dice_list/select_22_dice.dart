import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controllersss/rezaypay_controller/pay_twicw_amount_controller.dart';
import '../../controllers_all/create_list_players.dart';
import '../../controllers_all/create_room_double_controller.dart';
import '../../controllers_all/dice_popup_avlbal_controller.dart';
import '../../controllers_all/double_dice_selection2index_controller.dart';
import '../../controllers_all/doubledice_selection2_controller.dart';
import '../../controllers_all/game_price_list_double_controller.dart';
import '../../game_type/double_gamee/player_list_for2dice.dart';

class TwiceNumberSelection2 extends StatelessWidget {
  GetUserListController _getUserListController =
      Get.put(GetUserListController());

  DoublediceSelection22Controller _doublediceSelection22Controller =
      Get.put(DoublediceSelection22Controller());

  GetGamePriceListDoubleController _gamePriceListDouble2Controller =
      Get.put(GetGamePriceListDoubleController());
  // static const String id = 'Company';

  final DoublediceSelection2Controller _doublediceController =
      Get.put(DoublediceSelection2Controller());

  CreateRoomDoubleController _createRoomDoubleController =
      Get.put(CreateRoomDoubleController());

  DoublediceSelection2Controller _getTwoDiceList2Controller =
      Get.put(DoublediceSelection2Controller());

  final RozarpaytwiceamountController _rozarpayamountController =
      Get.put(RozarpaytwiceamountController());
  DiceAvlBalpopupController _diceAvlBalpopupController =
      Get.put(DiceAvlBalpopupController());
  //
  // final List<String> _priceList = [
  //   '1',
  //   '2',
  //   '3',
  //   '4',
  //   '5',
  //   '6',
  // ];

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
        title: const Text('Select Dices 2'),
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
                              "Your Selected dice is  1-2 \n You have to pay your payable Amount for start your game and your payable Amount is:-",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
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

                          // Get.back();

                          await _createRoomDoubleController.createRoomApi();
                          await _getUserListController.gameUserListApi();

                          // await _getDiceListController.saveSelectedDiceId();

                          print(
                              "okgameid3${_gamePriceListDouble2Controller.getpricelistModel?.gameid.toString()}");

                          ///todo: upper calling create room api post api.....

                          /// _rozarpayamountController.openCheckout();
                          await Get.to(
                              // DoubleDiceRollFaceSelection());
                              PlayerLists2dice());
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
        itemCount: _diceImages2.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected = _doublediceSelection22Controller.selectedIndices2
                .contains(index);

            return InkWell(
              onTap: () async {
                SharedPreferences sharedPrefs =
                    await SharedPreferences.getInstance();

                String? dicedelection2Id = _getTwoDiceList2Controller
                    .diceList?.diceNumvers?[index].id
                    .toString();
                print(
                    "oklrrrr${dicedelection2Id = _getTwoDiceList2Controller.diceList?.diceNumvers?[index].id.toString()}");

                if (dicedelection2Id != null) {
                  await sharedPrefs.setString(
                      'diceselection2Id_', dicedelection2Id);

                  print("Game dice selection 2 ID saved: $dicedelection2Id");
                } else {
                  print("Dice selection2 ID is null, not saving.");
                }
                _doublediceSelection22Controller.toggleSelection(index);
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
        itemCount: _diceImages2.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected = _doublediceSelection22Controller.selectedIndices2
                .contains(index);
            return InkWell(
              onTap: () async {
                SharedPreferences sharedPrefs =
                    await SharedPreferences.getInstance();

                String? dicedelection2Id = _getTwoDiceList2Controller
                    .diceList?.diceNumvers?[index].id
                    .toString();

                if (dicedelection2Id != null) {
                  await sharedPrefs.setString(
                      'diceselection2Id_', dicedelection2Id);

                  print("Game dice selection 2 ID saved: $dicedelection2Id");
                } else {
                  print("Dice selection2 ID is null, not saving.");
                }
                _doublediceSelection22Controller.toggleSelection(index);
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
