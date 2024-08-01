import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      backgroundColor: Colors.black,
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
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                SizedBox(width: constraints.maxWidth * 0.03),
                                Text(
                                  'CONTACT SUPPORT LuckySix',
                                  style: GoogleFonts.abyssinicaSil(
                                    fontSize: constraints.maxHeight * 0.025,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
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
                            SizedBox(height: constraints.maxHeight * 0.03),
                            SizedBox(height: constraints.maxHeight * 0.005),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            Row(
                              children: [
                                Text(
                                  "Contact: +9149008899",
                                  style: GoogleFonts.abyssinicaSil(
                                    color: Colors.red,
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: constraints.maxWidth * 0.03),
                                InkWell(
                                  onTap: () {
                                    _showContactDialog();
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
                                  style: GoogleFonts.abyssinicaSil(
                                    color: Colors.red,
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
                                        style: GoogleFonts.abyssinicaSil(
                                          color: Colors.red,
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
                            // Row(
                            //   children: [
                            //     Text(
                            //       'Website: ',
                            //       style: GoogleFonts.abyssinicaSil(
                            //         color: Colors.red,
                            //         fontSize: constraints.maxWidth * 0.04,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         Get.to(WebViewHirejobwebsite());
                            //       },
                            //       child: Row(
                            //         children: [
                            //           Text(
                            //             'www.luckysix.com',
                            //             style: GoogleFonts.abyssinicaSil(
                            //               color: Colors.red,
                            //               fontSize: constraints.maxWidth * 0.04,
                            //               fontWeight: FontWeight.w600,
                            //               decoration: TextDecoration.underline,
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: constraints.maxWidth * 0.02,
                            //           ),
                            //           Container(
                            //             height: constraints.maxHeight * 0.04,
                            //             width: constraints.maxWidth * 0.08,
                            //             decoration: BoxDecoration(
                            //               color: Colors.white30,
                            //               shape: BoxShape.circle,
                            //             ),
                            //             child: Icon(
                            //               Icons.arrow_right,
                            //               color: Colors.red,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Row(
                              children: [
                                Text(
                                  'Website: ',
                                  style: GoogleFonts.abyssinicaSil(
                                    color: Colors.red,
                                    fontSize: constraints.maxWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    const url = 'https://www.luckysix.com';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      // Handle the error here
                                      print('Could not launch $url');
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'www.luckysix.com',
                                        style: GoogleFonts.abyssinicaSil(
                                          color: Colors.red,
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
                            )
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

  void _showContactDialog() {
    Get.defaultDialog(
      barrierDismissible: true,
      title: "Contact Us",
      middleText: "Choose your preferred method to contact us.",
      backgroundColor: Colors.white30,
      titleStyle: GoogleFonts.abyssinicaSil(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      middleTextStyle: TextStyle(
        color: Colors.white,
      ),
      radius: 15,
      content: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            _buildDialogButton(
              icon: Icons.phone,
              text: 'Call',
              onPressed: () async {
                String telephoneNumber = "1111111111";
                String telephoneUrl = "tel:$telephoneNumber";
                if (await canLaunch(telephoneUrl)) {
                  await launch(telephoneUrl);
                } else {
                  throw "Error occurred trying to call that number.";
                }
              },
            ),
            _buildDialogButton(
              icon: Icons.message,
              text: 'WhatsApp',
              onPressed: _showWhatsappOptions,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.black12],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    text,
                    style: GoogleFonts.abyssinicaSil(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showWhatsappOptions() {
    Get.defaultDialog(
      barrierDismissible: true,
      title: "WhatsApp Options",
      middleText: "Choose a WhatsApp option",
      backgroundColor: Colors.green.shade800, // Change this color as needed
      titleStyle: GoogleFonts.abyssinicaSil(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      middleTextStyle: TextStyle(
        color: Colors.white,
      ),
      radius: 15,
      content: Column(
        children: [
          _buildDialogButton(
            icon: Icons.message,
            text: 'WhatsApp (Normal)',
            onPressed: _launchWhatsapp,
          ),
          _buildDialogButton(
            icon: Icons.business,
            text: 'WhatsApp (Business)',
            onPressed: _launchWhatsappBusiness,
          ),
        ],
      ),
    );
  }

  Future<void> _launchWhatsapp() async {
    const url = 'https://wa.me/9149008899';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchWhatsappBusiness() async {
    const url = 'https://wa.me/9149008899?business=1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
