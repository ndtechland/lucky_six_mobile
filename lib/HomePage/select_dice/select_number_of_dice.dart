import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controllersss/home_controllers.dart';
import '../../Controllersss/rezaypay_controller/pay_amount_controller.dart';

class NumberSelection extends StatelessWidget {
  static const String id = 'Company';

  final HomeeeController _homeeeController = Get.put(HomeeeController());
  final RozarpayamountController _rozarpayamountController =
      Get.put(RozarpayamountController());

  final List<String> _priceList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ];

  final List<String> _diceImages2 = [
    'assets/images/dice1.png',
    'assets/images/dice2.png',
    'assets/images/dice3.png',
    'assets/images/dice4.png',
    'assets/images/dice5.png',
    'assets/images/dice6.png',
  ];

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.red.shade300,
        title: Text('Select Number'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            child: GestureDetector(
              onTap: () {
                // Get.to(Play_Now());

                ///todo downward sshow dilog
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
                              "Your Selected dice is  1,3,4 \n You have to pay your payable Amount for start your game and your payable Amount is\n ₹300.",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
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
                          _rozarpayamountController.openCheckout();
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
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          // Content
          OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return buildGridView();
              } else {
                return buildListView();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: _priceList.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected = _homeeeController.selectedIndices.contains(index);
            return InkWell(
              onTap: () {
                _homeeeController.toggleSelection(index);
              },
              child: PhysicalModel(
                elevation: 12,
                color: isSelected ? Colors.red.shade300 : Colors.grey.shade300,
                shadowColor: Colors.black,
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
                      // image: DecorationImage(
                      //   image: NetworkImage(
                      //     "https://images.unsplash.com/photo-1681040488449-5a445633bb7e?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      //   ),
                      //   fit: BoxFit.cover,
                      // ),
                      color: isSelected
                          ? Colors.red.shade100
                          : Colors.grey.shade300,
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
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Text(
                                _priceList[index],
                                style: GoogleFonts.alatsi(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w200,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey.shade900,
                                ),
                              ),
                            ),
                          ),
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
        itemCount: _diceImages2.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected = _homeeeController.selectedIndices.contains(index);
            return InkWell(
              onTap: () {
                _homeeeController.toggleSelection(index);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PhysicalModel(
                  elevation: 12,
                  color:
                      isSelected ? Colors.red.shade300 : Colors.grey.shade300,
                  shadowColor: Colors.black,
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
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Text(
                                _priceList[index],
                                style: GoogleFonts.alatsi(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w200,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey.shade900,
                                ),
                              ),
                            ),
                          ),
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
}
