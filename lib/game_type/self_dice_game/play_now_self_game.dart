import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_app/game_type/self_dice_game/play_game_button.dart';
import 'package:game_app/game_type/self_dice_game/timer_audio_selfgame.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constantt/circular_loader/circular_loaderr.dart';
import '../../controllers_all/game_price_list_self_controller.dart';
import '../../controllers_all/get_dice_list_self_controller.dart';
import '../../controllers_all/table_details_controller.dart';
import '../3d_dice/3d_button_for_self_dice.dart';
import '3D_animated_dice_self.dart';
import 'controller_selecteddice_number.dart';
import 'exit_buttom_selfdice.dart';

class PlayNowSelfGame extends StatefulWidget {
  const PlayNowSelfGame({Key? key}) : super(key: key);

  @override
  State<PlayNowSelfGame> createState() => _PlayNowSelfGameState();
}

class _PlayNowSelfGameState extends State<PlayNowSelfGame> {
  int _selectedIndex = -1;
  final SelectedDiceController controller = Get.put(SelectedDiceController());
  GetGamePriceListSelfController _getGamePriceListSelfController =
      Get.put(GetGamePriceListSelfController());
  GetDiceListSelfController _getDiceListSelfController =
      Get.put(GetDiceListSelfController());
  TableDetailsController _tableDetailsController =
      Get.put(TableDetailsController());

  Timer? _startTimer;
  Timer? _stopTimer;

  ///

  final List<String> _imageList = [
    'assets/images/svg_images/dcc1.png',
    'assets/images/svg_images/dcc2.png',
    'assets/images/svg_images/dcc3.png',
    'assets/images/svg_images/dcc4.png',
    'assets/images/svg_images/dcc5.png',
    'assets/images/svg_images/dcc6.png',
  ];

  ///todo:................

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Table dimensions and position
    final tableHeight = screenHeight * 0.88;
    final tableWidth = screenWidth * 0.7;
    final tableTop = screenHeight * 0.11;
    final tableBotom = screenHeight * 0.11;

    final tableLeft = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.black54,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            // top: 10,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ///table.....
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.07,
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                    //bottom: 10,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.88,
                      //double.infinity,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/svg_images/single_table_dice.png",
                              //"assets/images/svg_images/singledice66.png",
                            ),
                            fit: BoxFit.fill),
                      ),
                    )),

                ///arrow_back...
                // Positioned(
                //   top: 30,
                //   right: 01,
                //   //left: 00,
                //   child: Row(
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           //Get.back();
                //         },
                //         child: Container(
                //           height: MediaQuery.of(context).size.height * 0.10,
                //           //width: MediaQuery.of(context).size.width * 0.12,
                //           decoration: BoxDecoration(
                //               // image: DecorationImage(
                //               //     image: AssetImage(
                //               //       "assets/images/svg_images/arrowbackwhite.png"
                //               //       // "assets/images/svg_images/aeeowback.png"
                //               //       ,
                //               //     ),
                //               //     fit: BoxFit.cover)
                //               ),
                //           child: Row(
                //             children: [
                //               Text(
                //                 "Results:",
                //                 style: GoogleFonts.abyssinicaSil(
                //                   fontSize: MediaQuery.of(context).size.height *
                //                       0.040,
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.w900,
                //                 ),
                //               ),
                //               Text(
                //                 "AWAITING",
                //                 style: GoogleFonts.abyssinicaSil(
                //                   fontSize: MediaQuery.of(context).size.height *
                //                       0.040,
                //                   color: Colors.green.shade400,
                //                   fontWeight: FontWeight.w900,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       // SizedBox(
                //       //   width: MediaQuery.of(context).size.width * 0.85,
                //       //   height: MediaQuery.of(context).size.height * 0.27,
                //       // ),
                //       // InkWell(
                //       //   onTap: () {
                //       //     ///todo:comented 3 may ....2024....prince...
                //       //   },
                //       //   child: Container(
                //       //     height: MediaQuery.of(context).size.height * 0.0960,
                //       //     width: MediaQuery.of(context).size.width * 0.0600,
                //       //   ),
                //       // ),
                //     ],
                //   ),
                // ),
                ///result...
                Positioned(
                  top: tableTop +
                      (tableHeight / 5.5) -
                      (screenHeight * 0.3 / 1.71),
                  right: tableLeft +
                      (tableWidth / 9.99) -
                      (screenWidth * 0.21 / 1.8),
                  // top: 30,
                  // right: 45,
                  //left: 00,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //Get.back();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          //width: MediaQuery.of(context).size.width * 0.12,
                          decoration: BoxDecoration(
                              // image: DecorationImage(
                              //     image: AssetImage(
                              //       "assets/images/svg_images/arrowbackwhite.png"
                              //       // "assets/images/svg_images/aeeowback.png"
                              //       ,
                              //     ),
                              //     fit: BoxFit.cover)
                              ),
                          child: Row(
                            children: [
                              Text(
                                "You:",
                                style: GoogleFonts.abyssinicaSil(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.040,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                "Won!",
                                style: GoogleFonts.abyssinicaSil(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.040,
                                  color: Colors.green.shade400,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.85,
                      //   height: MediaQuery.of(context).size.height * 0.27,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     ///todo:comented 3 may ....2024....prince...
                      //   },
                      //   child: Container(
                      //     height: MediaQuery.of(context).size.height * 0.0960,
                      //     width: MediaQuery.of(context).size.width * 0.0600,
                      //   ),
                      // ),
                    ],
                  ),
                ),

                ///todo:timer..audio...
                Positioned(
                  top: 40,
                  right: 550,
                  left: 00,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                    ),
                    child: TimerScreenAudioSelf(),
                  ),
                ),

                ///PlayButton....
                Positioned(
                  top: tableTop +
                      (tableHeight / 5.5) -
                      (screenHeight * 0.3 / 1.8),
                  left: MediaQuery.of(context).size.width * 0.008,
                  right: MediaQuery.of(context).size.width * 0.85,

                  // tableLeft +
                  //     (tableWidth / 19.7) -
                  //     (screenWidth * 0.21 / 5),
                  ///
                  // right: tableLeft +
                  //     (tableWidth / 1.0) -
                  //     (screenWidth * 0.07 / 200),
                  // left: 550,
                  // right: 42,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                    ),
                    child: PlayGameButtonSelf(
                        // onPressed: () {
                        //   print("object");
                        // },
                        ),
                  ),
                ),

                ///todo:play_again button...7 sep 2024..
                Positioned(
                  top: tableTop +
                      (tableHeight / 5.6) -
                      (screenHeight * 0.3 / 1.8),
                  //left: MediaQuery.of(context).size.width * 0.73,
                  right: MediaQuery.of(context).size.width * 0.11,

                  ///right: MediaQuery.of(context).size.width * 0.19,
                  // top: tableTop +
                  //     (tableHeight / 1.02) -
                  //     (screenHeight * 0.3 / 1),
                  // left: tableLeft +
                  //     (tableWidth / 5.3) -
                  //     (screenWidth * 0.21 / 1.2),

                  /// bottom: MediaQuery.of(context).size.width * 0.405,
                  // tableBotom +
                  //     (tableHeight / 3) -
                  //     (screenHeight * 0.21 / 11),
                  // left: 550,
                  // right: 42,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.height * 0.17,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                      //borderRadius: BorderRadius.circular(10),
                    ),
                    child: PlayAgainIconButton3(
                        // onPressed: () {},
                        ),
                  ),
                ),

                ///background rupies image...white...
                Positioned(
                  top: tableTop +
                      (tableHeight / 2) -
                      (screenHeight * 0.3 / 1.71),
                  left: tableLeft + (tableWidth / 2) - (screenWidth * 0.21 / 2),
                  child: Container(
                    height: screenHeight * 0.34,
                    width: screenWidth * 0.404,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/svg_images/rupiesbackground.png"
                            //  "https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                            //"assets/images/svg_images/backgroundddice.jpeg"
                            // "assets/images/backgroundhome2.jpg"
                            ),
                        fit: BoxFit.contain,
                      ),
                      //color: Colors.yellow,
                      // border: Border.all(color: Colors.black),
                    ),
                    // Your dice animation widget
                  ),
                ),

                ///
                // Positioned(
                //   top: tableTop +
                //       (tableHeight / 1.723) -
                //       (screenHeight * 0.323 / 1.84),
                //   left: tableLeft +
                //       (tableWidth / 2) -
                //       (screenWidth * 0.216 / 1.51),
                //   child: Container(
                //     height: screenHeight * 0.196,
                //     width: screenWidth * 0.48,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.white, // Background color to fill corners
                //
                //       //grey.shade200,
                //       // border: Border.all(color: Colors.black),
                //     ),
                //     // Your dice animation widget
                //   ),
                // ),

                ///todo: host..
                // Positioned(
                //   // top: MediaQuery.of(context).size.height * 0.065,
                //   //40
                //   right: MediaQuery.of(context).size.width * 0.31,
                //   //225,
                //   left: MediaQuery.of(context).size.width * 0.31,
                //   //225,
                //   bottom: MediaQuery.of(context).size.height * 0.541,
                //   //211,
                //   child: Container(
                //     //height: MediaQuery.of(context).size.height * 0.30,
                //     width: MediaQuery.of(context).size.width * 0.01,
                //     decoration: BoxDecoration(
                //         //color: Colors.green,
                //         ),
                //     child: ColorFiltered(
                //         colorFilter: ColorFilter.mode(
                //           Colors.green.withOpacity(
                //               0.0), // Change this color to your desired color
                //           BlendMode
                //               .color, // You can change the blend mode to achieve different effects
                //         ),
                //         child: Image.asset(
                //           "assets/images/svg_images/hostt.png",
                //           fit: BoxFit.cover,
                //           // color: Colors.white,
                //         )),
                //   ),
                // ),

                /// 1 no user....
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.109,
                  //right: MediaQuery.of(context).size.width * 0.2765,
                  // top: MediaQuery.of(context).size.height * 0.073,
                  //right: MediaQuery.of(context).size.width * 0.27,
                  left: MediaQuery.of(context).size.width * 0.004,
                  right: MediaQuery.of(context).size.width * 0,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.22,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.060,
                            child: Center(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Prince',
                                  style: GoogleFonts.akshar(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ),

                          ///
                          Container(
                            height: MediaQuery.of(context).size.height * 0.205,
                            width: MediaQuery.of(context).size.width * 0.073,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2015/05/22/18/10/child-779434_1280.jpg"
                                      // "assets/images/person1.png"
                                      ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                ///

                ///todo:timer...
                // Positioned(
                //   top: 40,
                //   right: 550,
                //   left: 00,
                //   child: Container(
                //     height: MediaQuery.of(context).size.height * 0.10,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.rectangle,
                //       color: Colors.transparent,
                //     ),
                //     child: TimerScreen(),
                //   ),
                // ),

                ///todo:available.......coins............
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  right: MediaQuery.of(context).size.width * 0,

                  //left: 550,
                  child:
                      // Column(
                      //                 mainAxisAlignment: MainAxisAlignment.center,
                      //                 crossAxisAlignment: CrossAxisAlignment.center,
                      //                 children: [
                      Container(
                    height: MediaQuery.of(context).size.height * 0.41,
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/svg_images/avalablecoinss.png"
                                // "assets/images/svg_images/coinslogo7.png"
                                ),
                            fit: BoxFit.contain)),
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.087,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Center(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "100000",
                              style: GoogleFonts.abyssinicaSil(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                ///todo:selected  dice number...

                Positioned(
                  top: MediaQuery.of(context).size.height * 0.43,
                  right: MediaQuery.of(context).size.width * 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width * 0.145,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/svg_images/selecteddiceno2.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.096,
                          left: MediaQuery.of(context).size.width * 0.0,
                          right: MediaQuery.of(context).size.width * 0.0,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.09,
                          height: MediaQuery.of(context).size.height * 0.38,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _getDiceListSelfController
                                .diceList?.diceNumvers?.length,
                            // _imageList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 7.5,
                              crossAxisSpacing: 8.2,
                            ),
                            itemBuilder: (context, index) {
                              return Center(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.selectIndex(index);
                                  },
                                  child: Obx(() {
                                    bool isSelected =
                                        controller.selectedIndex.value == index;
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.red.shade300
                                            : Colors.white,
                                        border: Border.all(
                                            color: isSelected
                                                ? Colors.green.shade600
                                                : Colors.white,
                                            width: 3.3),
                                        image: DecorationImage(
                                          image: AssetImage(_imageList[index]),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                ///todo: winning amt...

                ///ExitIconButton
                Positioned(
                  top: tableTop +
                      (tableHeight / 5.5) -
                      (screenHeight * 0.3 / 1.9),
                  // bottom: tableTop +
                  //     (tableHeight / 7.5) -
                  //     (screenHeight * 0.3 / 1.9),
                  // right: tableLeft +
                  //     (tableWidth / 30.5) -
                  //     (screenWidth * 0.21 / 16),
                  left: MediaQuery.of(context).size.width * 0.17,
                  // right: 42,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.085,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                    ),
                    child: ExitIconButtonSelf(
                        // onPressed: () {
                        //   print("object");
                        // },
                        ),
                  ),
                ),

                ///todo: animation...dice..
                Positioned(
                  top: tableTop +
                      (tableHeight / 2.06) -
                      (screenHeight * 0.18 / 1.88),
                  left: tableLeft +
                      (tableWidth / 2) -
                      (screenWidth * 0.11 / 2.06),
                  child: Container(
                    height: screenHeight * 0.21,
                    width: screenWidth * 0.30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffdcdcdc)),
                    child: Dice3DAnimationSelf(), // Your dice animation widget
                  ),
                ),

                ///todo: price_list..

                Positioned(
                  top: MediaQuery.of(context).size.height * 0.18,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.16,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.00,
                        left: MediaQuery.of(context).size.width * 0.0,
                        right: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.058,
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: ListView.builder(
                          itemCount: _getGamePriceListSelfController
                              .getpricelistModel?.getGameAmount!.length,
                          itemBuilder: (context, index) {
                            bool isSelected = _selectedIndex == index;
                            return Obx(
                              () => (_getGamePriceListSelfController
                                      .isLoading.value)
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : _getGamePriceListSelfController
                                              .getpricelistModel
                                              ?.getGameAmount![index]
                                              .gameName ==
                                          null
                                      ? const Center(
                                          child: Text('No Data'),
                                        )
                                      : GestureDetector(
                                          onTap: () async {
                                            CallLoader.loader();
                                            await Future.delayed(
                                                Duration(seconds: 1));
                                            CallLoader.hideLoader();
                                            await _getGamePriceListSelfController
                                                .gamePriceListSelfApi();
                                            _getGamePriceListSelfController
                                                .update();
                                            //_getGamePriceListSelfController.onInit();
                                            Future.delayed(
                                                Duration(seconds: 1));
                                            SharedPreferences sharedPrefs =
                                                await SharedPreferences
                                                    .getInstance();

                                            // Retrieve the gameTypeId from your controller/model
                                            String? gamePriceTypeId =
                                                _getGamePriceListSelfController
                                                    .getpricelistModel
                                                    ?.getGameAmount![index]
                                                    .id
                                                    ?.toString();

                                            if (gamePriceTypeId != null) {
                                              await sharedPrefs.setString(
                                                  'gamePriceTypeId_',
                                                  gamePriceTypeId);

                                              /// Save with consistent key.....
                                              print(
                                                  "Game price Type 2 ID saved: $gamePriceTypeId");
                                            } else {
                                              print(
                                                  "Game price Type ID is null, not saving.");
                                            }

                                            ///todo: upper code .........save price list id....
                                            setState(() {
                                              _selectedIndex = index;
                                            });
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.09,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: isSelected
                                                  ? Colors.red.shade300
                                                  : Colors.black,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/images/svg_images/pricelistwin.png",
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.04,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.038,
                                                  child: Center(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "${_getGamePriceListSelfController.getpricelistModel?.getGameAmount![index].gameAmt}",
                                                        style: GoogleFonts
                                                            .abyssinicaSil(
                                                          color: Colors
                                                              .red.shade900,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.030,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.033,
                                                  child: Center(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Win:",
                                                        style: GoogleFonts
                                                            .abyssinicaSil(
                                                          color: Colors
                                                              .green.shade900,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.03,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.04,
                                                  child: Center(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${_getGamePriceListSelfController.getpricelistModel?.getGameAmount![index].winingAmt}",
                                                        style: GoogleFonts
                                                            .abyssinicaSil(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.033,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    '',
                                                    style: GoogleFonts
                                                        .abyssinicaSil(
                                                      color: Colors.black,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.035,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                ///todo: price_list text........

                Positioned(
                  top: MediaQuery.of(context).size.height * 0.22,
                  //left: MediaQuery.of(context).size.width * 0,
                  child: Text(
                    "  Price List:",
                    style: GoogleFonts.abyssinicaSil(
                      color: Colors.yellow,
                      fontSize: MediaQuery.of(context).size.height * 0.035,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                ///todo: message... comented 22 may 2024..
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///device orientation.....only horizontal not vertical...
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _startTimer?.cancel();
    _stopTimer?.cancel();
    // _audioPlayer.dispose();
    super.dispose();
  }
}
