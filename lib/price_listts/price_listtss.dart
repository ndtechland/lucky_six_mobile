import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controllersss/pricelist_controller.dart';
import '../HomePage/homePage.dart';
import '../HomePage/select_dice/select_number_of_dice.dart';
import '../constantt/circular_loader/circular_loaderr.dart';
import '../controllers_all/dice_list_controller_byid.dart';
import '../controllers_all/game_price_list_controller.dart';
import '../controllers_all/game_type_get_controller.dart';
import '../controllers_all/wining_percentage_controller.dart';

class PriceListss extends StatelessWidget {
  static const String id = 'Company';

  final PriceListController _priceListController =
      Get.put(PriceListController());

  WiningAmtPercentageController _winingAmtPercentageController =
      Get.put(WiningAmtPercentageController());

  GetGamePriceListController _getGamePriceListController =
      Get.put(GetGamePriceListController());
  GetGameTypeController _gameTypeController = Get.put(GetGameTypeController());

  GetDiceListController _getDiceListController =
      Get.put(GetDiceListController());

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red.shade300,
        title: Text(
          "Price List",
          style: GoogleFonts.aBeeZee(fontSize: 19),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.to(Home_Page());
            },
            child: Icon(Icons.arrow_back)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/svg_images/ludobackblack.png"
                  // "https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                  //"assets/images/svg_images/backgroundddice.jpeg"
                  // "assets/images/backgroundhome2.jpg"
                  ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // SizedBox(
                //   height: isPortrait ? height * 0.02 : height * 0.02,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(4.0),
                //       child: GestureDetector(
                //         onTap: () {
                //           Get.back();
                //         },
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: Colors.red,
                //           ),
                //           child: Center(
                //             child: Icon(
                //               Icons.arrow_back,
                //               color: Colors.white,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       flex: 1,
                //       child: Padding(
                //         padding: EdgeInsets.only(
                //           top: MediaQuery.of(context).viewInsets.top + 12,
                //           left: MediaQuery.of(context).viewInsets.left +
                //               (isPortrait ? 50 : 250),
                //           right: MediaQuery.of(context).viewInsets.left +
                //               (isPortrait ? 80 : 250),
                //         ),
                //         child: Container(
                //           height: isPortrait ? height * 0.15 : height * 0.25,
                //           width: isPortrait ? width * 0.32 : width * 0.2,
                //           decoration: BoxDecoration(
                //             //border: Border.all(width: 2),
                //             borderRadius: BorderRadius.circular(7),
                //
                //             // image: DecorationImage(
                //             //   image:
                //             //       AssetImage("assets/images/svg_images/rlg.jpg"),
                //             //   fit: BoxFit.fill,
                //             // ),
                //           ),
                //           child: Text("Price List"),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: isPortrait ? height * 0.00 : height * 0.01,
                ),
                Expanded(
                  child: isPortrait
                      ? GridView.builder(
                          //physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: _getGamePriceListController
                              .getpricelistModel?.getGameAmount?.length,
                          //_priceList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                    title: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.red.shade300,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        padding: EdgeInsets.all(12.0),
                                        child: Text(
                                          "NOTE!",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    content: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Obx(
                                              () =>
                                                  (_winingAmtPercentageController
                                                          .isLoading.value)
                                                      ? Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        )
                                                      : Text(
                                                          "If you will win the game then we will send wining amount to your account after deduct ${_winingAmtPercentageController.winingPercentModel?.data?.amount}% of total transaction amount.",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                            ),
                                          ),
                                          //SizedBox(height: 0),
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
                                          CallLoader.loader();
                                          await Future.delayed(
                                              Duration(seconds: 1));
                                          // CallLoader.hideLoader();
                                          _getDiceListController.gameDiceListApi(
                                              gameTypeId2:
                                                  "${_getGamePriceListController.getpricelistModel?.gameid.toString()}"
                                              //"${_gameTypeController.gametypeModel?.getGames?[index].id.toString()}"
                                              );
                                          await Future.delayed(
                                              Duration(seconds: 1));

                                          CallLoader.hideLoader();
                                          await Get.to(() => NumberSelection());
                                          // CallLoader.loader();
                                          // await Future.delayed(
                                          //     Duration(seconds: 1));
                                          // CallLoader.hideLoader();
                                          //
                                          // _gamePriceListDoubleController
                                          //     .gamePriceListDoubleApi(
                                          //         gameTypeId:
                                          //             _gameTypeController
                                          //                 .gametypeModel
                                          //                 ?.getGames?[index]
                                          //                 .id
                                          //                 .toString());
                                          // Get.to(NumberSelection());

                                          // Navigate to a new screen when the OK button is pressed
                                          // Get.to(SomeOtherScreen()); // Replace SomeOtherScreen with your desired screen
                                        },
                                        child: Text(
                                          "OK",
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

                                // navigateToScreen(index);
                              },
                              child: Obx(
                                () => (_getGamePriceListController
                                        .isLoading.value)
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : _getGamePriceListController
                                                .getpricelistModel
                                                ?.getGameAmount![index]
                                                .gameName ==
                                            null
                                        ? const Center(
                                            child: Text('No Data'),
                                          )
                                        : buildImageContainer(
                                            "${_getGamePriceListController.getpricelistModel?.getGameAmount![index].winingAmt}",
                                            "${_getGamePriceListController.getpricelistModel?.getGameAmount![index].gameAmt}",
                                            // _priceList2[index],
                                            // _priceList[index],
                                            height,
                                            width,
                                            isPortrait),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _getGamePriceListController
                              .getpricelistModel!.getGameAmount!.length,
                          //_priceList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: index == 0
                                    ? width * 0.0400
                                    : width * 0.0300,
                                top: height * 0.1,
                                bottom: height * 0.1,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CupertinoAlertDialog(
                                      title: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.red.shade300,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          padding: EdgeInsets.all(12.0),
                                          child: Text(
                                            "NOTE!",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                      content: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "If you will win the game then we will send wining amount to your account after deduct 28% of total transaction amount.",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            //SizedBox(height: 0),
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

                                            CallLoader.loader();
                                            await Future.delayed(
                                                Duration(seconds: 1));

                                            CallLoader.hideLoader();

                                            await _getGamePriceListController
                                                .gamePriceListApi();
                                            await _getDiceListController
                                                .gameDiceListApi(
                                                    gameTypeId2:
                                                        "${_getGamePriceListController.getpricelistModel?.gameid.toString()}"

                                                    // gameTypeId2:
                                                    // "${_gameTypeController.gametypeModel?.getGames?[index].id}"
                                                    );
                                            print(
                                                "okgameid${_getGamePriceListController.getpricelistModel?.gameid.toString()}");
                                            Get.to(() => NumberSelection());

                                            // Navigate to a new screen when the OK button is pressed
                                            // Get.to(SomeOtherScreen()); // Replace SomeOtherScreen with your desired screen
                                          },
                                          child: Text(
                                            "OK",
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

                                  //navigateToScreen(index);
                                },
                                child: Obx(
                                  () => (_getGamePriceListController
                                          .isLoading.value)
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : _getGamePriceListController
                                                  .getpricelistModel
                                                  ?.getGameAmount![index]
                                                  .gameName ==
                                              null
                                          ? const Center(
                                              child: Text('No Data'),
                                            )
                                          : buildImageContainer(
                                              "${_getGamePriceListController.getpricelistModel?.getGameAmount![index].winingAmt}",
                                              " ${_getGamePriceListController.getpricelistModel?.getGameAmount![index].gameAmt}",

                                              // _priceList2[index],
                                              // _priceList[index],
                                              height,
                                              width,
                                              isPortrait),
                                ),
                              ),
                            );
                          },
                        ),
                ),
                SizedBox(
                  height: isPortrait ? height * 0.0050 : height * 0.001,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void navigateToScreen(int index) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => CupertinoAlertDialog(
  //       title: GestureDetector(
  //         onTap: () {},
  //         child: Container(
  //           width: double.infinity,
  //           decoration: BoxDecoration(
  //             color: Colors.blue.shade900,
  //             borderRadius: BorderRadius.circular(5.0),
  //           ),
  //           padding: EdgeInsets.all(12.0),
  //           child: Text(
  //             "SELECT GAME TYPE!",
  //             style: GoogleFonts.poppins(
  //               fontWeight: FontWeight.w600,
  //               color: Colors.white,
  //               fontSize: 14,
  //             ),
  //           ),
  //         ),
  //       ),
  //       content: Padding(
  //         padding: EdgeInsets.all(10.0),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             GestureDetector(
  //               onTap: () {
  //                 Get.to(PriceListss());
  //               },
  //               child: Container(
  //                 width: double.infinity,
  //                 decoration: BoxDecoration(
  //                   color: Colors.red.shade800,
  //                   borderRadius: BorderRadius.circular(15.0),
  //                 ),
  //                 padding: EdgeInsets.all(16.0),
  //                 child: Text(
  //                   "Single Game   >",
  //                   style: GoogleFonts.poppins(
  //                     fontWeight: FontWeight.w600,
  //                     color: Colors.white,
  //                     fontSize: 14,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 10),
  //             GestureDetector(
  //               onTap: () {
  //                 //Get.to(Play_Now_2dice());
  //               },
  //               child: Container(
  //                 width: double.infinity,
  //                 decoration: BoxDecoration(
  //                   color: Colors.green.shade800,
  //                   borderRadius: BorderRadius.circular(15.0),
  //                 ),
  //                 padding: EdgeInsets.all(16.0),
  //                 child: Text(
  //                   "Double Game   >",
  //                   style: GoogleFonts.poppins(
  //                     fontWeight: FontWeight.w600,
  //                     color: Colors.white,
  //                     fontSize: 14,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       actions: <Widget>[
  //         GestureDetector(
  //           onTap: () {
  //             Get.back();
  //           },
  //           child: CupertinoDialogAction(
  //             child: Text(
  //               "Cancel",
  //               style: GoogleFonts.poppins(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w500,
  //                 color: Colors.black,
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget buildImageContainer(String _priceList2, String _priceList,
      double height, double width, bool isPortrait) {
    double containerHeight = isPortrait ? height * 0.2 : height * 0.43;
    double containerWidth = isPortrait ? width * 0.34 : width * 0.18;
    double containerHeight2 = isPortrait ? height * 0.2 : height * 0.4;
    double containerWidth2 = isPortrait ? width * 0.34 : width * 0.24;

    double containerHeight3 = isPortrait ? height * 0.04 : height * 0.08;
    double containerWidth3 = isPortrait ? width : width;

    return Padding(
      padding: EdgeInsets.all(6.0),
      child: PhysicalModel(
        elevation: 12,
        color: Colors.white,
        shadowColor: Colors.black,
        //clipBehavior: Clip.none,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: containerWidth2,
            height: containerHeight2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
              image: DecorationImage(
                image: AssetImage("assets/images/svg_images/ludobackblack.png"
                    // "https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    //"assets/images/svg_images/backgroundddice.jpeg"
                    // "assets/images/backgroundhome2.jpg"
                    ),
                fit: BoxFit.cover,
              ),
              // image: DecorationImage(
              //   image: AssetImage(imagePath),
              //   fit: BoxFit.contain,
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: containerHeight * 0.8,
                    width: containerWidth * 0.99,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/svg_images/rupiesbackground.png"
                            //  "https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                            //"assets/images/svg_images/backgroundddice.jpeg"
                            // "assets/images/backgroundhome2.jpg"
                            ),
                        fit: BoxFit.fill,
                      ),
                      //border: Border.all(color: Colors.white)
                    ),
                    child: Center(
                        child: Text(
                      _priceList,
                      style: GoogleFonts.alata(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ))),
                // Spacer(),
                // Container(
                //     height: containerHeight3 * 0.9,
                //     width: containerWidth3 * 0.2,
                //     decoration: BoxDecoration(
                //         //shape: BoxShape.circle,
                //         color: Colors.black45,
                //         borderRadius: BorderRadius.circular(10),
                //         border: Border.all(color: Colors.white)),
                //     child: Center(
                //         child: Text(
                //       "GO!",
                //       style: GoogleFonts.alata(
                //         fontSize: 13,
                //         fontStyle: FontStyle.italic,
                //         fontWeight: FontWeight.w200,
                //         color: Colors.white,
                //       ),
                //     ))),
                // Spacer(),
                Container(
                    height: containerHeight3,
                    width: containerWidth3,
                    decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        border: Border.all(color: Colors.white)),
                    child: Center(
                        child: Text(
                      "Wining Amount:${_priceList2}",
                      style: GoogleFonts.alata(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    )))
              ],
            ),
            // Optionally, you can add a child widget here if needed
          ),
        ),
      ),
    );
  }
}
