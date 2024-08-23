import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_app/constantt/color_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constantt/circular_loader/circular_loaderr.dart';
import '../contact_us_suppport_page/support_page.dart';
import '../controllers_all/game_price_list_controller.dart';
import '../controllers_all/game_price_list_double_controller.dart';
import '../controllers_all/game_price_list_self_controller.dart';
import '../controllers_all/game_type_get_controller.dart';
import '../controllers_all/get_profile_controller.dart';
import '../earn_money/earn_money_page.dart';
import '../profiles/profile_user.dart';
import '../settingss/settings_page.dart';
import '../suggessions_pages/sugession_pagesss.dart';
import '../wallet_pages/walet_user/wallet_user.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  ///todo: how can i suggest screen hover....
  bool _showSuggestion = false;

  GetGameTypeController _gameTypeController = Get.put(GetGameTypeController());

  GetGamePriceListController _getGamePriceListController =
      Get.put(GetGamePriceListController());

  //GetWelletController _getWelletController = Get.put(GetWelletController());

  GetGamePriceListDoubleController _gamePriceListDoubleController =
      Get.put(GetGamePriceListDoubleController());

  GetGamePriceListSelfController _getGamePriceListSelfController =
      Get.put(GetGamePriceListSelfController());

  @override
  void initState() {
    super.initState();
    _checkIfFirstTimeUser();
  }

  Future<void> _checkIfFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenSuggestion = prefs.getBool('hasSeenSuggestion') ?? false;

    if (!hasSeenSuggestion) {
      setState(() {
        _showSuggestion = true;
      });
    }
  }

  Future<void> _markSuggestionAsSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenSuggestion', true);
    setState(() {
      _showSuggestion = false;
    });
  }

  final List<String> imagePaths = [
    //"assets/images/svg_images/playnow.gif",
    "assets/images/svg_images/11.gif",
    "assets/images/svg_images/2.gif",
    "assets/images/svg_images/3.gif",
    "assets/images/svg_images/4444.gif",
    "assets/images/svg_images/5.gif",
    "assets/images/svg_images/6.gif",
  ];

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/svg_images/ludobackblack.png"
                    //"assets/images/svg_images/backgroundddice.jpeg"
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
                  SizedBox(
                    height: isPortrait ? height * 0.02 : height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            //Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).viewInsets.top + 4,
                            left: MediaQuery.of(context).viewInsets.left +
                                (isPortrait ? 80 : 280),
                            right: MediaQuery.of(context).viewInsets.left +
                                (isPortrait ? 100 : 280),
                          ),
                          child: PhysicalModel(
                            color: appColor2,
                            clipBehavior: Clip.none,
                            borderRadius: BorderRadius.circular(12),
                            elevation: 10,
                            shadowColor: Colors.white,
                            child: Container(
                              height:
                                  isPortrait ? height * 0.15 : height * 0.277,
                              width: isPortrait ? width * 0.05 : width * 0.04,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/svg_images/play_store_512.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: isPortrait ? height * 0.02 : height * 0.01,
                  ),
                  Expanded(
                    child: isPortrait
                        ? GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: imagePaths.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  navigateToScreen(index);
                                },
                                child: buildImageContainer(imagePaths[index],
                                    height, width, isPortrait),
                              );
                            },
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: imagePaths.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0
                                        ? width * 0.0400
                                        : width * 0.0300),
                                child: GestureDetector(
                                  onTap: () {
                                    navigateToScreen(index);
                                  },
                                  child: buildImageContainer(imagePaths[index],
                                      height, width, isPortrait),
                                ),
                              );
                            },
                          ),
                  ),
                  SizedBox(
                    height: isPortrait ? height * 0.0450 : height * 0.02,
                  ),
                ],
              ),
            ),
          ),

          ///todo: suggessionss.....hover.....
          if (_showSuggestion)
            SuggestionOverlay(onFinish: _markSuggestionAsSeen),
        ],
      ),
    );
  }

  Future<void> navigateToScreen(int index) async {
    UserProfilesController _userProfilesController =
        Get.put(UserProfilesController());
    switch (index) {
      case 0:
        showCustomGameDialog(context);

        ///

        break;
      case 1:
        //_getWelletController.userwalletgetApi();
        Future.delayed(Duration(milliseconds: 100));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WolletUser(),
          ),
        );
        break;
      case 2:
        await _userProfilesController.userprofileApi();
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profileuserr(),
          ),
        );
        //Profile
        // Navigate to chips bank page
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Settingsss(),
          ),
        );

        //Settingsss
        // Navigate to tournament page
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EarnMoney(),
          ),
        );
        //EarnMoney
        // Navigate to another page or perform another action
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SupportPageComman(),
          ),
        );
        //SupportPageComman
        // Navigate to another page or perform another action
        break;
      default:
        break;
    }
  }

  Widget buildImageContainer(
      String imagePath, double height, double width, bool isPortrait) {
    double containerHeight = isPortrait ? height * 0.2 : height * 0.4;
    double containerWidth = isPortrait ? width * 0.34 : width * 0.24;

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: PhysicalModel(
        elevation: 12,
        color: Colors.white,
        shadowColor: Colors.black,
        //clipBehavior: Clip.none,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.contain,
              ),
            ),
            // Optionally, you can add a child widget here if needed
          ),
        ),
      ),
    );
  }

  ///void show dilog box for game type...
  //
  // void showCustomGameDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20.0),
  //         ),
  //         backgroundColor: Colors.transparent,
  //         child: Container(
  //           padding: EdgeInsets.all(16.0),
  //           decoration: BoxDecoration(
  //             gradient: LinearGradient(
  //               colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade600],
  //               begin: Alignment.topLeft,
  //               end: Alignment.bottomRight,
  //             ),
  //             borderRadius: BorderRadius.circular(20.0),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black54,
  //                 blurRadius: 10.0,
  //                 offset: Offset(0, 10),
  //               ),
  //             ],
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               GestureDetector(
  //                 onTap: () {
  //                   // Get.to(Loadingone());
  //                 },
  //                 child: Container(
  //                   width: double.infinity,
  //                   decoration: BoxDecoration(
  //                     color: Colors.blue.shade900,
  //                     borderRadius: BorderRadius.circular(10.0),
  //                   ),
  //                   padding: EdgeInsets.all(12.0),
  //                   child: Text(
  //                     "SELECT GAME TYPE!",
  //                     style: GoogleFonts.roboto(
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                       fontSize: 18,
  //                     ),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 20),
  //               _buildGameOption(
  //                 context,
  //                 "Single Dice Game",
  //                 [Colors.red.shade900, Colors.red.shade400],
  //                 PriceListss(),
  //               ),
  //               SizedBox(height: 20),
  //               _buildGameOption(
  //                 context,
  //                 "Double Dice Game",
  //                 [Colors.black54, Colors.black87],
  //                 PriceListssfortwodice(),
  //               ),
  //               SizedBox(height: 20),
  //               _buildGameOption(
  //                 context,
  //                 "Self Dice Game",
  //                 [Colors.green.shade900, Colors.green.shade400],
  //                 PriceListssSelfdice(),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  //
  // Widget _buildGameOption(
  //   BuildContext context,
  //   String title,
  //   List<Color> gradientColors,
  //   Widget navigationTarget,
  // ) {
  //   return GestureDetector(
  //     onTap: () {
  //       Get.back();
  //       Get.to(navigationTarget);
  //     },
  //
  //     ///todo:....
  //     child: Container(
  //       width: double.infinity,
  //       decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //           colors: gradientColors,
  //           begin: Alignment.topLeft,
  //           end: Alignment.bottomRight,
  //         ),
  //         borderRadius: BorderRadius.circular(15.0),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black26,
  //             offset: Offset(0, 4),
  //             blurRadius: 5.0,
  //           ),
  //         ],
  //       ),
  //       padding: EdgeInsets.all(16.0),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             title,
  //             style: GoogleFonts.roboto(
  //               fontWeight: FontWeight.bold,
  //               color: Colors.white,
  //               fontSize: 16,
  //             ),
  //           ),
  //           Icon(Icons.arrow_forward, color: Colors.white),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  ///
  void showCustomGameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        final dialogSize =
            screenWidth < screenHeight ? screenWidth * 0.8 : screenHeight * 0.8;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: dialogSize,
            height: dialogSize,
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10.0,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.to(Loadingone());
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "SELECT GAME TYPE!",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                //SizedBox(height: 09),
                Spacer(),
                SizedBox(
                  width: dialogSize * 0.9,
                  height: dialogSize * 0.65,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          _gameTypeController.gametypeModel?.getGames?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
                            Get.back();
                            if (index == 0) {
                              CallLoader.loader();
                              await Future.delayed(Duration(seconds: 1));

                              CallLoader.hideLoader();

                              _getGamePriceListController.gamePriceListApi(
                                  gameTypeId: _gameTypeController
                                      .gametypeModel?.getGames?[index].id
                                      .toString());
                            } else if (index == 1) {
                              CallLoader.loader();
                              await Future.delayed(Duration(seconds: 1));
                              CallLoader.hideLoader();

                              _gamePriceListDoubleController
                                  .gamePriceListDoubleApi(
                                      gameTypeId: _gameTypeController
                                          .gametypeModel?.getGames?[index].id
                                          .toString());
                            } else if (index == 2) {
                              CallLoader.loader();
                              await Future.delayed(Duration(seconds: 1));
                              CallLoader.hideLoader();
                              _getGamePriceListSelfController
                                  .gamePriceListSelfApi(
                                      gameTypeId: _gameTypeController
                                          .gametypeModel?.getGames?[index].id
                                          .toString());
                              //_getGamePriceListSelfController
                              //await Get.to(Play_Now_self_game());
                            }
                            // Get.to(navigationTarget);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 5.5),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.red.shade300, Colors.black45],
                                  //gradientColors,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(18.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(
                                    () => (_gameTypeController.isLoading.value)
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : _gameTypeController
                                                    .gametypeModel!
                                                    .getGames![index]
                                                    .gameName ==
                                                null
                                            ? const Center(
                                                child: Text('No Data'),
                                              )
                                            : Text(
                                                _gameTypeController
                                                    .gametypeModel!
                                                    .getGames![index]
                                                    .gameName
                                                    .toString(),
                                                style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                  ),
                                  Icon(Icons.arrow_forward,
                                      color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                // Reduced spacing
                // _buildGameOption(
                //   context,
                //   "${_gameTypeController.gametypeModel?.getGames![0].id}",
                //   //"Single Dice Game",
                //   [Colors.red.shade900, Colors.red.shade400],
                //   PriceListss(),
                // ),
                ///
                SizedBox(height: 15), // Reduced spacing
                // _buildGameOption(
                //   context,
                //   "Double Dice Game",
                //   [Colors.black54, Colors.black87],
                //   PriceListssfortwodice(),
                // ),
                ///
                // SizedBox(height: 15), // Reduced spacing
                // _buildGameOption(
                //   context,
                //   "Self Dice Game",
                //   [Colors.green.shade900, Colors.green.shade400],
                //   Play_Now_self_game(),
                //
                //   ///PriceListssSelfdice(),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGameOption(
    BuildContext context,
    String title,
    List<Color> gradientColors,
    Widget navigationTarget,
  ) {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.to(navigationTarget);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 5.0,
            ),
          ],
        ),
        padding: EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  ///
  // void showCustomGameDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => CupertinoAlertDialog(
  //       title: GestureDetector(
  //         onTap: () {
  //           // Get.to(Loadingone());
  //         },
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
  //             textAlign: TextAlign.center,
  //           ),
  //         ),
  //       ),
  //       content: Padding(
  //         padding: EdgeInsets.only(top: 20),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             GestureDetector(
  //               onTap: () {
  //                 Get.back();
  //                 Get.to(PriceListss());
  //               },
  //               child: Container(
  //                 width: double.infinity,
  //                 decoration: BoxDecoration(
  //                   gradient: LinearGradient(
  //                     colors: [Colors.red.shade900, Colors.red.shade400],
  //                     begin: Alignment.topLeft,
  //                     end: Alignment.bottomRight,
  //                   ),
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black26,
  //                       offset: Offset(0, 4),
  //                       blurRadius: 5.0,
  //                     ),
  //                   ],
  //                 ),
  //                 padding: EdgeInsets.all(16.0),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       "Single Dice Game",
  //                       style: GoogleFonts.poppins(
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.white,
  //                         fontSize: 14,
  //                       ),
  //                     ),
  //                     Icon(Icons.arrow_forward, color: Colors.white),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //             GestureDetector(
  //               onTap: () {
  //                 Get.back();
  //                 Get.to(PriceListssfortwodice());
  //               },
  //               child: Container(
  //                 width: double.infinity,
  //                 decoration: BoxDecoration(
  //                   gradient: LinearGradient(
  //                     colors: [Colors.black54, Colors.black87],
  //                     begin: Alignment.topLeft,
  //                     end: Alignment.bottomRight,
  //                   ),
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black26,
  //                       offset: Offset(0, 4),
  //                       blurRadius: 5.0,
  //                     ),
  //                   ],
  //                 ),
  //                 padding: EdgeInsets.all(16.0),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       "Double Dice Game",
  //                       style: GoogleFonts.poppins(
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.white,
  //                         fontSize: 14,
  //                       ),
  //                     ),
  //                     Icon(Icons.arrow_forward, color: Colors.white),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //             GestureDetector(
  //               onTap: () {
  //                 Get.back();
  //                 Get.to(PriceListssSelfdice());
  //               },
  //               child: Container(
  //                 width: double.infinity,
  //                 decoration: BoxDecoration(
  //                   gradient: LinearGradient(
  //                     colors: [Colors.green.shade900, Colors.green.shade400],
  //                     begin: Alignment.topLeft,
  //                     end: Alignment.bottomRight,
  //                   ),
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black26,
  //                       offset: Offset(0, 4),
  //                       blurRadius: 5.0,
  //                     ),
  //                   ],
  //                 ),
  //                 padding: EdgeInsets.all(16.0),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       "Self Dice Game",
  //                       style: GoogleFonts.poppins(
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.white,
  //                         fontSize: 14,
  //                       ),
  //                     ),
  //                     Icon(Icons.arrow_forward, color: Colors.white),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       // actions: <Widget>[
  //       //   GestureDetector(
  //       //       onTap: () {
  //       //         Get.back();
  //       //       },
  //       //       child: Align(
  //       //         alignment: Alignment.center,
  //       //         child: Text(
  //       //           "Cancel",
  //       //           style: GoogleFonts.abyssinicaSil(
  //       //             fontSize: 20,
  //       //           ),
  //       //         ),
  //       //       )
  //       //       // Container(
  //       //       //   margin: EdgeInsets.only(bottom: 8.0),
  //       //       //   decoration: BoxDecoration(
  //       //       //     gradient: LinearGradient(
  //       //       //       colors: [Colors.grey.shade800, Colors.grey.shade600],
  //       //       //       begin: Alignment.topLeft,
  //       //       //       end: Alignment.bottomRight,
  //       //       //     ),
  //       //       //     borderRadius: BorderRadius.circular(10.0),
  //       //       //     boxShadow: [
  //       //       //       BoxShadow(
  //       //       //         color: Colors.black26,
  //       //       //         offset: Offset(0, 4),
  //       //       //         blurRadius: 5.0,
  //       //       //       ),
  //       //       //     ],
  //       //       //   ),
  //       //       //   padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
  //       //       //   child: Text(
  //       //       //     "Cancel",
  //       //       //     style: GoogleFonts.poppins(
  //       //       //       fontSize: 14,
  //       //       //       fontWeight: FontWeight.w500,
  //       //       //       color: Colors.white,
  //       //       //     ),
  //       //       //   ),
  //       //       // ),
  //       //       )
  //       // ],
  //     ),
  //   );
  // }
}
