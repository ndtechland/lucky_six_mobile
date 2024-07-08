import 'package:flutter/material.dart';
import 'package:game_app/constantt/color_text.dart';
import 'package:game_app/contact_us_suppport_page/website_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controllersss/support_us_controller.dart';

SupportEmployeeController _supportEmployeeController =
    Get.put(SupportEmployeeController());

class SupportPageComman extends StatelessWidget {
  const SupportPageComman({Key? key}) : super(key: key);

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
                            top: -constraints.maxHeight * 0.02,
                            right: -constraints.maxWidth * 0.124,
                            child: Container(
                              height: constraints.maxHeight * 0.22,
                              width: constraints.maxWidth * 0.75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'lib/assets/background_stack_png/contactus.png',
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
                            Text(
                              'Address:',
                              style: GoogleFonts.poppins(
                                color: appColor,
                                fontSize: constraints.maxWidth * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Text(
                              'Registered Office:-',
                              style: GoogleFonts.poppins(
                                color: appColor,
                                fontSize: constraints.maxWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.005),
                            Text(
                              "Noida Sector 2 near priya gold office",
                              //"${_supportEmployeeController.supportModel?.response?.location.toString()}",
                              style: GoogleFonts.roboto(
                                color: appColor,
                                fontSize: constraints.maxWidth * 0.037,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Text(
                              'Corporate Office',
                              style: GoogleFonts.poppins(
                                color: appColor,
                                fontSize: constraints.maxWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.005),
                            Text(
                              "Gurugram hayryana sector 132",
                              // "${_supportEmployeeController.supportModel?.response?.location.toString()}",
                              style: GoogleFonts.roboto(
                                color: appColor,
                                fontSize: constraints.maxWidth * 0.037,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Row(
                              children: [
                                Text(
                                  "Contact: +9149008899",
                                  //" ${_supportEmployeeController.supportModel?.response?.callNumber.toString()}",
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
                                                    "1111111111".toString();
                                                // "${_supportEmployeeController.supportModel?.response?.callNumber.toString()}";
                                                String telephoneUrl =
                                                    "tel:$telephoneNumber";
                                                if (await canLaunch(
                                                    telephoneUrl)) {
                                                  await launch(telephoneUrl);
                                                } else {
                                                  throw "Error occured trying to call that number.";
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
                                        color: Colors.grey,
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
                                    //"${_supportEmployeeController.supportModel?.response?.email.toString()}";
                                    String subject = 'This is a email';
                                    String body = 'This is a  email body';

                                    String emailUrl =
                                        "mailto:$email?subject=$subject&body=$body";

                                    if (await canLaunch(emailUrl)) {
                                      await launch(emailUrl);
                                    } else {
                                      throw "Error occured sending an email";
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "Luckysix@gmail.com",
                                        //"${_supportEmployeeController.supportModel?.response?.email.toString()}",
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
}

_launchWhatsapp() async {
  var whatsapp =
      "+91${_supportEmployeeController.supportModel?.response?.callNumber.toString()}";
  var whatsappAndroid =
      Uri.parse("whatsapp://send?phone=$whatsapp&text=Hi HireJob India");
  if (await canLaunch(whatsappAndroid.toString())) {
    await launch(whatsappAndroid.toString());
  } else {
    Get.snackbar(
      "Whats App not installed",
      "Please install the what's app Prince",
      colorText: Colors.red.shade400,
      backgroundColor: Colors.white10,
      icon: Icon(Icons.person, color: Colors.red),
      snackPosition: SnackPosition.TOP,
    );
  }
}
