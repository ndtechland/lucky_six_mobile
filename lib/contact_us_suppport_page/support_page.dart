import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_app/constantt/color_text.dart';
import 'package:game_app/contact_us_suppport_page/website_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controllersss/support_us_controller.dart';

class SupportPageComman extends StatefulWidget {
  const SupportPageComman({Key? key}) : super(key: key);

  @override
  State<SupportPageComman> createState() => _SupportPageCommanState();
}

class _SupportPageCommanState extends State<SupportPageComman> {
  final SupportEmployeeController _supportEmployeeController =
      Get.put(SupportEmployeeController());

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: constraints.maxHeight * 0.01,
                            right: -constraints.maxWidth * 0.01,
                            child: Container(
                              height: constraints.maxHeight * 0.10,
                              width: constraints.maxWidth * 0.20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/svg_images/play_store_512.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    height: constraints.maxHeight * 0.03,
                                    width: constraints.maxWidth * 0.1,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.arrow_back_ios_outlined,
                                      size: constraints.maxHeight * 0.022,
                                      color: appColor,
                                    ),
                                  ),
                                ),
                                SizedBox(width: constraints.maxWidth * 0.03),
                                Text(
                                  'CONTACT SUPPORT LuckySix',
                                  style: GoogleFonts.alatsi(
                                    fontSize: constraints.maxHeight * 0.025,
                                    fontWeight: FontWeight.w600,
                                    color: appColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: constraints.maxHeight * 0.04),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.05,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   'Address:',
                            //   style: GoogleFonts.poppins(
                            //     color: appColor,
                            //     fontSize: constraints.maxWidth * 0.06,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            // Text(
                            //   'Registered Office:-',
                            //   style: GoogleFonts.poppins(
                            //     color: appColor,
                            //     fontSize: constraints.maxWidth * 0.04,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            SizedBox(height: constraints.maxHeight * 0.005),
                            // Text(
                            //   "Noida Sector 2 near Priya Gold office",
                            //   style: GoogleFonts.roboto(
                            //     color: appColor,
                            //     fontSize: constraints.maxWidth * 0.037,
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            // Text(
                            //   'Corporate Office',
                            //   style: GoogleFonts.poppins(
                            //     color: appColor,
                            //     fontSize: constraints.maxWidth * 0.04,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            SizedBox(height: constraints.maxHeight * 0.005),
                            // Text(
                            //   "Gurugram, Haryana sector 132",
                            //   style: GoogleFonts.roboto(
                            //     color: appColor,
                            //     fontSize: constraints.maxWidth * 0.037,
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Row(
                              children: [
                                Text(
                                  "Contact: +9149008899",
                                  style: GoogleFonts.poppins(
                                    color: appColor,
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: constraints.maxWidth * 0.03),
                                InkWell(
                                  onTap: () async {
                                    Get.defaultDialog(
                                      barrierDismissible: true,
                                      title: "Welcome to LuckySix",
                                      confirm: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: PhysicalModel(
                                          color: appColor,
                                          shadowColor: Colors.blueGrey,
                                          elevation: 0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: InkWell(
                                              onTap: () async {
                                                String telephoneNumber =
                                                    "1111111111";
                                                String telephoneUrl =
                                                    "tel:$telephoneNumber";
                                                if (await canLaunch(
                                                    telephoneUrl)) {
                                                  await launch(telephoneUrl);
                                                } else {
                                                  throw "Error occurred trying to call that number.";
                                                }
                                              },
                                              child: Container(
                                                height: constraints.maxHeight *
                                                    0.04,
                                                width:
                                                    constraints.maxWidth * 0.26,
                                                color: appColor,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.phone,
                                                        color: Colors.white,
                                                        size: constraints
                                                                .maxWidth *
                                                            0.05,
                                                      ),
                                                      SizedBox(
                                                        width: constraints
                                                                .maxWidth *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        'Call',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: constraints
                                                                  .maxWidth *
                                                              0.03,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      cancel: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: PhysicalModel(
                                          color: appColor,
                                          shadowColor: Colors.blueGrey,
                                          elevation: 0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: InkWell(
                                              onTap: () {
                                                _launchWhatsapp();
                                              },
                                              child: Container(
                                                height: constraints.maxHeight *
                                                    0.04,
                                                width:
                                                    constraints.maxWidth * 0.26,
                                                color: appColor,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.message,
                                                        color: Colors.white,
                                                        size: constraints
                                                                .maxHeight *
                                                            0.03,
                                                      ),
                                                      SizedBox(
                                                        width: constraints
                                                                .maxWidth *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        'Whatsapp',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: constraints
                                                                  .maxWidth *
                                                              0.03,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      middleText:
                                          "We are giving two options to our User for contact with us.",
                                      backgroundColor: appColor,
                                      titleStyle: GoogleFonts.alatsi(
                                        color: Colors.white,
                                        fontSize: constraints.maxHeight * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      middleTextStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      radius: 10,
                                    );
                                  },
                                  child: Container(
                                    height: constraints.maxHeight * 0.04,
                                    width: constraints.maxWidth * 0.08,
                                    decoration: BoxDecoration(
                                      color: Colors.white30,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Row(
                              children: [
                                Text(
                                  'Email: ',
                                  style: GoogleFonts.poppins(
                                    color: appColor,
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    String email = "luckysix@gmail.com";
                                    String subject = 'This is an email';
                                    String body = 'This is an email body';

                                    String emailUrl =
                                        "mailto:$email?subject=$subject&body=$body";

                                    if (await canLaunch(emailUrl)) {
                                      await launch(emailUrl);
                                    } else {
                                      throw "Error occurred sending an email";
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "luckysix@gmail.com",
                                        style: GoogleFonts.poppins(
                                          color: appColor,
                                          fontSize: constraints.maxWidth * 0.04,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.04,
                                      ),
                                      Container(
                                        height: constraints.maxHeight * 0.04,
                                        width: constraints.maxWidth * 0.08,
                                        decoration: BoxDecoration(
                                          color: Colors.white30,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.email,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Row(
                              children: [
                                Text(
                                  'Website: ',
                                  style: GoogleFonts.poppins(
                                    color: appColor,
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(WebViewHirejobwebsite());
                                    print("clickios");
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'www.luckysix.com',
                                        style: GoogleFonts.poppins(
                                          color: appColor,
                                          fontSize: constraints.maxWidth * 0.04,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.02,
                                      ),
                                      Container(
                                        height: constraints.maxHeight * 0.04,
                                        width: constraints.maxWidth * 0.08,
                                        decoration: BoxDecoration(
                                          color: Colors.white30,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.arrow_right,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _launchWhatsapp() async {
    var whatsapp =
        "+91${_supportEmployeeController.supportModel?.response?.callNumber.toString()}";
    var whatsappAndroid =
        Uri.parse("whatsapp://send?phone=$whatsapp&text=Hi LuckySix");
    if (await canLaunch(whatsappAndroid.toString())) {
      await launch(whatsappAndroid.toString());
    } else {
      Get.snackbar(
        "WhatsApp not installed",
        "Please install WhatsApp",
        colorText: Colors.red.shade400,
        backgroundColor: Colors.white10,
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
