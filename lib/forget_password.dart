import 'package:flutter/material.dart';
import 'package:game_app/constantt/responsive_text_color.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomePage/homePage.dart';
import 'constantt/buttonns/regular_buttons.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController countrycode = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  bool _obscured = false;

  TextEditingController _emailid = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var screenWidth = constraints.maxWidth;
          var screenHeight = constraints.maxHeight;
          var orientation = MediaQuery.of(context).orientation;

          var textfieldWidth = orientation == Orientation.portrait
              ? screenWidth * 0.83
              : screenWidth * 0.45;
          var textfieldHeight = orientation == Orientation.portrait
              ? screenHeight * 0.22
              : screenHeight * 0.45;

          var imageWidth = orientation == Orientation.portrait
              ? screenWidth * 0.4
              : screenWidth * 0.19;
          var imageHeight = orientation == Orientation.portrait
              ? screenHeight * 0.15
              : screenHeight * 0.28;

          var imageWidth2 = orientation == Orientation.portrait
              ? screenWidth * 0.86
              : screenWidth * 0.1;
          var imageHeight2 = orientation == Orientation.portrait
              ? screenHeight * 0.25
              : screenHeight * 0.5;

          var imageWidth3 = orientation == Orientation.portrait
              ? screenWidth * 0.77
              : screenWidth * 0.5;
          var imageHeight3 = orientation == Orientation.portrait
              ? screenHeight * 0.33
              : screenHeight * 0.5;

          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenHeight,
              ),
              child: IntrinsicHeight(
                child: Container(
                  height: screenHeight,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/svg_images/ludobackblack.png"
                          //"assets/images/svg_images/backgroundddice.jpeg"
                          ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.06),

                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Container(
                              height: screenHeight * 0.07,
                              width: screenWidth * 0.08,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.arrow_back,
                                  color: Colors.white),
                            ),
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
                                      'Forgot Password',
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

                      SizedBox(height: screenHeight * 0.01),
                      PhysicalModel(
                        color: appColor2,
                        clipBehavior: Clip.none,
                        borderRadius: BorderRadius.circular(12),
                        elevation: 10,
                        shadowColor: Colors.white,
                        child: Container(
                          height: imageHeight * 0.7,
                          width: imageWidth * 0.7,
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
                      SizedBox(height: screenHeight * 0.05),
                      Container(
                        height: textfieldHeight * 0.38,
                        width: textfieldWidth * 0.85,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/svg_images/designtext.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).viewInsets.left + 1,
                              top: MediaQuery.of(context).viewInsets.top + 8),
                          child: TextFormField(
                            controller: _emailid,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              hintText: "  Enter Your Email",
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      SizedBox(height: screenHeight * 0.03),
                      RectangularButton(
                        text: 'Request',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home_Page(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      // RectangularButton2(
                      //   text: 'Don\'t Have an account?',
                      //   text2: "SignUP",
                      //   press: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => RegistrationPage(),
                      //       ),
                      //     );
                      //   },
                      // ),

                      /// SizedBox(height: imageWidth2 * 0.1),
                      // Container(
                      //   height: imageHeight3 * 0.15,
                      //   width: imageWidth3 * 0.95,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       image: AssetImage("assets/images/registerhere.png"),
                      //       fit: BoxFit.fill,
                      //     ),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         "Don't have an account? ",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 13,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       InkWell(
                      //         onTap: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) => registration_page(),
                      //             ),
                      //           );
                      //         },
                      //         child: Text(
                      //           "SignUp here",
                      //           style: TextStyle(
                      //             color: Colors.blue.shade900,
                      //             fontWeight: FontWeight.bold,
                      //             decoration: TextDecoration.underline,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
