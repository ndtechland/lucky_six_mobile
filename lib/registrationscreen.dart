import 'package:flutter/material.dart';
import 'package:game_app/registerpage.dart';

import 'loginScreen.dart';

class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController countrycode = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  // TextEditingController phoneNumber = TextEditingController();

  var phone = "";

  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var screenWidth = constraints.maxWidth;
          var screenHeight = constraints.maxHeight;
          var orientation = MediaQuery.of(context).orientation;

          // Calculating sizes based on orientation
          var imageWidth = orientation == Orientation.portrait
              ? screenWidth * 0.4
              : screenWidth * 0.3;
          var imageHeight = orientation == Orientation.portrait
              ? screenHeight * 0.15
              : screenHeight * 0.30;

          var imageWidth2 = orientation == Orientation.portrait
              ? screenWidth * 0.66
              : screenWidth * 0.4;
          var imageHeight2 = orientation == Orientation.portrait
              ? screenHeight * 0.25
              : screenHeight * 0.5;

          var imageWidth3 = orientation == Orientation.portrait
              ? screenWidth * 0.77
              : screenWidth * 0.5;
          var imageHeight3 = orientation == Orientation.portrait
              ? screenHeight * 0.33
              : screenHeight * 0.60;

          return SingleChildScrollView(
            child: Container(
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://burst.shopifycdn.com/photos/dice-games.jpg?width=746&format=pjpg&exif=0&iptc=0"),
                  //AssetImage("assets/images/backgroundhome2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: screenHeight * 0.05),
                  Container(
                    height: imageHeight,
                    width: imageWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage("assets/images/rlg.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Center(
                    child: Container(
                      height: imageHeight2 * 0.4, // Adjusted height
                      width: imageWidth2 * 0.999, // Adjusted width
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(

                              //"assets/images/mobilenumber.png"
                              "assets/images/fblogin.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center horizontally
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Center vertically
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                // right: imageHeight2 * 0.035,
                                top: imageHeight2 * 0.09,
                                left: imageHeight2 * 0.1), // Adjusted padding
                            child: SizedBox(
                              height: imageHeight2 * 0.1,
                              width: imageWidth2 * 0.18,
                              child: Center(
                                child: Text(
                                  '+91 ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: imageHeight2 * 0.08,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //Spacer(),

                          // Center the TextFormField vertically
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: phonenumber,
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                              onChanged: (value) {
                                phone = value;
                              },
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a Phone Number';
                                } else if (value.length != 10) {
                                  return 'Please Enter 10 Digit Number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: imageHeight2 * 0.1,
                                    left: imageWidth2 *
                                        0.04), // Adjusted content padding
                                counterText: "",
                                border: InputBorder.none,
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: imageHeight2 * 0.12,
                    width: imageWidth2 * 0.63,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/redreward.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Get 5,00,000 points reward",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: imageHeight2 * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pin(mobile: phone),
                        ),
                      );
                    },
                    child: Container(
                      height: imageHeight2 * 0.26,
                      width: imageWidth2 * 0.55,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/loginred.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: imageHeight2 * 0.1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                            size: imageHeight2 * 0.09,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: imageHeight2 * 0.2),
                  Container(
                    height: imageHeight3 * 0.12,
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
          );
        },
      ),
    );
  }
}
