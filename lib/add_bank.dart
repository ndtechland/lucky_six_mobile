import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controllersss/profiles/edit_profile.dart';
import '../constantt/responsive_text_color.dart';
import 'controllers_all/get_bank_controller.dart';
import 'controllers_all/get_profile_controller.dart';
import 'controllers_all/update_bank_controller.dart';

class AddBank extends StatefulWidget {
  const AddBank({Key? key}) : super(key: key);
  @override
  State<AddBank> createState() => _AddBankState();
}

class _AddBankState extends State<AddBank> {
  final UserProfilesController _getprofilee = Get.put(UserProfilesController());
  UserProfileUodateController _userProfileUodateController =
      Get.put(UserProfileUodateController());
  final UserProfilesController _profileController = Get.find();

  GetBankDEtailsController _getBankDEtailsController =
      Get.put(GetBankDEtailsController());

  BankUpdateController _bankUpdateController = Get.put(BankUpdateController());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumbercontroller = TextEditingController();
  final TextEditingController _upiid = TextEditingController();
  final TextEditingController _accountnumber = TextEditingController();
  final TextEditingController _ifsc = TextEditingController();
  final TextEditingController _bankname = TextEditingController();
  final TextEditingController _bankaddress = TextEditingController();

  Uint8List? _cvFileContent2;

  @override
  void initState() {
    super.initState();
    if (_getBankDEtailsController.getbankModel != null) {
      _nameController.text = _getBankDEtailsController
          .getbankModel!.bankDetail!.accountHolderName!
          .toString();
      _emailController.text =
          _getBankDEtailsController.getbankModel!.bankDetail!.email!;
      _mobileNumbercontroller.text =
          _getBankDEtailsController.getbankModel!.bankDetail!.phone!.toString();
      _upiid.text =
          _getBankDEtailsController.getbankModel!.bankDetail!.upiId!.toString();
      //_accountnumber.text = _getprofilee.getprofileModel!.profile!.experience!;
      _ifsc.text = _getBankDEtailsController.getbankModel!.bankDetail!.ifsc!;
      _bankname.text = _getBankDEtailsController
          .getbankModel!.bankDetail!.bankName!
          .toString();
      _accountnumber.text = _getBankDEtailsController
          .getbankModel!.bankDetail!.accountNo!
          .toString();
      _bankaddress.text = _getBankDEtailsController
          .getbankModel!.bankDetail!.address!
          .toString();
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
            () => (_getBankDEtailsController.isLoading.value)
                ? Center(child: CircularProgressIndicator())
                : Form(
                    key: _bankUpdateController.updatebankFormKey,
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
                                  //readOnly: true,
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
                                    //readOnly: true,
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
                                    controller: _bankaddress,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.pin_drop_outlined,
                                        size: 23,
                                        color: Colors.black12,
                                      ),
                                      labelText: "Branch Address",
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
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.portrait
                                            ? 25
                                            : 10),
                                ElevatedButton(
                                  onPressed: () async {
                                    // Only use userId for updating bank details
                                    // final String userId =
                                    //     _getprofilee.profileModel!.profile!.id!;

                                    await _bankUpdateController
                                        .updateBankDetails(
                                      //userId: userId,
                                      accountHolderName: _nameController.text,
                                      email: _emailController.text,
                                      phone: _mobileNumbercontroller.text,
                                      upiId: _upiid.text,
                                      accountNo: _accountnumber.text,
                                      ifsc: _ifsc.text,
                                      bankName: _bankname.text,
                                      address: _bankaddress.text,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(size.width, 45),
                                    backgroundColor: appColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: const Text(
                                    'Update Details',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.portrait
                                            ? 15
                                            : 8),
                              ],
                            ),
                          ),
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
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? 150
          : 145,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red.shade600,
            Colors.red.shade200,

            //const Color(0xFF1B7DAF).withOpacity(0.9)
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Bank Details",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Update your Bank Information",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
