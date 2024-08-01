import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_app/HomePage/homePage.dart';
import 'package:game_app/game_type/double_gamee/timer_clock_for2d.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constantt/responsive_container_text.dart';

class PlayerLists2dice extends StatelessWidget {
  PlayerLists2dice({Key? key}) : super(key: key);
  //GetProfileModel? getprofileModel;

  // Define a list of items
  final List<String> items = [
    'Rakesh',
    'Vishal',
    'Kartik',
    'Shubham',
    'Akanksha',
    'Madhu'
  ];

  final List<String> items2 = ['1', '2', '3', '4', '5', '6'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                "assets/images/svg_images/ludobackwhite.png",
                // 'assets/images/svg_images/backgroundddice.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            OrientationBuilder(
              builder: (context, orientation) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    var screenWidth = constraints.maxWidth;
                    var screenHeight = constraints.maxHeight;

                    var imageWidth = orientation == Orientation.portrait
                        ? screenWidth * 0.55
                        : screenWidth * 0.3;

                    var imageHeight = orientation == Orientation.portrait
                        ? screenHeight * 0.2
                        : screenHeight * 0.4;

                    var categoryWidth = orientation == Orientation.portrait
                        ? screenWidth * 0.5
                        : screenWidth * 0.4;
                    var categoryHeight = orientation == Orientation.portrait
                        ? screenHeight * 0.12
                        : screenHeight * 0.45;

                    var textfieldWidth2 = orientation == Orientation.portrait
                        ? screenWidth * 0.84
                        : screenWidth * 0.87;
                    var textfieldHeight2 = orientation == Orientation.portrait
                        ? screenHeight * 0.15
                        : screenHeight * 0.03;

                    var textsize = orientation == Orientation.portrait
                        ? screenHeight * 0.022
                        : screenHeight * 0.05;
                    var textsize2 = orientation == Orientation.portrait
                        ? screenHeight * 0.033
                        : screenHeight * 0.05;
                    return Column(
                      children: [
                        SizedBox(
                          height: 0,
                        ),
                        _buildHeader(context),
                        // SizedBox(
                        //   height: textfieldHeight2 * 0.0,
                        // ),
                        Container(
                          height: imageHeight * 0.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Player's List",
                                    style: GoogleFonts.abyssinicaSil(
                                      fontSize: textsize2 * 0.8,
                                      color: Colors.red.shade500,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Avl Coins:",
                                      style: GoogleFonts.abyssinicaSil(
                                        fontSize: textsize2 * 0.6,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(10),
                                        shadowColor: Colors.white,
                                        color: Colors.white,
                                        child: Container(
                                          height: imageHeight * 0.2,
                                          width: imageWidth * 0.3,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "500",
                                              style: GoogleFonts.abyssinicaSil(
                                                fontSize: textsize2 * 0.75,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Expanded(
                                //   child: TimerClockPlayer(),
                                //   // Text(
                                //   //   "Players List",
                                //   //   style: GoogleFonts.abyssinicaSil(
                                //   //     fontSize: textsize2 * 0.8,
                                //   //     color: Colors.black,
                                //   //     fontWeight: FontWeight.w900,
                                //   //   ),
                                //   // ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: textfieldHeight2 * 0.1,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 04, horizontal: 0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 12),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 3),
                                  decoration: BoxDecoration(
                                    // color: Colors.grey.shade900,
                                    // border: Border.all(
                                    //     color: Colors.red.shade300, width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20.0,
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: responsiveContainer4(
                                    heightPortrait:
                                        MediaQuery.of(context).size.height *
                                            0.11,
                                    widthPortrait:
                                        MediaQuery.of(context).size.width,
                                    heightLandscape:
                                        MediaQuery.of(context).size.height *
                                            0.16,
                                    widthLandscape:
                                        MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.095),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            items2[index],
                                            style: GoogleFonts.abyssinicaSil(
                                              fontSize: textsize2,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Text(
                                            items[index],
                                            style: GoogleFonts.abyssinicaSil(
                                              fontSize: textsize,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    context: context,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var width = isPortrait
        ? MediaQuery.of(context).size.width * 0.999
        : MediaQuery.of(context).size.width * 0.6;

    var height = isPortrait
        ? MediaQuery.of(context).size.height * 0.2
        : MediaQuery.of(context).size.height * 0.4;
    var fontheight = isPortrait
        ? MediaQuery.of(context).size.height * 0.21
        : MediaQuery.of(context).size.height * 0.5;
    return Container(
      //padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black54,
        // image: DecorationImage(
        //     image: AssetImage(
        //       "assets/images/svg_images/ludobackblack.png",
        //     ),
        //     fit: BoxFit.cover)

        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: <Color>[appColor, appColor2],
        // ),
      ),
      child:
          //const SizedBox(height: 1),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     IconButton(
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //       icon: const Icon(Icons.arrow_back, color: Colors.white),
          //     ),
          //     Center(
          //       child: Padding(
          //         padding: const EdgeInsets.all(0.0),
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color: Colors.red.shade700,
          //             borderRadius: BorderRadius.circular(5),
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.all(5.0),
          //             child: Text(
          //               'All Players',
          //               style: GoogleFonts.abyssinicaSil(
          //                 color: Colors.white,
          //                 //backgroundColor: Colors.white,
          //                 fontWeight: FontWeight.w600,
          //                 // fontFamily: 'medium',
          //                 fontSize: 16,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Center(
          //       child: Padding(
          //         padding: const EdgeInsets.all(0.0),
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color: Colors.red.shade700,
          //             borderRadius: BorderRadius.circular(5),
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.all(5.0),
          //             child: Text(
          //               'All Players',
          //               style: GoogleFonts.abyssinicaSil(
          //                 color: Colors.white,
          //                 //backgroundColor: Colors.white,
          //                 fontWeight: FontWeight.w600,
          //                 // fontFamily: 'medium',
          //                 fontSize: 16,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     //const SizedBox(width: 50),
          //   ],
          // ),
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              //Navigator.pop(context);
              showDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.all(10.0),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "If you will exit we will refund your amount to your Wallet.",
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
                        "Stay",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {
                        Get.back();
                        Get.offAll(Home_Page());

                        // Navigate to a new screen when the OK button is pressed
                        // Get.to(SomeOtherScreen()); // Replace SomeOtherScreen with your desired screen
                      },
                      child: Text(
                        "Exit",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: Container(
              height: height * 0.40,
              width: width * 0.53,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Text(
                "Exit",
                style: GoogleFonts.abyssinicaSil(
                  fontSize: fontheight * 0.09,
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              )),

              ///Icon(Icons.arrow_back, color: Colors.white)
            ),
          ),
          //Spacer(),
          // SizedBox(
          //   width: 19,
          // ),
          ClipOval(
            child: responsiveContainer(
              heightPortrait: MediaQuery.of(context).size.height * 0.11,
              widthPortrait: MediaQuery.of(context).size.width * 0.23,
              heightLandscape: MediaQuery.of(context).size.height * 0.20,
              widthLandscape: MediaQuery.of(context).size.width * 0.10,
              child: Image.asset(
                'assets/images/svg_images/play_store_512.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/svg_images/play_store_512.png',
                    fit: BoxFit.cover,
                  );
                },
              ),
              context: context,
            ),
          ),

          //Spacer(),
          Container(
              height: height * 0.55,
              width: width * 0.15,
              child: TimerClockPlayer2dice()),
          //Spacer(),

          // Container(
          //     height: height * 0.45,
          //     width: width * 0.18,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       // color: Colors.black,
          //       image: DecorationImage(
          //         image: AssetImage(
          //             "assets/images/svg_images/rupiesbackground.png"
          //             //  "https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          //             //"assets/images/svg_images/backgroundddice.jpeg"
          //             // "assets/images/backgroundhome2.jpg"
          //             ),
          //         fit: BoxFit.fill,
          //       ),
          //       //border: Border.all(color: Colors.white)
          //     ),
          //     child: Center(
          //         child: Text(
          //       "   Bal:\n30099",
          //       style: GoogleFonts.alata(
          //         fontSize: fontheight * 0.055,
          //         //fontStyle: FontStyle.italic,
          //         fontWeight: FontWeight.w800,
          //         color: Colors.white,
          //       ),
          //     )))
          // ClipOval(
          //   child: responsiveContainer(
          //     heightPortrait: MediaQuery.of(context).size.height * 0.12,
          //     widthPortrait: MediaQuery.of(context).size.width * 0.25,
          //     heightLandscape: MediaQuery.of(context).size.height * 0.20,
          //     widthLandscape: MediaQuery.of(context).size.width * 0.10,
          //     child: Image.asset(
          //       'assets/images/svg_images/play_store_512.png',
          //       fit: BoxFit.cover,
          //       errorBuilder: (context, error, stackTrace) {
          //         return Image.asset(
          //           'assets/images/svg_images/play_store_512.png',
          //           fit: BoxFit.cover,
          //         );
          //       },
          //     ),
          //     context: context,
          //   ),
          // ),
        ],
      ),
    );
  }
}
