import 'package:flutter/material.dart';
import 'package:game_app/registerpage.dart';

import 'HomePage/homePage.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({Key? key}) : super(key: key);

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController countrycode = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  bool _obscured = false;

  TextEditingController _email = TextEditingController();
  TextEditingController _pin = TextEditingController();

  // TextEditingController phoneNumber = TextEditingController();

  var phone = "";

  @override
  void initState() {
    // TODO: implement initState
    //countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent resizing when keyboard appears
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

          // Calculating sizes based on orientation
          var imageWidth = orientation == Orientation.portrait
              ? screenWidth * 0.4
              : screenWidth * 0.2;
          var imageHeight = orientation == Orientation.portrait
              ? screenHeight * 0.15
              : screenHeight * 0.22;

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
              : screenHeight * 0.45;

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
                          "assets/images/svg_images/backgroundddice.jpeg"
                          //"https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                          //"https://burst.shopifycdn.com/photos/dice-games.jpg?width=746&format=pjpg&exif=0&iptc=0"
                          ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.13),
                      Container(
                        height: imageHeight,
                        width: imageWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/svg_images/rlg.jpg"),
                            fit: BoxFit.fill,
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
                            controller: _email,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              hintText: "  Email",
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.025),

                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.0180,
                      // ),
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
                            controller: _pin,
                            validator: (val) {
                              if (val!.isEmpty) return 'enter pin';
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
                              hintText: "  Password ",
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
                      SizedBox(height: screenHeight * 0.01),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home_Page(),
                              // Pin(mobile: phone),
                            ),
                          );
                        },
                        child: Container(
                          height: imageHeight3 * 0.27,
                          width: imageWidth3 * 0.6,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/svg_images/buttonlogin.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: imageHeight2 * 0.07,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: imageHeight2 * 0.06,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: imageWidth2 * 0.1),
                      Container(
                        height: imageHeight3 * 0.16,
                        width: imageWidth3 * 0.95,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/registerhere.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => registration_page(),
                                  ),
                                );
                              },
                              child: Text(
                                "SignUp here",
                                style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
