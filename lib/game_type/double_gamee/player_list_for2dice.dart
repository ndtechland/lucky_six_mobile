import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import '../../HomePage/homePage.dart';
import '../../constantt/responsive_container_text.dart';
import '../../controllers_all/create_list_players.dart';
import '../single_dice_game/time_clock_for_game.dart';

class PlayerLists2dice extends StatefulWidget {
  PlayerLists2dice({Key? key}) : super(key: key);
  @override
  _PlayerLists2diceState createState() => _PlayerLists2diceState();
}

class _PlayerLists2diceState extends State<PlayerLists2dice> {
  // final List<String> items = [
  //   'Rakesh',
  //   'Vishal',
  //   'Kartik',
  //   'Shubham',
  //   'Akanksha',
  //   'Madhu'
  // ];

  //final List<String> items2 = ['1', '2', '3', '4', '5', '6'];
  ///
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  // late final List<String> _displayedItems = [];
  List<String> _displayedItems = []; // Change to a growable list

  final AudioPlayer _audioPlayer = AudioPlayer();
  GetUserListController _getUserListController =
      Get.put(GetUserListController());
  // Initialize the audio player

  @override
  void initState() {
    super.initState();
    _addItemsOneByOne();
    _playBackgroundMusic();
    _initializeDisplayedItems();
    // Play the background music
  }

  void _initializeDisplayedItems() {
    _displayedItems = [];

    // _displayedItems = List<String>.filled(
    //   _getUserListController.getuserlistModel!.data!.length,
    //   '', // Default value for each item, can be changed as needed
    // );
  }

  Future<void> _playBackgroundMusic() async {
    await _audioPlayer.setAsset('assets/audios/backroundmusic.mp3');
    _audioPlayer.play();

    // Stop the music after 12 seconds
    Future.delayed(Duration(seconds: 10), () {
      _audioPlayer.stop();
    });
  }

  // Future<void> _addItemsOneByOne() async {
  //   for (int i = 0; i < items.length; i++) {
  //     await Future.delayed(Duration(milliseconds: 500));
  //     _listKey.currentState?.insertItem(i);
  //     _displayedItems.add(items[i]);
  //   }
  // }

  Future<void> _addItemsOneByOne() async {
    if (_getUserListController.getuserlistModel?.data != null &&
        _getUserListController.getuserlistModel!.data!.isNotEmpty) {
      for (int i = 0;
          i < _getUserListController.getuserlistModel!.data!.length;
          i++) {
        await Future.delayed(Duration(milliseconds: 500));
        _listKey.currentState?.insertItem(i);
        _displayedItems.add(
            "${_getUserListController.getuserlistModel!.data![i].fullName}");
      }
    } else {
      // Handle the case where the list is null or empty
      print("The list is empty or null.");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose of the audio player
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Obx(
        () => _getUserListController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Stack(
                  children: [
                    // Background Image
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/svg_images/ludobackwhite.png",
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

                            var imageHeight =
                                orientation == Orientation.portrait
                                    ? screenHeight * 0.2
                                    : screenHeight * 0.4;

                            var categoryWidth =
                                orientation == Orientation.portrait
                                    ? screenWidth * 0.5
                                    : screenWidth * 0.4;
                            var categoryHeight =
                                orientation == Orientation.portrait
                                    ? screenHeight * 0.12
                                    : screenHeight * 0.45;

                            var textfieldWidth2 =
                                orientation == Orientation.portrait
                                    ? screenWidth * 0.84
                                    : screenWidth * 0.87;
                            var textfieldHeight2 =
                                orientation == Orientation.portrait
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
                                Container(
                                  height: imageHeight * 0.3,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                shadowColor: Colors.white,
                                                color: Colors.white,
                                                child: Container(
                                                  height: imageHeight * 0.2,
                                                  width: imageWidth * 0.3,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "500",
                                                      style: GoogleFonts
                                                          .abyssinicaSil(
                                                        fontSize:
                                                            textsize2 * 0.75,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: textfieldHeight2 * 0.1,
                                ),
                                Expanded(
                                  child: AnimatedList(
                                    key: _listKey,
                                    initialItemCount: _getUserListController
                                            .getuserlistModel?.data?.length ??
                                        0
                                    //_displayedItems.length,
                                    ,
                                    itemBuilder: (context, index, animation) {
                                      if (_getUserListController
                                                  .getuserlistModel?.data ==
                                              null ||
                                          _getUserListController
                                              .getuserlistModel!
                                              .data!
                                              .isEmpty) {
                                        return Center(
                                            child:
                                                Text("No players available"));
                                      }
                                      return _buildItem(
                                        _getUserListController.getuserlistModel!
                                            .data![index].fullName
                                            .toString(),
                                        "${index + 1}", // Replace length with index + 1 for incremental numbers

                                        //"${_getUserListController.getuserlistModel!.data!.length}",
                                        animation,
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
      ),
    );
  }

  Widget _buildItem(String item, String item2, Animation<double> animation) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      child: SizeTransition(
        sizeFactor: animation,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20.0,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: responsiveContainer4(
            heightPortrait: MediaQuery.of(context).size.height * 0.11,
            widthPortrait: MediaQuery.of(context).size.width,
            heightLandscape: MediaQuery.of(context).size.height * 0.16,
            widthLandscape: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.095),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item2,
                    style: GoogleFonts.abyssinicaSil(
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.033
                          : MediaQuery.of(context).size.height * 0.05,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    item,
                    style: GoogleFonts.abyssinicaSil(
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.022
                          : MediaQuery.of(context).size.height * 0.05,
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
      ),
    );
  }

  ///
  // Widget _buildHeader(BuildContext context) {
  //   var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  //   var width = isPortrait
  //       ? MediaQuery.of(context).size.width * 0.999
  //       : MediaQuery.of(context).size.width * 0.6;
  //
  //   var height = isPortrait
  //       ? MediaQuery.of(context).size.height * 0.05
  //       : MediaQuery.of(context).size.height * 0.08;
  //
  //   return Container(
  //     color: Colors.red,
  //     width: width,
  //     height: height * 1.2,
  //     child: Row(
  //       children: [
  //         IconButton(
  //           onPressed: () {
  //             _audioPlayer.stop(); // Stop the audio when navigating
  //             Get.back();
  //           },
  //           icon: Icon(
  //             CupertinoIcons.left_chevron,
  //             color: Colors.black,
  //           ),
  //         ),
  //         Text(
  //           'Back',
  //           style: GoogleFonts.abyssinicaSil(
  //             fontSize: isPortrait
  //                 ? MediaQuery.of(context).size.height * 0.022
  //                 : MediaQuery.of(context).size.height * 0.05,
  //             color: Colors.black,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  ///
  ///
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
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black54,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
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
                        _audioPlayer.stop(); // Stop the audio when navigating
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

          ///
          //Spacer(),
          // SizedBox(
          //   width: 19,
          // ),
          ///
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
              child: TimerClockPlayer()),
        ],
      ),
    );
  }
}
