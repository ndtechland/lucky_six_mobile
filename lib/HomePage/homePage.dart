import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_app/constantt/color_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../contact_us_suppport_page/support_page.dart';
import '../earn_money/earn_money_page.dart';
import '../price_listts/price_listfor_twodice.dart';
import '../price_listts/price_listtss.dart';
import '../profiles/profile_user.dart';
import '../settingss/settings_page.dart';
import '../wallet_pages/walet_user/wallet_user.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final List<String> imagePaths = [
    //"assets/images/svg_images/playnow.gif",
    "assets/images/svg_images/11.gif",
    "assets/images/svg_images/2.gif",
    "assets/images/svg_images/3.gif",
    "assets/images/svg_images/4444.gif",
    "assets/images/svg_images/5.gif",
    "assets/images/svg_images/6.gif",

    //"assets/images/svg_images/5.png",
    // "assets/images/svg_images/1.png",
    // "assets/images/svg_images/2.png",
    // "assets/images/svg_images/3.png",
    // "assets/images/svg_images/4.png",
    // "assets/images/svg_images/6.png",
  ];

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
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
                          height: isPortrait ? height * 0.15 : height * 0.277,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: imagePaths.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              navigateToScreen(index);
                            },
                            child: buildImageContainer(
                                imagePaths[index], height, width, isPortrait),
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
                              child: buildImageContainer(
                                  imagePaths[index], height, width, isPortrait),
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
    );
  }

  void navigateToScreen(int index) {
    switch (index) {
      case 0:
        showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: GestureDetector(
              onTap: () {
                // Get.to(Loadingone());
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "SELECT GAME TYPE!",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            content: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(PriceListss());
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Single Dice Game   >",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(PriceListssfortwodice());
                      //Get.to(Play_Now_2dice());
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Double Dice Game   >",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: CupertinoDialogAction(
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WolletUser(),
          ),
        );
        break;
      case 2:
        Navigator.push(
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
}
