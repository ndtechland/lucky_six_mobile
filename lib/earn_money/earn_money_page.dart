import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constantt/responsive_container_text.dart';
import '../controllers_all/win_loss_list_controller.dart';

class EarnMoney extends StatelessWidget {
  EarnMoney({Key? key}) : super(key: key);

  GetWinLossListController _getWinLossListController =
      Get.put(GetWinLossListController());

  final List<String> items = [
    '22-06-2023',
    '23-07-2023',
    '22-10-2023',
    '23-12-2023',
    '03-02-2024',
    '02-03-2024',
    '01-04-2024',
    '24-05-2024',
    '22-02-2023',
    '23-04-2023',
  ];
  final List<String> items2 = [
    'Win',
    'Loose',
    'Loose',
    'Win',
    'Win',
    'Loose',
    'Loose',
    'Win',
    'Loose',
    'Win',
    'Loose'
  ];
  final List<String> items3 = [
    '200 Coins',
    '300 Coins',
    '400 Coins',
    '100 Coins',
    '200 Coins',
    '300 Coins',
    '400 Coins',
    '100 Coins',
    '700 Coins',
    '300 Coins',
    '500 Coins',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Obx(
        () => _getWinLossListController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/svg_images/ludobackwhite.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    OrientationBuilder(
                      builder: (context, orientation) {
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            return Column(
                              children: [
                                _buildHeader(context),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: _getWinLossListController
                                        .winlosslistModel
                                        ?.response
                                        ?.data
                                        ?.length,
                                    // items.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 0),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 3),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 20.0,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.0)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              responsiveContainer3(
                                                heightPortrait:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.080,
                                                widthPortrait:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                heightLandscape:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.16,
                                                widthLandscape:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      // String formattedDate = DateFormat('yyyy-MM-dd').format(createDate!);

                                                      Text(
                                                        DateFormat('yyyy-MM-dd')
                                                            .format(DateTime.parse(
                                                                _getWinLossListController
                                                                    .winlosslistModel!
                                                                    .response!
                                                                    .data![
                                                                        index]
                                                                    .createDate!
                                                                    .toString())),
                                                        // "${_getWinLossListController.winlosslistModel?.response?.data?[index].createDate}",
                                                        //_getWinLossListController.
                                                        // items[index],
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${_getWinLossListController.winlosslistModel?.response?.data?[index].gameStatus.toString()}",

                                                        //  items2[index],
                                                        style:
                                                            GoogleFonts.alata(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${_getWinLossListController.winlosslistModel?.response?.data?[index].amount.toString()}",

                                                        //
                                                        //items3[index],
                                                        style:
                                                            GoogleFonts.alata(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                context: context,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black54,
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Earned Money',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 50),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  child: ClipOval(
                    child: responsiveContainer(
                      heightPortrait: MediaQuery.of(context).size.height * 0.12,
                      widthPortrait: MediaQuery.of(context).size.width * 0.25,
                      heightLandscape:
                          MediaQuery.of(context).size.height * 0.20,
                      widthLandscape: MediaQuery.of(context).size.width * 0.10,
                      child: Image.asset(
                        'assets/images/svg_images/play_store_512.png',
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/svg_images/play_store_512.png',
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                      context: context,
                    ),
                  ),
                ),
                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 19,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.shade900),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(
                              'Total Earn Coins:',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "${_getWinLossListController.winlosslistModel?.totalErning.toString()}",
                              // ' 3800',
                              style: GoogleFonts.abyssinicaSil(
                                color: Colors.yellow.shade500,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showCustomModalBottomSheet(context);
                    // showModalBottomSheet(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return Container(
                    //       color: Colors.white30,
                    //       padding: EdgeInsets.all(16),
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Text(
                    //             'Redeem Coins',
                    //             style: GoogleFonts.abyssinicaSil(
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           SizedBox(height: 16),
                    //           Text(
                    //             'Choose your preferred method to redeem:',
                    //             textAlign: TextAlign.center,
                    //           ),
                    //           SizedBox(height: 16),
                    //           ListTile(
                    //             leading: Icon(Icons.account_balance),
                    //             title: Text('Bank Account'),
                    //             onTap: () {
                    //               Navigator.pop(context);
                    //               _showBankAccountDialog(context);
                    //             },
                    //           ),
                    //           ListTile(
                    //             leading: Icon(Icons.account_balance_wallet),
                    //             title: Text('UPI ID'),
                    //             onTap: () {
                    //               Navigator.pop(context);
                    //               _showUpiIdDialog(context);
                    //             },
                    //           ),
                    //         ],
                    //       ),
                    //     );
                    //   },
                    // );
                  },
                  child: Container(
                    height: 35,
                    width: 78,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Redeem Now',
                        style: GoogleFonts.abyssinicaSil(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void showCustomModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // Get screen orientation and dimensions
        final isLandscape =
            MediaQuery.of(context).orientation == Orientation.landscape;
        final screenWidth = MediaQuery.of(context).size.width;
        final containerWidth = isLandscape
            ? screenWidth * 0.7
            : screenWidth * 0.9; // Adjust width based on orientation

        return Container(
          width: containerWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(0, -3),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Redeem Coins',
                  style: GoogleFonts.abyssinicaSil(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Choose your preferred method to redeem:',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.abyssinicaSil(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: containerWidth * 0.8, // Fixed width for the buttons
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // Use transparent background
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(
                        color: Colors.white, // Border color
                        width: 1,
                      ),
                      elevation: 0, // Remove elevation
                    ).copyWith(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.black12],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: ListTile(
                          leading:
                              Icon(Icons.account_balance, color: Colors.white),
                          title: Text('Bank Account',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            Navigator.pop(context);
                            _showBankAccountDialog(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: containerWidth * 0.8, // Fixed width for the buttons
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // Use transparent background
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(
                        color: Colors.white, // Border color
                        width: 1,
                      ),
                      elevation: 0, // Remove elevation
                    ).copyWith(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.black12],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(Icons.account_balance_wallet,
                              color: Colors.white),
                          title: Text('UPI ID',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            Navigator.pop(context);
                            _showUpiIdDialog(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBankAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            bool isLandscape = constraints.maxWidth > constraints.maxHeight;

            return AlertDialog(
              backgroundColor:
                  Colors.grey[200], // Change dialog background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              titlePadding: EdgeInsets.only(top: 16, left: 16, right: 16),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bank Account Details',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.black87),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              content: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isLandscape ? 400 : double.infinity,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Account Holder Name',
                          labelStyle: TextStyle(color: Colors.black54),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Account Number',
                          labelStyle: TextStyle(color: Colors.black54),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'IFSC Code',
                          labelStyle: TextStyle(color: Colors.black54),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Cancel button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:
                              Colors.green, // Submit button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Close the Bank Account dialog
                          _showConfirmationDialog(
                              context); // Show confirmation dialog
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showUpiIdDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            bool isLandscape = constraints.maxWidth > constraints.maxHeight;

            return AlertDialog(
              backgroundColor:
                  Colors.grey[200], // Change dialog background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              titlePadding: EdgeInsets.only(
                  top: 16, left: 16, right: 16), // Adjust title padding
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'UPI ID Details',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.black87),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isLandscape ? 400 : double.infinity,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'UPI ID',
                          labelStyle: TextStyle(color: Colors.black54),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Confirm UPI ID',
                          labelStyle: TextStyle(color: Colors.black54),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Cancel button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(width: 8), // Spacing between buttons
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:
                              Colors.green, // Submit button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Close the UPI ID dialog
                          _showConfirmationDialog(
                              context); // Show confirmation dialog
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              Colors.grey[200], // Change confirmation dialog background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Confirm Submission',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          content: Text(
            'Are you sure you want to submit these details?',
            style: TextStyle(color: Colors.black54),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Cancel button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // Close the confirmation dialog
                    },
                  ),
                ),
                SizedBox(width: 8), // Spacing between buttons
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Confirm button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // Handle the confirmed submission here
                      Navigator.of(context)
                          .pop(); // Close the confirmation dialog
                      // Additional actions for confirmed submission can be added here
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
