import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../const.dart';
import 'PlayNow/playnow.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/backgroundhome2.jpg"),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.228,
                width: MediaQuery.of(context).size.width * 0.26,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    image: DecorationImage(
                        image: AssetImage("assets/images/infobrown1.png"),
                        fit: BoxFit.fill)),
                child: Row(
                  children: [
                    ///add profile Image...local...start..

                    Image.asset(
                      "assets/images/person1.png",
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.0700,
                      fit: BoxFit.fill,
                    ),

                    ///add profile Image...local...end..

                    ///todo: 3 may 2024...profile view details..
                    // InkWell(
                    //     onTap: () {
                    //       showDialog(
                    //           context: context,
                    //           builder: (BuildContext context) => Profile(
                    //               image: pro['photo'],
                    //               name: pro['name'],
                    //               id: pro['id']));
                    //     },
                    //     child: pro == null
                    //         ? Image.asset(
                    //             "assets/images/person1.png",
                    //             height:
                    //                 MediaQuery.of(context).size.height * 0.12,
                    //             width:
                    //                 MediaQuery.of(context).size.width * 0.0800,
                    //             fit: BoxFit.fill,
                    //           )
                    //         : pro['photo'] == null
                    //             ? Image.asset(
                    //                 "assets/images/person1.png",
                    //                 height: MediaQuery.of(context).size.height *
                    //                     0.12,
                    //                 width: MediaQuery.of(context).size.width *
                    //                     0.0800,
                    //                 fit: BoxFit.fill,
                    //               )
                    //             : Image.network(
                    //                 pro['photo'],
                    //                 height: MediaQuery.of(context).size.height *
                    //                     0.12,
                    //                 width: MediaQuery.of(context).size.width *
                    //                     0.0800,
                    //                 fit: BoxFit.fill,
                    //               )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kumar Prince",
                          // pro == null ? "  " : "  " + pro['name'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  17 * MediaQuery.textScaleFactorOf(context),
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0100),
                            Image.asset(
                              "assets/images/gicon.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.0550,
                              width: MediaQuery.of(context).size.width * 0.0350,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              "Bronze Club",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 14 *
                                      MediaQuery.textScaleFactorOf(context),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/line.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.0150,
                              width: MediaQuery.of(context).size.width * 0.15,
                              fit: BoxFit.fill,
                            ),
                            InkWell(
                                onTap: () {
                                  ///todo: get information.....
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (BuildContext context) =>
                                  //         Info());
                                },
                                child: Image.asset(
                                  "assets/images/i3.png",
                                  height: MediaQuery.of(context).size.height *
                                      0.0600,
                                  width: MediaQuery.of(context).size.width *
                                      0.0300,
                                  fit: BoxFit.fill,
                                )),
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    0.00300),
                            Image.asset(
                              "assets/images/roulette.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.0400,
                              width: MediaQuery.of(context).size.width * 0.0300,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              pro == null
                                  ? "  "
                                  : pro['wallet'] == null
                                      ? "  0"
                                      : "  " + pro['wallet'],
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 13 *
                                      MediaQuery.textScaleFactorOf(context),
                                  fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              "assets/images/hammer.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.0350,
                              width: MediaQuery.of(context).size.width * 0.0300,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              pro == null
                                  ? "  "
                                  : pro['hammer'] == ''
                                      ? " 0"
                                      : "  " + pro['hammer'],
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 13 *
                                      MediaQuery.textScaleFactorOf(context),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewInsets.top + 1,
                    left: MediaQuery.of(context).viewInsets.left + 80),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.26,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image: AssetImage("assets/images/rlg.jpg"),
                          fit: BoxFit.fill)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              InkWell(
                onTap: () {
                  ///todo:comented 3 may ....2024....prince
                  // showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) => Star());
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.0700,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/star.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              InkWell(
                onTap: () {
                  ///todo:comented 3 may ....2024....prince
                  // showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) => Mail());
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.0600,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/mail.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              InkWell(
                onTap: () {
                  ///todo:comented 3 may ....2024....prince

                  // showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) => Setting());
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: MediaQuery.of(context).size.width * 0.0640,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/setting.png"),
                          fit: BoxFit.fill)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.39,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.0400,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Play_Now()));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.19,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/playnow.png"),
                                    fit: BoxFit.fill)),
                            child: Center(
                              child: Image.asset(
                                "assets/images/PlaynowText.png",
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width * 0.20,
                              ),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.0400,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Play_Now()));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.19,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/nolimittable.png"),
                                    fit: BoxFit.fill)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context)
                                            .viewInsets
                                            .right +
                                        10),
                                child: Image.asset(
                                  "assets/images/nolimittext.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.0400,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => Play_Now());
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.19,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        //"assets/images/playnow.png",
                                        "assets/images/variation6.png"),
                                    fit: BoxFit.fill)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).viewInsets.top +
                                        35,
                                    left:
                                        MediaQuery.of(context).viewInsets.left +
                                            4),
                                child: Image.asset(
                                  "assets/images/variationtxt.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.16,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.0400,
                      ),
                      InkWell(
                        onTap: () {
                          ///todo:comented 3 may ....2024....prince

                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => chips_bank()));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.19,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/chipsbank.png"),
                                    fit: BoxFit.fill)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).viewInsets.top +
                                        55,
                                    left:
                                        MediaQuery.of(context).viewInsets.left +
                                            8),
                                child: Image.asset(
                                  "assets/images/chipsbanktext.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.20,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.0400,
                      ),
                      InkWell(
                        onTap: () {
                          ///todo:comented 3 may ....2024....prince

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Tournament()));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.19,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/tournament.png"),
                                    fit: BoxFit.fill)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).viewInsets.top +
                                        53,
                                    right: MediaQuery.of(context)
                                            .viewInsets
                                            .right +
                                        6),
                                child: Image.asset(
                                  "assets/images/tournamenttext.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.16,
                                  width:
                                      MediaQuery.of(context).size.width * 0.18,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.0300,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     showDialog(
                      //         context: context,
                      //         builder: (BuildContext context) =>
                      //             Private_table());
                      //   },
                      //   child: Container(
                      //       width: MediaQuery.of(context).size.width * 0.19,
                      //       decoration: BoxDecoration(
                      //           image: DecorationImage(
                      //               image: AssetImage(
                      //                 "assets/images/privatetable.png",
                      //               ),
                      //               fit: BoxFit.cover)),
                      //       child: Center(
                      //         child: Image.asset(
                      //           "assets/images/privatetabletext.png",
                      //           height:
                      //               MediaQuery.of(context).size.height * 0.23,
                      //           width: MediaQuery.of(context).size.width * 0.23,
                      //         ),
                      //       )),
                      // ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.0300,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.0450,
          ),
          Container(
            height: MediaQuery.of(context).size.width * 0.0840,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bottombar1.png"),
                  fit: BoxFit.cover),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).viewInsets.left + 18,
                        top: MediaQuery.of(context).viewInsets.top + 7),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/images/bottom1.png"),
                              fit: BoxFit.cover),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).viewInsets.left +
                                      2,
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom +
                                          5),
                              child: Image.asset(
                                "assets/images/trophy.png",
                                height:
                                    MediaQuery.of(context).size.height * 0.0700,
                                width:
                                    MediaQuery.of(context).size.width * 0.0600,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context)
                                              .viewInsets
                                              .top +
                                          3),
                                  child: Text(
                                    "Bonus",
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 12 *
                                            MediaQuery.textScaleFactorOf(
                                                context),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "01:20:30",
                                  style: TextStyle(
                                      color: Colors.amberAccent,
                                      fontSize: 13 *
                                          MediaQuery.textScaleFactorOf(context),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ///todo:comented 3 may ....2024....prince

                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) => Store());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).viewInsets.top + 8),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/images/bottom1.png"),
                              fit: BoxFit.cover),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).viewInsets.left +
                                      10,
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom +
                                          4),
                              child: Image.asset(
                                "assets/images/roulette.png",
                                height:
                                    MediaQuery.of(context).size.height * 0.0700,
                                width:
                                    MediaQuery.of(context).size.width * 0.0450,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text(
                              "Buy Chips",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 13 *
                                      MediaQuery.textScaleFactorOf(context),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ///todo:comented 3 may ....2024....prince

                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) => Free_chips());
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.width * 0.10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/freechips.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ///todo:comented 3 may ....2024....prince

                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) => Gift());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).viewInsets.top + 8),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width * 0.10,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/gift.png"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ///todo:comented 3 may ....2024....prince

                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) => Friends());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).viewInsets.top + 8),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width * 0.11,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/friend.png"))),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ///todo:comented 3 may ....2024....prince

                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) => transaction());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).viewInsets.top + 6),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width * 0.0700,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/withdraw1.png"))),
                      ),
                    ),
                  ),
                ]),
          )
        ],
      ),
    ));
  }

  @override
  void initState() {
    profile();
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  var pro;
  profile() async {
    final response = await http.get(Uri.parse(ApiConst.baseurl + "view/2"));
    final data = jsonDecode(response.body);
    print(data);
    setState(() {
      pro = data['data'];
    });
    print('laaaaaaa');
    print(pro);
  }
}
