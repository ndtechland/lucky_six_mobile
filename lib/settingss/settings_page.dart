import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constantt/responsive_container_text.dart';

class Settingsss extends StatelessWidget {
  Settingsss({Key? key}) : super(key: key);
  //GetProfileModel? getprofileModel;

  // Define a list of items
  final List<String> items = [
    'Account',
    'Profile',
    'Logout',
    'Feedback',
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
                'assets/images/svg_images/backgroundddice.jpeg',
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
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 16),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
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
                                      responsiveContainer2(
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
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              items[index],
                                              style: GoogleFonts.alata(
                                                fontSize: 14,
                                                color: Colors.grey.shade900,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 12,
                                            ),
                                          ],
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
      decoration: BoxDecoration(color: Colors.white30
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
                    'Setting',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      // fontFamily: 'medium',
                      fontSize: 20,
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
                'assets/images/svg_images/rlg.jpg',
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/svg_images/rlg.jpg',
                    fit: BoxFit.fill,
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
