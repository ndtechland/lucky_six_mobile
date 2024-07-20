import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Controllersss/profiles/edit_profile.dart';
import '../Controllersss/profiles/profile_controller.dart';
import '../constantt/responsive_button.dart';
import '../constantt/responsive_text_color.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ProfileController _getprofilee = Get.put(ProfileController());
  UserProfileUodateController _userProfileUodateController =
      Get.put(UserProfileUodateController());
  final ProfileController _profileController = Get.find();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumbercontroller = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  Uint8List? _cvFileContent2;

  @override
  void initState() {
    super.initState();
    if (_getprofilee.getprofileModel != null) {
      _nameController.text = _getprofilee.getprofileModel!.response!.fullName!;
      _emailController.text = _getprofilee.getprofileModel!.response!.emailId!;
      _mobileNumbercontroller.text =
          _getprofilee.getprofileModel!.response!.mobileNumber.toString();
      _dateOfBirthController.text = formatDateOfBirth(
          _getprofilee.getprofileModel!.response!.dateofbirth.toString());
      _experienceController.text =
          _getprofilee.getprofileModel!.response!.experience!;
      _addressController.text =
          _getprofilee.getprofileModel!.response!.address!;
      _pincodeController.text =
          _getprofilee.getprofileModel!.response!.pincode.toString();
    }
  }

  String formatDateOfBirth(String dateOfBirthString) {
    try {
      DateFormat inputFormat = DateFormat("dd/MM/yyyy");
      DateTime dateOfBirth = inputFormat.parse(dateOfBirthString);
      DateFormat outputFormat = DateFormat("dd-MM-yyyy");
      return outputFormat.format(dateOfBirth);
    } catch (e) {
      try {
        DateFormat inputFormat = DateFormat("yyyy-MM-dd");
        DateTime dateOfBirth = inputFormat.parse(dateOfBirthString);
        DateFormat outputFormat = DateFormat("dd-MM-yyyy");
        return outputFormat.format(dateOfBirth);
      } catch (e) {
        print('Error parsing date: $e');
        return dateOfBirthString;
      }
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
            //'assets/images/svg_images/backgroundddice.jpeg',
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
                                  ? 100
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
                                    labelText: 'Name',
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
                                    controller: _dateOfBirthController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter DOB';
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      //chooseDate();
                                    },
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.calendar_today,
                                        size: 23,
                                        color: Colors.black12,
                                      ),
                                      labelText: "Date Of Birth",
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
                                    controller: _addressController,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.pin_drop_outlined,
                                        size: 23,
                                        color: Colors.black12,
                                      ),
                                      labelText: "Address",
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
                                    controller: _pincodeController,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.pin,
                                        size: 23,
                                        color: Colors.black12,
                                      ),
                                      labelText: "Pin",
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
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 06),
                              child: Row(
                                children: [
                                  // Expanded widget to ensure the TextField takes the remaining width
                                  Expanded(
                                    child: TextFormField(
                                      readOnly: true,

                                      //  controller: _profileFilePathController,
                                      decoration: InputDecoration(
                                          labelText: 'Profile Image'),
                                      enabled: false,
                                    ),
                                  ),
                                  SizedBox(width: 10),

                                  // Add some spacing between the TextField and the Button
                                  Container(
                                    width: 80,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () => Container(),
                                      //_selectCVFile2(context),
                                      // _checkAndRequestPermissions2(
                                      // context), // Use a lambda function
                                      style: ElevatedButton.styleFrom(
                                        primary: appColor, // Button color
                                        onPrimary: Colors.white, // Text color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Rounded corners
                                        ),
                                      ),
                                      child: Text(
                                        'Profile\n Image',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 10),

                          MyElevatedButton(
                            onPressed: () {
                              // Ensure date is formatted correctly
                              String formattedDateOfBirth = formatDateOfBirth(
                                  _dateOfBirthController.text);

                              _userProfileUodateController.updateUseerrProfile(
                                fullName: _nameController.text,
                                emailID: _emailController.text,
                                mobileNumber: _mobileNumbercontroller.text,
                                experience: _experienceController.text,
                                dateofbirth: formattedDateOfBirth,
                                address: _addressController.text,
                                pincode: _pincodeController.text,
                                cvFileContent2:
                                    _cvFileContent2!, // Pass file content
                                // Pass PAN file name
                              );
                            },
                            text: Text('Update'),
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
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[appColor2, appColor]),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
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
                      'Edit Profile',
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
