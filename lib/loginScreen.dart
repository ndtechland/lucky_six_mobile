import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage/homePage.dart';
import 'const.dart';

class Pin extends StatefulWidget {
  final String mobile;
  Pin({Key? key, required this.mobile}) : super(key: key);

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  TextEditingController pin = TextEditingController();
  var phone = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          var screenWidth = constraints.maxWidth;
          var screenHeight = constraints.maxHeight;
          var orientation = MediaQuery.of(context).orientation;

          var otpWidth = orientation == Orientation.portrait
              ? screenWidth * 0.6
              : screenWidth * 0.3;
          var otpHeight = orientation == Orientation.portrait
              ? screenHeight * 0.16
              : screenHeight * 0.3;
          final defaultPinTheme = PinTheme(
            width: otpWidth,
            //constraints.maxWidth * 0.13,
            height: otpHeight,
            //constraints.maxHeight * 0.065,
            textStyle: TextStyle(
                fontSize: 19,
                color: Color.fromRGBO(30, 60, 87, 1),
                fontWeight: FontWeight.w600),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
              borderRadius: BorderRadius.circular(7),
            ),
          );

          final focusedPinTheme = defaultPinTheme.copyDecorationWith(
            border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
            borderRadius: BorderRadius.circular(10),
          );

          final submittedPinTheme = defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration?.copyWith(
              color: Color.fromRGBO(234, 239, 243, 1),
            ),
          );

          // var screenWidth = constraints.maxWidth;
          // var screenHeight = constraints.maxHeight;
          // var orientation = MediaQuery.of(context).orientation;

          // Calculating sizes based on orientation
          var imageWidth = orientation == Orientation.portrait
              ? screenWidth * 0.4
              : screenWidth * 0.3;
          var imageHeight = orientation == Orientation.portrait
              ? screenHeight * 0.2
              : screenHeight * 0.4;

          var imageWidth3 = orientation == Orientation.portrait
              ? screenWidth * 0.77
              : screenWidth * 0.5;
          var imageHeight3 = orientation == Orientation.portrait
              ? screenHeight * 0.33
              : screenHeight * 0.60;

          return SingleChildScrollView(
            child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        //"https://plus.unsplash.com/premium_photo-1697474664853-14a5de799b95?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        //"https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        //"https://cdn.pixabay.com/photo/2019/06/13/05/44/cube-4270777_1280.jpg"
                        //"https://images.unsplash.com/photo-1659691283234-8065c588e437?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        "https://burst.shopifycdn.com/photos/dice-games.jpg?width=746&format=pjpg&exif=0&iptc=0"),
                    //"https://burst.shopifycdn.com/photos/hand-throwing-dice-on-yellow.jpg?width=746&format=pjpg&exif=0&iptc=0"),
                    //AssetImage("assets/images/backgroundhome2.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: imageWidth * 0.99,
                    height: imageHeight * 0.8, //constraints.maxHeight * 0.17,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage("assets/images/rlg.jpg"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.035,
                  ),
                  Container(
                    width: otpHeight * 0.99,
                    height: imageHeight * 0.45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/enterpass1.png"),
                            fit: BoxFit.fill)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: constraints.maxWidth * 0.0,
                          top: constraints.maxHeight * 0.019),
                      child: Center(
                        child: Text(
                          "Enter Pin",
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize:
                                  17 * MediaQuery.textScaleFactorOf(context),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.06,
                  ),
                  Container(
                    height: otpHeight * 0.5,
                    //constraints.maxHeight * 0.13,
                    width: otpWidth,
                    //constraints.maxWidth * 0.34,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/pinback.png"),
                            fit: BoxFit.fill)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Pinput(
                        length: 4,
                        controller: pin,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        showCursor: true,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.04,
                  ),
                  InkWell(
                    onTap: () {
                      loginapi(pin.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home_Page()));
                    },
                    child: Container(
                      height: otpHeight * 0.45,
                      //constraints.maxHeight * 0.12,
                      width: otpWidth * 0.55,
                      //constraints.maxWidth * 0.18,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/loginred.png"),
                              fit: BoxFit.fill)),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                16 * MediaQuery.textScaleFactorOf(context)),
                      )),
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

  loginapi(String _login) async {
    print('radhe');
    print(widget.mobile);
    print(_login);
    final response = await http.post(
      Uri.parse(ApiConst.baseurl + "login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{"mobile": widget.mobile, "pin": _login}),
    );
    final data = jsonDecode(response.body);
    final dada = jsonDecode(response.body)['data'];
    print(data);
    if (data['success'] == "200") {
      print('logons');
      final user_id = dada['id'];
      print(user_id);

      final prefs1 = await SharedPreferences.getInstance();
      prefs1.setInt('user_id', user_id);
      print(user_id);
      print('wwwwwwwwwwww');

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home_Page()));

      Fluttertoast.showToast(
          msg: data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print(" Login SucessFully");
    } else {
      const user_id = '';
      Fluttertoast.showToast(
          msg: data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
