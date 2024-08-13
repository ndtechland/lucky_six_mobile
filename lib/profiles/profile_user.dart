import 'package:flutter/material.dart';
import 'package:game_app/constantt/color_text.dart';
import 'package:get/get.dart';

import '../constantt/responsive_container_text.dart';
import '../controllers_all/get_profile_controller.dart';
import 'update_profile.dart';

class Profileuserr extends StatelessWidget {
  //final ProfileController _getprofilee = Get.put(ProfileController());
  final UserProfilesController _userProfilesController =
      Get.put(UserProfilesController());

  Profileuserr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/svg_images/ludobackblack.png'
            //'assets/images/svg_images/backgroundddice.jpeg'
            ,
            fit: BoxFit.cover,
          ),
          Obx(
            () => (_userProfilesController.isLoading.value)
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(children: [
                      _buildHeader(context),
                      SizedBox(
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 100
                              : 8),
                      // const SizedBox(height: 8) adjusted based on orientation
                      //const SizedBox(height: 8),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          margin: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 0),
                          decoration: BoxDecoration(
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
                              responsiveContainer2(
                                heightPortrait:
                                    MediaQuery.of(context).size.height * 0.055,
                                widthPortrait:
                                    MediaQuery.of(context).size.width,
                                heightLandscape:
                                    MediaQuery.of(context).size.height * 0.09,
                                widthLandscape:
                                    MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Name:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'medium',
                                            color: Colors.grey.shade600),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Obx(
                                        () => (_userProfilesController
                                                .isLoading.value)
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : Text(
                                                "${_userProfilesController.profileModel?.profile?.userName.toString()}",
                                                //"Kumar Prince",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'medium',
                                                    color: Colors.black),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                                context: context,
                              ),
                              Divider(
                                color: Colors.grey.shade400,
                              ),
                              responsiveContainer2(
                                heightPortrait:
                                    MediaQuery.of(context).size.height * 0.055,
                                widthPortrait:
                                    MediaQuery.of(context).size.width,
                                heightLandscape:
                                    MediaQuery.of(context).size.height * 0.09,
                                widthLandscape:
                                    MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Email:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'medium',
                                            color: Colors.grey.shade600),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Obx(
                                        () => (_userProfilesController
                                                .isLoading.value)
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : Text(
                                                "${_userProfilesController.profileModel?.profile?.email.toString()}",
                                                //"Kumar Prince",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'medium',
                                                    color: Colors.black),
                                              ),
                                      ),
                                      // Text(
                                      //   "kumar@gmail.com",
                                      //   style: TextStyle(
                                      //       fontSize: 13,
                                      //       fontFamily: 'medium',
                                      //       color: Colors.black),
                                      // ),
                                    ],
                                  ),
                                ),
                                context: context,
                              ),
                              Divider(
                                color: Colors.grey.shade400,
                              ),
                              responsiveContainer2(
                                heightPortrait:
                                    MediaQuery.of(context).size.height * 0.055,
                                widthPortrait:
                                    MediaQuery.of(context).size.width,
                                heightLandscape:
                                    MediaQuery.of(context).size.height * 0.09,
                                widthLandscape:
                                    MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Phone:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'medium',
                                            color: Colors.grey.shade600),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Obx(
                                        () => (_userProfilesController
                                                .isLoading.value)
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : Text(
                                                "${_userProfilesController.profileModel?.profile?.userName.toString()}",
                                                //"Kumar Prince",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'medium',
                                                    color: Colors.black),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                                context: context,
                              ),
                              Divider(
                                color: Colors.grey.shade400,
                              ),
                              responsiveContainer2(
                                heightPortrait:
                                    MediaQuery.of(context).size.height * 0.055,
                                widthPortrait:
                                    MediaQuery.of(context).size.width,
                                heightLandscape:
                                    MediaQuery.of(context).size.height * 0.09,
                                widthLandscape:
                                    MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "DOB:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'medium',
                                            color: Colors.grey.shade600),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "12/12/2002",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'medium',
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                context: context,
                              ),
                              Divider(
                                color: Colors.grey.shade400,
                              ),
                              responsiveContainer2(
                                heightPortrait:
                                    MediaQuery.of(context).size.height * 0.055,
                                widthPortrait:
                                    MediaQuery.of(context).size.width,
                                heightLandscape:
                                    MediaQuery.of(context).size.height * 0.09,
                                widthLandscape:
                                    MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Address:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'medium',
                                            color: Colors.grey.shade600),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.63,
                                        child: Align(
                                          child: responsiveText(
                                            text:
                                                "Noida sector 15, near priya gold office",
                                            fontSizeLandscape:
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.033,
                                            fontSizePortrait:
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.015,
                                            context: context,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                context: context,
                              ),
                              Divider(
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    //const SizedBox(height: 20),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[appColor, appColor2],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'medium',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 0),
              IconButton(
                onPressed: () async {
                  _userProfilesController.userprofileApi();
                  _userProfilesController.update();
                  await Get.to(EditProfile());
                },
                icon: const Icon(Icons.edit, color: Colors.white),
              ),
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Container(
                width: 90.0,
                height: 90.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/svg_images/rlg.jpg'),
                    // _getprofilee
                    //             .getprofileModel?.response!.profileImage !=
                    //         null
                    //     ? NetworkImage(_getprofilee
                    //         .getprofileModel!.response!.profileImage
                    //         .toString())
                    //     : AssetImage(
                    //         'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 8),
          // Text(
          //   "Kumar Prince",
          //   style: TextStyle(
          //       fontSize: 18, fontFamily: 'medium', color: Colors.white),
          // ),
          // const SizedBox(height: 8),
          // Text(
          //   "kumar@gmail.com",
          //   style: TextStyle(fontSize: 14, color: Colors.white),
          // ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
