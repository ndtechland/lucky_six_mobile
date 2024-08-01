import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controllersss/rezaypay_controller/rozarpay_wollet_controlelr.dart';
import '../../Controllersss/rezaypay_controller/wallet_controller.dart';

class WalletCredentials extends StatelessWidget {
  WalletCredentials({Key? key}) : super(key: key);
  final TextEditingController walletAmountController = TextEditingController();

  final Wallet_2_Controller wallet2Controller = Get.put(Wallet_2_Controller());
  final RozarwalletController rozarwalletController =
      Get.put(RozarwalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 0),
          child: OrientationBuilder(
            builder: (context, orientation) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  Size size = Size(constraints.maxWidth, constraints.maxHeight);
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
                      ? screenHeight * 0.06
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
                      ? screenHeight * 0.5
                      : screenHeight * 0.03;

                  return SingleChildScrollView(
                    child: Container(
                      height: screenHeight,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/svg_images/ludobackblack.png"
                              //"assets/images/svg_images/backgroundddice.jpeg"
                              // "https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                              //"assets/images/svg_images/backgroundddice.jpeg"
                              // "assets/images/backgroundhome2.jpg"
                              ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Form(
                        key: wallet2Controller.walletformkey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: imageHeight * 0.12,
                              horizontal: imageWidth * 0.09),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: imageHeight3 * 0.2),

                              /// Add amount
                              buildAmountContainer(context, size),
                              //SizedBox(height: size.height * 0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildAmountContainer(BuildContext context, Size size) {
    return InkWell(
      onTap: () {
        //Get.to(() => DoctorListUser());
      },
      child: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
        decoration: BoxDecoration(
          color: Colors.red.shade100,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.red.shade300,
              offset: const Offset(5, 5),
            ),
            const BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
                vertical: size.height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText('Available Coins:', size),
                  buildCoinDisplay(size),
                ],
              ),
            ),
            buildAmountInput(size),
            buildAmountButtons(size),
            buildSubmitButton(size),
          ],
        ),
      ),
    );
  }

  Widget buildText(String text, Size size) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: Colors.blue,
          fontSize: size.width < size.height
              ? size.height * 0.03 // Portrait mode
              : size.width * 0.03 // Landscape mode
          ),
    );
  }

  Widget buildCoinDisplay(Size size) {
    // Determine whether the device is in landscape or portrait mode
    bool isLandscape = size.width > size.height;

    bool isPortrait = size.width > size.height;

    // Define dimensions based on screen orientation
    double paddingVertical =
        isLandscape ? size.height * 0.01 : size.height * 0.01;
    double containerHeight =
        isLandscape ? size.height * 0.23 : size.height * 0.06;
    double containerWidth = isLandscape ? size.width * 0.12 : size.width * 0.26;
    double fontSize = isLandscape ? size.width * 0.11 : size.width * 0.18;

    double containerHeight3 =
        isPortrait ? size.height * 0.4 : size.height * 0.19;
    double containerWidth3 = isPortrait ? size.width * 0.12 : size.width * 0.28;

    double containerHeight2 =
        isLandscape ? size.height * 0.20 : size.height * 0.06;

    // Define dimensions based on screen orientation
    // double paddingVertical =

    return Container(
        height: containerHeight3 * 0.8,
        width: containerWidth3 * 0.99,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/svg_images/rupiesbackground.png"
                //  "https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                //"assets/images/svg_images/backgroundddice.jpeg"
                // "assets/images/backgroundhome2.jpg"
                ),
            fit: BoxFit.fill,
          ),
          //border: Border.all(color: Colors.white)
        ),
        child: Center(
            child: Text(
          "300",
          style: GoogleFonts.alata(
            fontSize: 15,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        )));
  }

  Widget buildAmountInput(Size size) {
    bool isLandscape = size.width > size.height;

    // Define dimensions based on screen orientation
    double paddingVertical =
        isLandscape ? size.height * 0.00 : size.height * 0.03;
    double containerHeight =
        isLandscape ? size.height * 0.3 : size.height * 0.10;
    double containerWidth = isLandscape ? size.width * 0.12 : size.width * 0.26;
    double containerHeight2 =
        isLandscape ? size.height * 0.025 : size.height * 0.03;
    double containerWidth2 =
        isLandscape ? size.width * 0.02 : size.width * 0.03;
    double fontSize = isLandscape ? size.width * 0.08 : size.width * 0.16;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: containerWidth2, vertical: containerHeight2),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: paddingVertical),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.white,
              Colors.red.shade300,
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              spreadRadius: 0,
              blurRadius: 0,
              color: Colors.grey.shade100,
            ),
            BoxShadow(
              offset: const Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 0,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        child: Center(
          child: TextFormField(
            style: TextStyle(
              fontSize: fontSize * 0.25,
              fontWeight: FontWeight.w700,
            ),
            autofillHints: [AutofillHints.transactionAmount],
            controller: wallet2Controller.walletAmount,
            onSaved: (value) {
              wallet2Controller.amount = value!;
            },
            cursorColor: Colors.black,
            obscureText: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.currency_rupee,
                size: 18,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: containerWidth,
                vertical: containerHeight * 0.24,
              ),
              hintText: 'Amount',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: fontSize * 0.25,
              ),
              helperStyle: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: CupertinoColors.black,
                fontSize: fontSize,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAmountButtons(Size size) {
    bool isLandscape = size.width > size.height;

    // Define dimensions based on screen orientation
    double paddingVertical =
        isLandscape ? size.height * 0.01 : size.height * 0.03;
    double containerHeight =
        isLandscape ? size.height * 0.3 : size.height * 0.10;
    double containerWidth = isLandscape ? size.width * 0.12 : size.width * 0.26;
    double containerHeight2 =
        isLandscape ? size.height * 0.014 : size.height * 0.01;
    double containerWidth2 =
        isLandscape ? size.width * 0.02 : size.width * 0.03;
    double fontSize = isLandscape ? size.width * 0.08 : size.width * 0.16;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: containerWidth2, vertical: containerHeight2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildAmountButton('₹100', size, wallet2Controller, '100'),
          buildAmountButton('₹200', size, wallet2Controller, '200'),
          buildAmountButton('₹500', size, wallet2Controller, '500'),
          buildAmountButton('₹1000', size, wallet2Controller, '1000'),
        ],
      ),
    );
  }

  Widget buildAmountButton(String amountText, Size size,
      Wallet_2_Controller controller, String amountValue) {
    bool isLandscape = size.width > size.height;

    // Define dimensions based on screen orientation
    double paddingVertical =
        isLandscape ? size.height * 0.0 : size.height * 0.0;
    double containerHeight =
        isLandscape ? size.height * 0.2 : size.height * 0.08;
    double containerWidth = isLandscape ? size.width * 0.12 : size.width * 0.26;
    double containerHeight2 =
        isLandscape ? size.height * 0.25 : size.height * 0.08;
    double containerWidth2 =
        isLandscape ? size.width * 0.12 : size.width * 0.26;
    double fontSize = isLandscape ? size.width * 0.06 : size.width * 0.18;
    return InkWell(
      onTap: () {
        controller.walletAmount.text = amountValue;
      },
      child: Container(
        height: containerHeight2 * 0.6,
        //width: containerWidth * 0.5,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03,
          vertical: paddingVertical,
        ),
        decoration: BoxDecoration(
          color: Colors.red.shade200,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            amountText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: fontSize * 0.25,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubmitButton(Size size) {
    bool isLandscape = size.width > size.height;

    // Define dimensions based on screen orientation
    double paddingVertical =
        isLandscape ? size.height * 0.018 : size.height * 0.05;
    double paddingHorizontal =
        isLandscape ? size.width * 0.24 : size.width * 0.03;
    double containerHeight =
        isLandscape ? size.height * 0.122 : size.height * 0.055;
    double containerWidth = isLandscape ? size.width * 0.12 : size.width * 0.26;
    double fontSize = isLandscape ? size.width * 0.025 : size.width * 0.05;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      child: InkWell(
        onTap: () {
          rozarwalletController.openCheckout();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 99),
          child: Container(
            width: double.infinity,
            height: containerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.red.shade500,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 1,
                  color: Colors.grey,
                ),
                BoxShadow(
                  offset: const Offset(-1, -1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  color: Colors.black12,
                ),
              ],
            ),
            child: Center(
              child: Text(
                'ADD +',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
