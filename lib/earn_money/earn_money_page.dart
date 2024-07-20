import 'package:flutter/material.dart';
import 'package:game_app/constantt/responsive_text_color.dart';
import 'package:game_app/earn_money/redeam_money.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constantt/responsive_container_text.dart';

class EarnMoney extends StatelessWidget {
  EarnMoney({Key? key}) : super(key: key);
  //GetProfileModel? getprofileModel;

  // Define a list of items
  final List<String> items = [
    '22-06-2023',
    '23-07-2023',
    '22-10-2023',
    '23-12-2023',
    '03-02-2024',
    '02-03-2024',
    '01-04-2024',
    '24-05-2024',
  ];
  final List<String> items2 = [
    'Win',
    'Loose',
    'Loose',
    'Win',
    'Win',
    'Loose',
    'Loose',
    'Win',
    'Loose'
  ];
  final List<String> items3 = [
    '200 Coins',
    '300 Coins',
    '400 Coins',
    '100 Coins',
    '200 Coins',
    '300 Coins',
    '400 Coins',
    '100 Coins',
    '700 Coins',
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
                //'assets/images/svg_images/backgroundddice.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            OrientationBuilder(
              builder: (context, orientation) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      children: [
                        _buildHeader(context),
                        Expanded(
                          child: ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20.0,
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.0)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      responsiveContainer3(
                                        heightPortrait:
                                            MediaQuery.of(context).size.height *
                                                0.080,
                                        widthPortrait:
                                            MediaQuery.of(context).size.width,
                                        heightLandscape:
                                            MediaQuery.of(context).size.height *
                                                0.16,
                                        widthLandscape:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                items[index],
                                                style: GoogleFonts.roboto(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                items2[index],
                                                style: GoogleFonts.alata(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                items3[index],
                                                style: GoogleFonts.alata(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        context: context,
                                      ),
                                    ],
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
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      width: double.infinity,
      decoration: BoxDecoration(color: appColor
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
                  child: Text(
                    'Earned Money',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      // fontFamily: 'medium',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 50),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  child: ClipOval(
                    child: responsiveContainer(
                      heightPortrait: MediaQuery.of(context).size.height * 0.12,
                      widthPortrait: MediaQuery.of(context).size.width * 0.25,
                      heightLandscape:
                          MediaQuery.of(context).size.height * 0.20,
                      widthLandscape: MediaQuery.of(context).size.width * 0.10,
                      child: Image.asset(
                        'assets/images/svg_images/play_store_512.png',
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/svg_images/play_store_512.png',
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                      context: context,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Total Points: 3000',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      // fontFamily: 'medium',
                      fontSize: 15,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(RedeemeRequest());
                  },
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Redeem',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          // fontFamily: 'medium',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context, int index, Orientation orientation) {
    String label, value;
    switch (index) {
      case 0:
        label = "Name:";
        value = "Kumar Prince";
        break;
      case 1:
        label = "Email:";
        value = "Kumar@gmail.com";
        break;
      case 2:
        label = "Phone:";
        value = "9897665532";
        break;
      case 3:
        label = "DOB:";
        value = "12/12/2002";
        break;
      case 4:
        label = "Address:";
        value = "Noida sector 15, near priya gold office";
        break;
      default:
        label = "Item $index:";
        value = "Value $index";
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Column(
          children: [
            responsiveContainer2(
              heightPortrait: MediaQuery.of(context).size.height * 0.070,
              widthPortrait: MediaQuery.of(context).size.width,
              heightLandscape: MediaQuery.of(context).size.height * 0.09,
              widthLandscape: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'medium',
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.63
                          : MediaQuery.of(context).size.width * 0.6,
                      child: Align(
                        child: responsiveText(
                          text: value,
                          fontSizeLandscape:
                              MediaQuery.of(context).size.height * 0.033,
                          fontSizePortrait:
                              MediaQuery.of(context).size.height * 0.015,
                          context: context,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
