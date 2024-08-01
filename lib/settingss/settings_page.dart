import 'package:flutter/material.dart';
import 'package:game_app/constantt/responsive_text_color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../add_bank.dart';
import '../change_password.dart';
import '../constantt/responsive_container_text.dart';
import '../profiles/profile_user.dart';

class Settingsss extends StatelessWidget {
  Settingsss({Key? key}) : super(key: key);
  //GetProfileModel? getprofileModel;

  // Define a list of items
  final List<String> items = [
    'Delete Account',
    'Profile',
    'Logout',
    'Feedback',
    'Add Bank',
    'Change Password'
  ];

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
                "assets/images/svg_images/ludobackblack.png",
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
                        : screenHeight * 0.4;

                    var textsize = orientation == Orientation.portrait
                        ? screenHeight * 0.022
                        : screenHeight * 0.05;
                    return Column(
                      children: [
                        _buildHeader(context),
                        Expanded(
                          child: ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 02, horizontal: 0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      //
                                      // Get.to(
                                      //        () => NurseBoooking1()
                                      // );
                                    } else if (index == 1) {
                                      Get.to(() => Profileuserr());
                                    } else if (index == 2) {
                                      //Get.to(() => Profile());
                                    } else if (index == 3) {
                                      //Get.to(() => Profile());
                                    } else if (index == 4) {
                                      Get.to(() => AddBank());
                                    } else if (index == 5) {
                                      Get.to(() => ChangePassword());
                                    }
                                    // ForgetPassword                   Get.to(RedeemeRequest());
                                    //Profile
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 19),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade900,
                                      border: Border.all(
                                          color: Colors.red.shade300, width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 20.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        responsiveContainer2(
                                          heightPortrait: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.080,
                                          widthPortrait:
                                              MediaQuery.of(context).size.width,
                                          heightLandscape:
                                              MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.16,
                                          widthLandscape:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                items[index],
                                                style: GoogleFonts.alata(
                                                  fontSize: textsize,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 17,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                          context: context,
                                        ),
                                      ],
                                    ),
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
    return Container(
      //padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: appColor,
          image: DecorationImage(
              image: AssetImage(
                "assets/images/svg_images/ludobackblack.png",
              ),
              fit: BoxFit.cover)

          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: <Color>[appColor, appColor2],
          // ),
          ),
      child: Column(
        children: [
          //const SizedBox(height: 1),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Setting',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            //backgroundColor: Colors.white,
                            fontWeight: FontWeight.w600,
                            // fontFamily: 'medium',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 50),
            ],
          ),
          ClipOval(
            child: responsiveContainer(
              heightPortrait: MediaQuery.of(context).size.height * 0.12,
              widthPortrait: MediaQuery.of(context).size.width * 0.25,
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
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
