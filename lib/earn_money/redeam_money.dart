import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Controllersss/profiles/edit_profile.dart';
import '../Controllersss/profiles/profile_controller.dart';
import '../constantt/responsive_button.dart';
import '../constantt/responsive_text_color.dart';

class RedeemeRequest extends StatefulWidget {
  const RedeemeRequest({Key? key}) : super(key: key);
  @override
  State<RedeemeRequest> createState() => _RedeemeRequestState();
}

class _RedeemeRequestState extends State<RedeemeRequest> {
  final ProfileController _getprofilee = Get.put(ProfileController());
  UserProfileUodateController _userProfileUodateController =
      Get.put(UserProfileUodateController());
  final ProfileController _profileController = Get.find();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumbercontroller = TextEditingController();
  final TextEditingController _upiid = TextEditingController();
  final TextEditingController _accountnumber = TextEditingController();
  final TextEditingController _ifsc = TextEditingController();
  final TextEditingController _bankname = TextEditingController();

  Uint8List? _cvFileContent2;

  @override
  void initState() {
    super.initState();
    if (_getprofilee.getprofileModel != null) {
      _nameController.text = _getprofilee.getprofileModel!.response!.fullName!;
      _emailController.text = _getprofilee.getprofileModel!.response!.emailId!;
      _mobileNumbercontroller.text =
          _getprofilee.getprofileModel!.response!.mobileNumber.toString();
      _upiid.text =
          _getprofilee.getprofileModel!.response!.dateofbirth.toString();
      _accountnumber.text = _getprofilee.getprofileModel!.response!.experience!;
      _ifsc.text = _getprofilee.getprofileModel!.response!.address!;
      _bankname.text =
          _getprofilee.getprofileModel!.response!.pincode.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/svg_images/ludobackblack.png",
            fit: BoxFit.cover,
          ),
          Obx(
            () => (_getprofilee.isLoading.isFalse)
                ? Center(child: CircularProgressIndicator())
                : Form(
                    key: _userProfileUodateController.userprifileFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildHeader(),
                          SizedBox(
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 10
                                  : 8),
                          // Container(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 16, vertical: 16),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       blackHeadingSmall(
                          //           'Basic Informations'.toUpperCase(),
                          //       ),
                          //       GestureDetector(
                          //           onTap: () async {
                          //             await _profileController.profileApi();
                          //             _profileController.update();
                          //             await Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                     builder: (context) => Profile()));
                          //           },
                          //           child: appcolorText('View'))
                          //     ],
                          //   ),
                          // ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            margin: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20.0,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  readOnly: true,
                                  keyboardType: TextInputType.name,
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Account Holder Name',
                                    suffixIcon: Icon(
                                      Icons.person,
                                      size: 23,
                                      color: Colors.black12,
                                    ),
                                    labelStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: appColor),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                                    controller: _mobileNumbercontroller,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.phone,
                                        size: 23,
                                        color: Colors.black12,
                                      ),
                                      labelText: "Phone Number",
                                      hintStyle: (TextStyle(
                                        fontSize: 13,
                                      )),
                                      labelStyle: const TextStyle(
                                          color: Colors.black54, fontSize: 13),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: appColor),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.email,
                                        size: 23,
                                        color: Colors.black12,
                                      ),
                                      labelText: "Email",
                                      hintStyle: (TextStyle(
                                        fontSize: 13,
                                      )),
                                      labelStyle: const TextStyle(
                                          color: Colors.black54, fontSize: 13),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: appColor),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  child: TextFormField(
                                    readOnly: true,
                                    controller: _accountnumber,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Account Number';
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      //chooseDate();
                                    },
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.pin,
                                        size: 23,
                                        color: Colors.black12,
                                      ),
                                      labelText: "Account Number",
                                      hintStyle: (TextStyle(
                                        fontSize: 13,
                                      )),
                                      labelStyle: const TextStyle(
                                          color: Colors.black54, fontSize: 13),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: appColor),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  child: TextFormField(
                                    controller: _ifsc,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.code_sharp,
                                        size: 23,
                                        color: Colors.black12,
                                      ),
                                      labelText: "Ifsc",
                                      hintStyle: (TextStyle(
                                        fontSize: 13,
                                      )),
                                      labelStyle: const TextStyle(
                                          color: Colors.black54, fontSize: 13),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: appColor),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  child: TextFormField(
                                    controller: _bankname,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.account_balance,
                                        size: 23,
                                        color: Colors.black12,
                                      ),
                                      labelText: "Bank Name",
                                      hintStyle: (TextStyle(
                                        fontSize: 13,
                                      )),
                                      labelStyle: const TextStyle(
                                          color: Colors.black54, fontSize: 13),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: appColor),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  child: TextFormField(
                                    controller: _upiid,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.perm_identity,
                                        size: 23,
                                        color: Colors.black12,
                                      ),
                                      labelText: "UPI ID",
                                      hintStyle: (TextStyle(
                                        fontSize: 13,
                                      )),
                                      labelStyle: const TextStyle(
                                          color: Colors.black54, fontSize: 13),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: appColor),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? 4
                                  : 4),

                          ///profile....

                          SizedBox(height: 10),

                          MyElevatedButton(
                            onPressed: () {
                              // Ensure date is formatted correctly
                              // String formattedDateOfBirth = formatDateOfBirth(
                              //     _dateOfBirthController.text);

                              // _userProfileUodateController.updateUseerrProfile(
                              //   fullName: _nameController.text,
                              //   emailID: _emailController.text,
                              //   mobileNumber: _mobileNumbercontroller.text,
                              //   experience: _experienceController.text,
                              //   dateofbirth: formattedDateOfBirth,
                              //   address: _addressController.text,
                              //   pincode: _pincodeController.text,
                              //   cvFileContent2:
                              //   _cvFileContent2!, // Pass file content
                              //   // Pass PAN file name
                              // );
                            },
                            text: Text('Request'),
                            height: 40,
                            width: 200,
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 0),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[appColor2, appColor]),
        ),
        child: Column(
          children: [
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                      // Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white)),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Redeem Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'medium',
                          fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 40)
              ],
            ),
          ],
        ));
  }
}
