import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:game_app/registrationscreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'constantt/buttonns/regular_button2.dart';
import 'constantt/buttonns/regular_buttons.dart';
import 'constantt/color_text.dart';
import 'login_email.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _obscured = false;
  bool _passwordVisible = true;

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _pin = TextEditingController();
  TextEditingController _confirmpin = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              var screenWidth = constraints.maxWidth;
              var screenHeight = constraints.maxHeight;

              var imageWidth = orientation == Orientation.portrait
                  ? screenWidth * 0.55
                  : screenWidth * 0.18;
              var imageHeight = orientation == Orientation.portrait
                  ? screenHeight * 0.2
                  : screenHeight * 0.25;

              var textfieldWidth = orientation == Orientation.portrait
                  ? screenWidth * 0.83
                  : screenWidth * 0.45;
              var textfieldHeight = orientation == Orientation.portrait
                  ? screenHeight * 0.2
                  : screenHeight * 0.3;

              var textfieldWidth2 = orientation == Orientation.portrait
                  ? screenWidth * 0.9
                  : screenWidth * 0.5;
              var textfieldHeight2 = orientation == Orientation.portrait
                  ? screenHeight * 0.3
                  : screenHeight * 0.4;

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: screenHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/svg_images/ludobackblack.png"
                            //"assets/images/svg_images/backgroundddice.jpeg"
                            ,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: screenHeight * 0.03),
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
                                      "assets/images/svg_images/play_store_512.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0200,
                            ),
                            buildTextField(
                              controller: _name,
                              hintText: "Name",
                              height: textfieldHeight,
                              width: textfieldWidth,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.010,
                            ),
                            buildTextField(
                              controller: _email,
                              hintText: "Email",
                              height: textfieldHeight,
                              width: textfieldWidth,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.010,
                            ),
                            buildTextField(
                              controller: _phone,
                              hintText: "Phone number",
                              height: textfieldHeight,
                              width: textfieldWidth,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.010,
                            ),
                            buildPasswordField(
                              controller: _pin,
                              hintText: "Password",
                              height: textfieldHeight,
                              width: textfieldWidth,
                              obscureText: !_obscured,
                              onToggleVisibility: () {
                                setState(() {
                                  _obscured = !_obscured;
                                });
                              },
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.010,
                            ),
                            buildPasswordField(
                              controller: _confirmpin,
                              hintText: "Confirm Password",
                              height: textfieldHeight,
                              width: textfieldWidth,
                              obscureText: !_passwordVisible,
                              onToggleVisibility: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            // SizedBox(
                            //   height:
                            //       MediaQuery.of(context).size.height * 0.0450,
                            // ),

                            RectangularButton(
                              text: 'SignUP',
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginEmail(),
                                  ),
                                );
                              },
                            ),

                            ///

                            // InkWell(
                            //   onTap: () {
                            //     register(_name.text, _phone.text, _pin.text,
                            //         _confirmpin.text);
                            //   },
                            //   child: Container(
                            //     height: textfieldHeight * 0.35,
                            //     width: textfieldWidth * 0.55,
                            //     decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //         image: AssetImage(
                            //           "assets/images/giftgreenbutton.png",
                            //         ),
                            //         fit: BoxFit.fill,
                            //       ),
                            //     ),
                            //     child: Center(
                            //       child: Text(
                            //         "SUBMIT",
                            //         style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 17 *
                            //               MediaQuery.textScaleFactorOf(context),
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            ///
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.010,
                            ),
                            //
                            RectangularButton2(
                              text: 'Already Have an account?',
                              text2: "Login",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginEmail(),
                                  ),
                                );
                              },
                            ),
                            // Container(
                            //   height: textfieldHeight2 * 0.15,
                            //   width: textfieldWidth2 * 0.8,
                            //   decoration: BoxDecoration(
                            //     image: DecorationImage(
                            //       image: AssetImage(
                            //         "assets/images/registerhere.png",
                            //       ),
                            //       fit: BoxFit.fill,
                            //     ),
                            //   ),
                            //   child: Row(
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 23.0),
                            //         child: Text(
                            //           "Already have an account? ",
                            //           style: TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 13 *
                            //                 MediaQuery.textScaleFactorOf(
                            //                     context),
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //       ),
                            //       InkWell(
                            //         onTap: () {
                            //           Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) => LoginEmail()),
                            //           );
                            //         },
                            //         child: Text(
                            //           "Login here",
                            //           style: TextStyle(
                            //             color: Colors.black,
                            //             fontWeight: FontWeight.bold,
                            //             decoration: TextDecoration.underline,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            //Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    required double height,
    required double width,
    TextInputType keyboardType = TextInputType.text,
    int? maxLength,
  }) {
    return Container(
      height: height * 0.35,
      width: width * 0.85,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/regisbutton.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 18.0),
        child: TextFormField(
          controller: controller,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
            counterText: "",
            border: InputBorder.none,
            hintText: "  $hintText",
            hintStyle: TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required double height,
    required double width,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
  }) {
    return Container(
      height: height * 0.35,
      width: width * 0.85,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/regisbutton.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 18.0),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "  $hintText",
            hintStyle: TextStyle(color: Colors.white70),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.white,
              ),
              onPressed: onToggleVisibility,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register(
      String name, String phone, String pin, String confirmpin) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    Map<String, dynamic> data = {
      'name': name,
      'phone': phone,
      'pin': pin,
      'confirmpin': confirmpin,
    };

    try {
      final response = await http.post(
        Uri.parse('https://example.com/register'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        sharedPreferences.setString('token', jsonResponse['token']);
        Fluttertoast.showToast(
          msg: 'Registration successful',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
        );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomePage()),
        // );
      } else {
        Fluttertoast.showToast(
          msg: 'Registration failed',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error occurred: $e',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
