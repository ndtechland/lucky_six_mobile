import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:game_app/registrationscreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage/homePage.dart';
import 'const.dart';
import 'login_email.dart';

class registration_page extends StatefulWidget {
  const registration_page({Key? key}) : super(key: key);

  @override
  State<registration_page> createState() => _registration_pageState();
}

class _registration_pageState extends State<registration_page> {
  bool _obscured = false;
  bool _passwordVisible = true;

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();

  TextEditingController _phone = TextEditingController();
  TextEditingController _pin = TextEditingController();
  TextEditingController _confirmpin = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
              // (builder: builder)
              builder: (context, constraints) {
            // Getting the size of the screen
            var screenWidth = constraints.maxWidth;
            var screenHeight = constraints.maxHeight;

            // Calculating sizes based on orientation
            var imageWidth = orientation == Orientation.portrait
                ? screenWidth * 0.55
                : screenWidth * 0.3;
            var imageHeight = orientation == Orientation.portrait
                ? screenHeight * 0.2
                : screenHeight * 0.4;

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
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/backgroundhome2.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(
                        height: imageHeight * 0.2,
                        // MediaQuery
                        //     .of(context)
                        //     .size
                        //     .height * 0.13,
                        width: imageWidth * 0.9,
                        // MediaQuery
                        //     .of(context)
                        //     .size
                        //     .width * 0.40,
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //       image: AssetImage("assets/images/enterpass1.png"),
                        //       fit: BoxFit.fill),
                        // ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: imageWidth * 0.13,
                            //MediaQuery.of(context).viewInsets.left + 21,
                            top: imageHeight * 0.04,
                            // MediaQuery.of(context).viewInsets.top + 34.0
                          ),
                          child: SizedBox(
                            child: Text(
                              "User Registration",
                              style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.green,
                                  fontSize: imageHeight * 0.12,
                                  // 12 *
                                  //     MediaQuery.textScaleFactorOf(context),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0400,
                      ),
                      Container(
                        height: textfieldHeight * 0.35,
                        //MediaQuery.of(context).size.height * 0.11,
                        width: textfieldWidth * 0.85,
                        //MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/regisbutton.png"),
                              fit: BoxFit.fill),

                          ///todo: applicat.................................................................
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left:
                                  MediaQuery.of(context).viewInsets.left + 18),
                          child: TextFormField(
                            controller: _name,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Name",
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0170,
                      ),
                      Container(
                        height: textfieldHeight * 0.35,
                        //MediaQuery.of(context).size.height * 0.11,
                        width: textfieldWidth * 0.85,
                        //MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/regisbutton.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left:
                                  MediaQuery.of(context).viewInsets.left + 18),
                          child: TextFormField(
                            controller: _email,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Email",
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0170,
                      ),
                      Container(
                        height: textfieldHeight * 0.35,
                        //MediaQuery.of(context).size.height * 0.11,
                        width: textfieldWidth * 0.85,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/regisbutton.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: TextFormField(
                            controller: _phone,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              hintText: "  Phone number ",
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0170,
                      ),
                      Container(
                        height: textfieldHeight * 0.35,
                        //MediaQuery.of(context).size.height * 0.11,
                        width: textfieldWidth * 0.85,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/regisbutton.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).viewInsets.left +
                                  18.0),
                          child: TextFormField(
                            controller: _pin,
                            validator: (val) {
                              if (val!.isEmpty) return 'enter pin';
                              return null;
                            },
                            obscureText: !_obscured,
                            maxLength: 4,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              hintText: "  Pin ",
                              hintStyle: TextStyle(color: Colors.white70),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _obscured
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _obscured = !_obscured;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0170,
                      ),
                      Container(
                        height: textfieldHeight * 0.35,
                        //MediaQuery.of(context).size.height * 0.11,
                        width: textfieldWidth * 0.85,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/regisbutton.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).viewInsets.left +
                                  18.0),
                          child: TextFormField(
                            controller: _confirmpin,
                            validator: (val) {
                              if (val!.isEmpty) return 'enter confirm Pin';
                              if (val != _confirmpin.text) return 'Not Match';
                              return null;
                            },
                            obscureText: !_passwordVisible,
                            maxLength: 4,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              hintText: "  Confirm pin ",
                              hintStyle: TextStyle(color: Colors.white70),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0450,
                      ),
                      InkWell(
                        onTap: () {
                          register(_name.text, _phone.text, _pin.text,
                              _confirmpin.text);
                        },
                        child: Container(
                          height: textfieldHeight * 0.35,
                          //MediaQuery.of(context).size.height * 0.11,
                          width: textfieldWidth * 0.55,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/giftgreenbutton.png"),
                                  fit: BoxFit.fill)),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: textfieldWidth * 0.17,
                                  // MediaQuery.of(context).viewInsets.left +
                                  //     30.0
                                ),
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17 *
                                          MediaQuery.textScaleFactorOf(context),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0130,
                      ),
                      Container(
                        height: textfieldHeight2 * 0.15,
                        //MediaQuery.of(context).size.height * 0.11,
                        width: textfieldWidth2 * 0.8,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/registerhere.png"),
                                fit: BoxFit.fill)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).viewInsets.left +
                                      23.0),
                              child: Text("Already have an account? ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13 *
                                          MediaQuery.textScaleFactorOf(context),
                                      fontWeight: FontWeight.bold)),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginEmail()));
                                },
                                child: Text("Login here",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline))),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }

  register(String name, String phone, String pin, String confirmpin) async {
    if (pin == confirmpin) {
      final response = await http.post(
        Uri.parse(ApiConst.baseurl + "register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{"name": name, "mobile": phone, "pin": confirmpin}),
      );
      final data = jsonDecode(response.body);
      final dada = jsonDecode(response.body)['data'];
      print(data);
      if (data['success'] == "200") {
        final user_id = dada['id'];

        final prefs1 = await SharedPreferences.getInstance();
        prefs1.setInt('user_id', user_id);
        print(user_id);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home_Page()));

        // final otp = dada['otp'];
        // final status = dada['status'];
        // print(otp);
        // print('qqqqqqqqqqqqqqqq');
        //
        // final user_id = data['data']['id'] ;
        //
        //
        // final prefs1 = await SharedPreferences.getInstance();
        // prefs1.setString('user_id', user_id);
        // print(user_id);
        // print('wwwwwwwwwwww');

        Fluttertoast.showToast(
            msg: data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Register SucessFully");
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) =>
        //         OTPScreens(phone: _login, otp:otp,
        //             status:status, user_id:user_id)));
      } else {
        // final otp = dada['otp'];
        // final status = dada['status'];
        // print(otp);
        // print('qqqqqqqqqqqqqqqq');

        final user_id = '';
        Fluttertoast.showToast(
            msg: data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) =>
        //         Registration()));
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) =>
        //         OTPScreens(phone: _login, otp:otp,
        //             status:status, user_id:user_id)));

      }
    } else {
      Fluttertoast.showToast(
          msg: "Pin Not Match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
