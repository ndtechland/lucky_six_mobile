import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers_all/dice_popup_avlbal_controller.dart';
import '../../controllers_all/game_price_list_self_controller.dart';
import '../../price_listts/price_listtss.dart';
import '../self_dice_game/play_now_self_game.dart';
import 'double_dice_3d.dart';

class PlayAgainIconButton3 extends StatefulWidget {
  //final VoidCallback onPressed;

  const PlayAgainIconButton3({Key? key}) : super(key: key);

  @override
  _PlayAgainIconButton3State createState() => _PlayAgainIconButton3State();
}

DiceAvlBalpopupController _diceAvlBalpopupController =
    Get.put(DiceAvlBalpopupController());
GetGamePriceListSelfController _getGamePriceListSelfController =
    Get.put(GetGamePriceListSelfController());

class _PlayAgainIconButton3State extends State<PlayAgainIconButton3> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Set a timer to make the button visible after 18 seconds
    Timer(Duration(seconds: 0), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var fontheight = isPortrait
        ? MediaQuery.of(context).size.height * 0.21
        : MediaQuery.of(context).size.height * 0.5;

    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 00),
      child: _isVisible
          ? GestureDetector(
              onTap: () {
                _getGamePriceListSelfController.gamePriceListSelfApi();
                _getGamePriceListSelfController.update();
                // _getGamePriceListSelfController.onInit();
                Future.delayed(Duration(seconds: 1));

                ///Get.to(SelfDiceRollFaceSelection());
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
                              "You have to pay your payable Amount for start your game and your payable Amount is:-",
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
                        onPressed: () {
                          Get.back();
                          Get.to(PlayNowSelfGame());

                          /// _rozarpayamountController.openCheckout();
                          // Get.to(
                          //   // DoubleDiceRollFaceSelection());
                          //     PlayerLists2dice());
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

                // _showResultDialog();
              },
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(15),
                shadowColor: Colors.grey,
                child: Container(
                  //height: screenHeight * 0.05,
                  // width: screenWidth * 0.08,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white70, Colors.greenAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),

                    //shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(-4, 4),
                        blurRadius: 10,
                      ),

                      ///...........
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        offset: Offset(4, -4),
                        blurRadius: 10,
                      ),

                      ///............................
                    ],
                  ),
                  child: Center(child: Text("Pay")
                      // Icon(
                      //   Icons.speed_outlined,
                      //   color: Colors.white,
                      //   size: 30,
                      //   shadows: [
                      //     Shadow(
                      //       color: Colors.black.withOpacity(0.5),
                      //       offset: Offset(2, 2),
                      //       blurRadius: 2,
                      //     ),
                      //   ],
                      // ),
                      ),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }

  void _showResultDialog() {
    showDialog(
      //barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final double dialogSize = min(
          MediaQuery.of(context).size.width * 0.5,
          MediaQuery.of(context).size.height * 0.5,
        );

        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: dialogSize,
            height: dialogSize,
            decoration: BoxDecoration(
              color: Color(0xFF2E2E2E),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(3, 3),
                  blurRadius: 8,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  offset: Offset(-3, -3),
                  blurRadius: 8,
                ),
              ],
            ),
            //padding: EdgeInsets.all(15),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Play Again!',
                  style: GoogleFonts.abyssinicaSil(
                    color: Colors.green,
                    fontSize: 23, // Reduced title size
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12), // Reduced gap
                Text(
                  'You want to play again this game?',
                  style: GoogleFonts.raleway(
                    color: Colors.yellow,
                    fontSize: 16, // Reduced subtitle size
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25), // Reduced gap
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NeumorphicButton2(
                      text: 'Yes',
                      gradient: LinearGradient(
                        colors: [Colors.redAccent, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      onPressed: () {
                        print("play again button pressed"); // Debugging
                        Get.to(PriceListss());
                      },
                    ),
                    SizedBox(width: 4),
                    NeumorphicButton2(
                      text: 'No',
                      gradient: LinearGradient(
                        colors: [Colors.greenAccent, Colors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      onPressed: () {
                        print("back button pressed");
                        Navigator.pop(context);
                        // Debugging
                        //Get.to(Home_Page());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
