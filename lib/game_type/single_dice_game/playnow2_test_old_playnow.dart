import 'dart:async';

//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../animation/time_animation_common.dart';
import 'dice_animation1.dart';

class Play_Now_new_old extends StatefulWidget {
  const Play_Now_new_old({Key? key}) : super(key: key);

  @override
  State<Play_Now_new_old> createState() => _Play_Now_new_oldState();
}

class _Play_Now_new_oldState extends State<Play_Now_new_old> {
  //late AudioPlayer _audioPlayer;
  Timer? _startTimer;
  Timer? _stopTimer;

  ///todo:................
  // String nextposition = '';
  //String lastposition = '';

  @override
  Widget build(BuildContext context) {
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
                    top: MediaQuery.of(context).size.height * 0.11,
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
                              "assets/images/svg_images/singledice66.png",
                            ),
                            fit: BoxFit.fill),
                      ),
                    )),

                ///arrow_back...
                Positioned(
                  top: 30,
                  right: 01,
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
                                "Results:",
                                style: GoogleFonts.abyssinicaSil(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.040,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                "AWAITING",
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
                ///todo: animation...dice..
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.457,
                  right: MediaQuery.of(context).size.width * 0.37,
                  //327.5,
                  left: MediaQuery.of(context).size.width * 0.358,
                  //320.5,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(20),
                      //color: Colors.red,
                    ),

                    ///todo: dice animation.
                    child: DiceAnimation(),
                  ),
                ),

                /// 1 no user....
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.0833,
                  //right: MediaQuery.of(context).size.width * 0.2765,
                  // top: MediaQuery.of(context).size.height * 0.073,
                  //right: MediaQuery.of(context).size.width * 0.27,
                  left: MediaQuery.of(context).size.width * 0.2765,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width * 0.22,
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.21,
                            width: MediaQuery.of(context).size.width * 0.07,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.043,
                            width: MediaQuery.of(context).size.width * 0.060,
                            child: Center(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Kartik',
                                  style: GoogleFonts.akshar(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// 6 no user....
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.0833,
                  right: MediaQuery.of(context).size.width * 0.2765,
                  //  left: MediaQuery.of(context).size.width * 0.333,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    child: Row(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.043,
                          width: MediaQuery.of(context).size.width * 0.060,
                          child: Center(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Shubham',
                                style: GoogleFonts.akshar(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.21,
                          width: MediaQuery.of(context).size.width * 0.07,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2016/07/10/17/54/kid-1508121_1280.jpg"
                                    // "assets/images/person1.png"
                                    ),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),

                /// 2 no user....
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.408,
                  //right: MediaQuery.of(context).size.width * 0.2765,
                  // top: MediaQuery.of(context).size.height * 0.073,
                  //right: MediaQuery.of(context).size.width * 0.27,
                  left: MediaQuery.of(context).size.width * 0.141,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width * 0.22,
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.21,
                            width: MediaQuery.of(context).size.width * 0.07,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2019/09/03/01/51/child-4448370_1280.jpg"
                                      // "assets/images/person1.png"
                                      ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.043,
                            width: MediaQuery.of(context).size.width * 0.060,
                            child: Center(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Rakesh',
                                  style: GoogleFonts.akshar(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// 5 no user....
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.408,
                  right: MediaQuery.of(context).size.width * 0.1446,
                  //  left: MediaQuery.of(context).size.width * 0.333,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    child: Row(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.043,
                          width: MediaQuery.of(context).size.width * 0.060,
                          child: Center(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Vishal',
                                style: GoogleFonts.akshar(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.21,
                          width: MediaQuery.of(context).size.width * 0.07,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2016/07/10/17/54/kid-1508121_1280.jpg"

                                    // "https://cdn.pixabay.com/photo/2016/07/10/17/54/kid-1508121_1280.jpg"
                                    // "assets/images/person1.png"
                                    ),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),

                /// 3 no user....
                Positioned(
                  // top: MediaQuery.of(context).size.height * 0.0833,
                  top: MediaQuery.of(context).size.height * 0.777,
                  left: MediaQuery.of(context).size.width * 0.2765,
                  //right: MediaQuery.of(context).size.width * 0.2765,
                  // top: MediaQuery.of(context).size.height * 0.073,
                  //right: MediaQuery.of(context).size.width * 0.27,
                  // left: MediaQuery.of(context).size.width * 0.2765,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width * 0.22,
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.21,
                            width: MediaQuery.of(context).size.width * 0.07,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_1280.jpg"
                                      // "assets/images/person1.png"
                                      ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.043,
                            width: MediaQuery.of(context).size.width * 0.060,
                            child: Center(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Madhu',
                                  style: GoogleFonts.akshar(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// 4 no user....
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.777,
                  right: MediaQuery.of(context).size.width * 0.2765,
                  //  left: MediaQuery.of(context).size.width * 0.333,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    child: Row(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.043,
                          width: MediaQuery.of(context).size.width * 0.060,
                          child: Center(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Akanksha',
                                style: GoogleFonts.akshar(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.21,
                          width: MediaQuery.of(context).size.width * 0.07,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2016/10/14/22/31/cute-1741376_1280.jpg"
                                    // "assets/images/person1.png"
                                    ),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),

                ///todo:timer...
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
                    child: TimerScreen(),
                  ),
                ),

                ///todo:available coins...
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.2,
                  right: MediaQuery.of(context).size.width * 0,
                  //left: 550,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text(
                      //   "Available",
                      //   style: GoogleFonts.abyssinicaSil(
                      //       color: Colors.white,
                      //       fontSize:
                      //           MediaQuery.of(context).size.height * 0.039,
                      //       fontWeight: FontWeight.w700,
                      //       letterSpacing: 1),
                      //   maxLines: 2,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.21,
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/svg_images/coinslogo7.png"),
                                fit: BoxFit.fill)),
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
                                        MediaQuery.of(context).size.height *
                                            0.045,
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
                      Text(
                        "Coins",
                        style: GoogleFonts.abyssinicaSil(
                            color: Colors.yellow,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.039,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                ///todo:selected  dice number...

                Positioned(
                  top: MediaQuery.of(context).size.height * 0.5,
                  right: MediaQuery.of(context).size.width * 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 0.13,
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
                              top: MediaQuery.of(context).size.height *
                                  0.03, // Adjust top padding
                              left: MediaQuery.of(context).size.width * 0.026,
                              right: MediaQuery.of(context).size.width * 0.026,
                              // bottom: MediaQuery.of(context).size.height * 0.01,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.058,
                              height: MediaQuery.of(context).size.height * 0.30,
                              child: GridView.builder(
                                physics:
                                    NeverScrollableScrollPhysics(), // Prevent scrolling
                                itemCount: 6,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 4.0,
                                  crossAxisSpacing: 7.0,
                                ),
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      width: MediaQuery.of(context).size.width *
                                          0.055,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${index + 1}',
                                          style: GoogleFonts.abyssinicaSil(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.035,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                      Text(
                        "Dice No.",
                        style: GoogleFonts.abyssinicaSil(
                          color: Colors.yellow,
                          fontSize: MediaQuery.of(context).size.height * 0.039,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                ///todo: beeting amt...
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.22,
                  left: MediaQuery.of(context).size.width * 0.01,
                  //left: 550,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text(
                      //   "Available",
                      //   style: GoogleFonts.abyssinicaSil(
                      //       color: Colors.white,
                      //       fontSize:
                      //           MediaQuery.of(context).size.height * 0.039,
                      //       fontWeight: FontWeight.w700,
                      //       letterSpacing: 1),
                      //   maxLines: 2,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.22,
                        width: MediaQuery.of(context).size.width * 0.11,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            // shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/svg_images/widcoin.png"
                                    // "assets/images/svg_images/bettinamt.png"
                                    ),
                                fit: BoxFit.fill)),
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.14,
                            height: MediaQuery.of(context).size.height * 0.12,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "5000",
                                style: GoogleFonts.abyssinicaSil(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.042,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "BID",
                        style: GoogleFonts.abyssinicaSil(
                            color: Colors.yellow,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.039,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                //assets/images/svg_images/crownwin.png
                ///todo:crown win...
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.width * 0.02,
                  //left: 550,
                  child:
                      // Text(
                      //   "Available",
                      //   style: GoogleFonts.abyssinicaSil(
                      //       color: Colors.white,
                      //       fontSize:
                      //           MediaQuery.of(context).size.height * 0.039,
                      //       fontWeight: FontWeight.w700,
                      //       letterSpacing: 1),
                      //   maxLines: 2,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                      Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/svg_images/crownwin.png"),
                            fit: BoxFit.fill)),
                  ),
                ),

                ///todo: winning amt...
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.07,
                  //left: MediaQuery.of(context).size.width * -0.005,
                  //left: 550,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text(
                      //   "Available",
                      //   style: GoogleFonts.abyssinicaSil(
                      //       color: Colors.white,
                      //       fontSize:
                      //           MediaQuery.of(context).size.height * 0.039,
                      //       fontWeight: FontWeight.w700,
                      //       letterSpacing: 1),
                      //   maxLines: 2,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.28,
                        width: MediaQuery.of(context).size.width * 0.14,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            // shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/svg_images/wincoin.png"),
                                fit: BoxFit.fill)),
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.14,
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.013,
                                ),
                                child: Text(
                                  "10000",
                                  style: GoogleFonts.abyssinicaSil(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.045,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "WIN",
                        style: GoogleFonts.abyssinicaSil(
                            color: Colors.yellow,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.039,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
