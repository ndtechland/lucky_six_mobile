import 'package:flutter/material.dart';
import 'package:game_app/constantt/responsive_text_color.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constantt/buttonns/regular_buttons.dart';
import 'controllers_all/change_password_controller.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  GlobalKey<FormState> _formkey = GlobalKey();

  ChangePasswordController _changepasswordController =
      Get.put(ChangePasswordController());

  bool _obscured = true;
  bool _obscured2 = true;
  bool _obscured3 = true;

  ///....
  final TextEditingController _oldpassword = TextEditingController();
  final TextEditingController _newpassword = TextEditingController();
  final TextEditingController _confirmnewpassword = TextEditingController();

  ///.....

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
            child: Form(
              key: _changepasswordController.changepasswordFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            "assets/images/svg_images/ludobackblack.png"),
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
                                        'Change Password',
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
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
                          height: textfieldHeight * 0.42,
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
                              top: MediaQuery.of(context).viewInsets.top + 10,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 4),
                              child: TextFormField(
                                controller: _oldpassword,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return '                   Enter Old Password';
                                  }
                                  return null;
                                },
                                obscureText: !_obscured,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Colors.white,
                                  ),
                                  hintText: "  Old Password ",
                                  hintStyle: TextStyle(color: Colors.white70),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscured
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscured = !_obscured;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.025),
                        Container(
                          height: textfieldHeight * 0.4,
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
                                left:
                                    MediaQuery.of(context).viewInsets.left + 1,
                                top:
                                    MediaQuery.of(context).viewInsets.top + 10),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 4),
                              child: TextFormField(
                                controller: _newpassword,
                                validator: validatePassword,
                                obscureText: !_obscured2,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Colors.white,
                                  ),
                                  hintText: "  New Password ",
                                  hintStyle: TextStyle(color: Colors.white70),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscured2
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscured2 = !_obscured2;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Container(
                          height: textfieldHeight * 0.4,
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
                                left:
                                    MediaQuery.of(context).viewInsets.left + 1,
                                top:
                                    MediaQuery.of(context).viewInsets.top + 13),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 4),
                              child: TextFormField(
                                controller: _confirmnewpassword,
                                validator: confirmPassword,
                                obscureText: !_obscured3,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Colors.white,
                                  ),
                                  hintText: "  Confirm New Password ",
                                  hintStyle: TextStyle(color: Colors.white70),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscured3
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscured3 = !_obscured3;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        RectangularButton(
                          text: 'Update',
                          press: () async {
                            // Ensure form validation
                            if (_changepasswordController
                                .changepasswordFormKey.currentState!
                                .validate()) {
                              await _changepasswordController.cngPasswordApi(
                                currentPassword: _oldpassword.text,
                                currentNewPassword: _newpassword.text,
                                currentNewConfirmPassword:
                                    _confirmnewpassword.text,
                              );
                            }
                          },
                        ),
                        SizedBox(height: screenHeight * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String? validatePassword(String? val) {
    // Check if the password is empty
    if (val!.isEmpty) return '                   Enter New Password';

    // Check for at least one uppercase letter
    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(val)) {
      return '         Must contain at least one uppercase letter';
    }

    // Check for at least one lowercase letter
    if (!RegExp(r'^(?=.*[a-z])').hasMatch(val)) {
      return '         Must contain at least one lowercase letter';
    }

    // Check for at least one special character
    if (!RegExp(r'^(?=.*[!@#\$&*~])').hasMatch(val)) {
      return '         Must contain at least one special character';
    }

    return null;
  }

  String? confirmPassword(String? val) {
    if (val!.isEmpty) return '                   Enter Confirm Password';

    if (val != _newpassword.text) {
      return '                   Passwords do not match';
    }

    return null;
  }
}
