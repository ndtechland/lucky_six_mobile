import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controllersss/rezaypay_controller/pay_twicw_amount_controller.dart';
import '../../Controllersss/two_dice_controller.dart';

class TwiceNumberSelection extends StatelessWidget {
  static const String id = 'Company';

  final TwodiceController _twodiceController = Get.put(TwodiceController());
  final RozarpaytwiceamountController _rozarpaytwiceamountController =
      Get.put(RozarpaytwiceamountController());

  final List<String> _priceList = [
    '1-1',
    '1-2',
    '1-3',
    '1-4',
    '1-5',
    '1-6',
    //
    '2-1',
    '2-2',
    '2-3',
    '2-4',
    '2-5',
    '2-6',

    ///
    '3-1',
    '3-2',
    '3-3',
    '3-4',
    '3-5',
    '3-6',

    ///
    '4-1',
    '4-2',
    '4-3',
    '4-4',
    '4-5',
    '4-6',

    ///
    '5-1',
    '5-2',
    '5-3',
    '5-4',
    '5-5',
    '5-6',

    ///
    '6-1',
    '6-2',
    '6-3',
    '6-4',
    '6-5',
    '6-6',
  ];

  // final List<String> _diceImages2 = [
  //   'assets/images/dice1.png',
  //   'assets/images/dice2.png',
  //   'assets/images/dice3.png',
  //   'assets/images/dice4.png',
  //   'assets/images/dice5.png',
  //   'assets/images/dice6.png',
  // ];

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      //backgroundColor: Colors.grey.shade00,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.red.shade300,
        //toolbarHeight: 40.0,
        title: Text(
          'Select Number(Twice)',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "NOTE!",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    content: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Your Selected dice is  1,3,4 \n You have to pay your payable Amount for start your game and your payable Amount is\n ₹300."
                              //"If you will win the game then we will send wining amount to your account after deduct 28% of total transaction amount."
                              ,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          //SizedBox(height: 0),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      CupertinoDialogAction(
                        onPressed: () {
                          Get.back();

                          _rozarpaytwiceamountController.openCheckout();
                          // Get.to(Play_Now());

                          // Navigate to a new screen when the OK button is pressed
                          // Get.to(SomeOtherScreen()); // Replace SomeOtherScreen with your desired screen
                        },
                        child: Text(
                          "Pay",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: PhysicalModel(
                color: Colors.white10,
                shadowColor: Colors.black26,
                elevation: 15,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 18,
                  width: 60,
                  child: Center(
                      child: Text(
                    "NEXT",
                    style:
                        GoogleFonts.alatsi(fontSize: 13, color: Colors.black),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return buildGridView();
          } else {
            return buildListView();
          }
        },
      ),
    );
  }

  Widget buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: GridView.builder(
        //  physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: _priceList.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected =
                _twodiceController.selectedIndices.contains(index);
            return InkWell(
              onTap: () {
                _twodiceController.toggleSelection(index);
              },
              child: PhysicalModel(
                elevation: 12,
                color: isSelected ? Colors.red.shade300 : Colors.grey.shade300,
                shadowColor: Colors.black,
                //clipBehavior: Clip.none,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          ),
                          fit: BoxFit.cover),

                      color: isSelected
                          ? Colors.red.shade100
                          : Colors.grey.shade300,
                      // boxShadow: [
                      //   BoxShadow(
                      //     offset: Offset(0, 0),
                      //     blurRadius: 1,
                      //     color: Color.fromRGBO(0, 0, 0, 0.16),
                      //   )
                      // ],
                      //borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PhysicalModel(
                          color: Colors.black,
                          elevation: 19,
                          shape: BoxShape.circle,
                          shadowColor: Colors.white,
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.21,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? Colors.red.shade300
                                      : Colors.white,
                                  // color: Colors.red.shade300,
                                  border: Border.all(color: Colors.white)),
                              child: Center(
                                  child: Text(
                                _priceList[index],
                                style: GoogleFonts.alatsi(
                                  fontSize: 19,
                                  //fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w200,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey.shade900,
                                ),
                              ))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget buildListView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 30),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _priceList.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected =
                _twodiceController.selectedIndices.contains(index);
            return InkWell(
              onTap: () {
                _twodiceController.toggleSelection(index);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PhysicalModel(
                  elevation: 12,
                  color:
                      isSelected ? Colors.red.shade300 : Colors.grey.shade300,
                  shadowColor: Colors.black,
                  //clipBehavior: Clip.none,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            ),
                            fit: BoxFit.cover),

                        color: isSelected
                            ? Colors.red.shade100
                            : Colors.grey.shade300,
                        // boxShadow: [
                        //   BoxShadow(
                        //     offset: Offset(0, 0),
                        //     blurRadius: 1,
                        //     color: Color.fromRGBO(0, 0, 0, 0.16),
                        //   )
                        // ],
                        //borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? Colors.red.shade300
                                      : Colors.white,
                                  // color: Colors.red.shade300,
                                  border: Border.all(color: Colors.white)),
                              child: Center(
                                  child: Text(
                                _priceList[index],
                                style: GoogleFonts.alatsi(
                                  fontSize: 19,
                                  //fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w200,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey.shade900,
                                ),
                              ))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget buildImageContainer(
      _priceList, double height, double width, bool isPortrait) {
    double containerHeight = isPortrait ? height * 0.2 : height * 0.4;
    double containerWidth = isPortrait ? width * 0.34 : width * 0.24;
    double containerHeight2 = isPortrait ? height * 0.2 : height * 0.4;
    double containerWidth2 = isPortrait ? width * 0.34 : width * 0.24;

    double containerHeight3 = isPortrait ? height * 0.04 : height * 0.08;
    double containerWidth3 = isPortrait ? width : width;

    return Padding(
      padding: EdgeInsets.all(6.0),
      child: PhysicalModel(
        elevation: 12,
        color: Colors.white,
        shadowColor: Colors.black,
        //clipBehavior: Clip.none,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: containerWidth2,
            height: containerHeight2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
              // image: DecorationImage(
              //   image: AssetImage(imagePath),
              //   fit: BoxFit.contain,
              // ),
            ),
            child: Column(
              children: [
                Container(
                    height: containerHeight * 0.6,
                    width: containerWidth * 0.7,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red.shade300,
                        border: Border.all(color: Colors.white)),
                    child: Center(
                        child: Text(
                      _priceList,
                      style: GoogleFonts.alata(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ))),
                Spacer(),
                Container(
                    height: containerHeight3 * 0.9,
                    width: containerWidth3 * 0.2,
                    decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child: Center(
                        child: Text(
                      "GO!",
                      style: GoogleFonts.alata(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ))),
                Spacer(),
                Container(
                    height: containerHeight3,
                    width: containerWidth3,
                    decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        border: Border.all(color: Colors.white)),
                    child: Center(
                        child: Text(
                      "Wining Amount",
                      style: GoogleFonts.alata(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    )))
              ],
            ),
            // Optionally, you can add a child widget here if needed
          ),
        ),
      ),
    );
  }
}
