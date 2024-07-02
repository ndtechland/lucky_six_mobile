import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../registrationscreen.dart';
import 'about.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitched = true;
  bool isSwitch = true;
  bool status = false;
  bool isSwitchOn = true;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playBackgroundMusic();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playBackgroundMusic() async {
    const url = 'https://angavastram.com/images/pirates_bgm.mp3';
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(UrlSource(url));

    if (isSwitched) {
      await _audioPlayer.play(UrlSource(url));
    } else {
      await _audioPlayer.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.topRight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.29,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backtable.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.0700,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.0900,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Image.asset(
                        "assets/images/settingtxt.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0500,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width * 0.24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/settbutton.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.0100,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigate to profile screen
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          width: MediaQuery.of(context).size.width * 0.0800,
                          child: Image.asset(
                            "assets/images/person1.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        "  Guest_63",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16 * MediaQuery.textScaleFactorOf(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0200,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.19,
                  width: MediaQuery.of(context).size.width * 0.24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/settbutton.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                _playBackgroundMusic();
                              });
                            },
                          ),
                          Switch(
                            value: isSwitch,
                            onChanged: (value) {
                              setState(() {
                                isSwitch = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "  Sound",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  14 * MediaQuery.textScaleFactorOf(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.0200,
                          ),
                          Text(
                            "Vibration",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  14 * MediaQuery.textScaleFactorOf(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0100,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => About(),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.0800,
                            width: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/about.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.0880,
                          width: MediaQuery.of(context).size.width * 0.12,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/button.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).viewInsets.left + 18,
                              top: MediaQuery.of(context).viewInsets.top + 8,
                            ),
                            child: Text(
                              "Support",
                              style: TextStyle(
                                color: Color(0xff470004),
                                fontSize:
                                    13 * MediaQuery.textScaleFactorOf(context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0200,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0200,
                    ),
                    InkWell(
                      onTap: () {
                        logoutapi();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.0880,
                        width: MediaQuery.of(context).size.width * 0.12,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/button.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).viewInsets.left + 18,
                            top: MediaQuery.of(context).viewInsets.top + 8,
                          ),
                          child: Text(
                            "Logout",
                            style: TextStyle(
                              color: Color(0xff470004),
                              fontSize:
                                  13 * MediaQuery.textScaleFactorOf(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.37,
            left: MediaQuery.of(context).size.width * 0.26,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.0950,
                width: MediaQuery.of(context).size.width * 0.0600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/cross.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  logoutapi() async {
    final useid = ''; // Replace with your user ID
    final resp = await http.get(
        Uri.parse('https://apponrent.co.in/rlg/api/logout.php?userid=$useid'));
    final data = jsonDecode(resp.body);
    print('anirudh');
    if (data['error'] == '200') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => registration()),
      );
    }
    print(data);
  }
}
