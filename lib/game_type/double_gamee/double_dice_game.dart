import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../HomePage/PlayNow/guestprofile.dart';
import '../../HomePage/animation/test_2.dart';
import '../../transation/userborer.dart';
import 'dice_animation2.dart';

///import 'package:provider/provider.dart';
///

class Play_Now_2dice extends StatefulWidget {
  const Play_Now_2dice({Key? key}) : super(key: key);

  @override
  State<Play_Now_2dice> createState() => _Play_Now_2diceState();
}

class _Play_Now_2diceState extends State<Play_Now_2dice> {
  bool isSwitched = true;
  Color _textColor = Colors.green;
  Color _appBarColor = Colors.green;
  bool status = true;
  bool isSwitchOn = true;

  late AudioPlayer _audioPlayer;
  Timer? _startTimer;
  Timer? _stopTimer;
  late Timer _speedTimer;

  ///

  // @override
  // void dispose() {
  //   //_audioPlayer.dispose();
  //   super.dispose();
  // }

  ///

  // @override
  // void initState() {
  //   // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   //   showTimerDialog(context);
  //   // });
  //
  //   ///AnimatedImageContainer();
  //   tablecreate();
  //   // TODO: implement initState
  //   super.initState();
  // }

  var pos;
  var players;
  var player1;
  var postion = 0;
  var player2;
  var player3;
  var player4;
  var player5;
  var table;
  int useid = 25;
  int gid = 2;
  tablecreate() async {
    final prefs1 = await SharedPreferences.getInstance();
    setState(() {
      useid = prefs1.getInt('user_id') ?? 0;
    });
    print(
        "https://apponrent.co.in/rlg/api/game3.php?game_id=$gid&user_id=$useid");
    final response = await http.get(Uri.parse(
        "https://apponrent.co.in/rlg/api/game3.php?game_id=$gid&user_id=$useid"));
    setState(() {
      pos = jsonDecode(response.body);
      players = pos['data'];
      postion = pos['position'];
      table = pos['Tableno'];
      print(pos);
      print('radhe shyam');
      if (postion.toString() == '1') {
        print('radhe radhe');
        player1 = 0;
        player2 = 1;
        player3 = 2;
        player4 = 3;
        player5 = 4;
      } else if (postion.toString() == '2') {
        print('radhe radhe');
        player1 = 1;
        player2 = 2;
        player3 = 3;
        player4 = 4;
        player5 = 0;
      } else if (postion.toString() == '3') {
        print('radhe radhe');
        player1 = 2;
        player2 = 3;
        player3 = 4;
        player4 = 0;
        player5 = 1;
      } else if (postion.toString() == '4') {
        print('radhe radhe');
        player1 = 3;
        player2 = 4;
        player3 = 0;
        player4 = 1;
        player5 = 2;
      } else {
        print('radhe radhe');
        player1 = 4;
        player2 = 0;
        player3 = 1;
        player4 = 2;
        player5 = 3;
      }
    });
    cardcreate();
    print('pankaj');
    print(pos);
    print(players);
  }

  ///todo:.........sacsaca......

  var carddata;
  cardcreate() async {
    final response = await http.get(Uri.parse(
        "https://apponrent.co.in/rlg/api/cardrandom.php?tableno=$table&gameid=$gid"));
    final dta = jsonDecode(response.body);
    setState(() {
      carddata = dta['data'];
    });
    print("efefdd");
    print(carddata);
  }

  ///todo:..................................
  var refdata;
  refreshcreate() async {
    print(
        'https://apponrent.co.in/rlg/api/tabledata.php?tableno=$table&gameid=$gid');
    final response = await http.get(Uri.parse(
        "https://apponrent.co.in/rlg/api/tabledata.php?tableno=$table&gameid=$gid"));
    final dta = jsonDecode(response.body);
    setState(() {
      refdata = dta['data'];
    });
    print('data');
    print(refdata);
  }

  chaalblind() async {
    final resp = await http.get(Uri.parse(
        'https://apponrent.co.in/rlg/api/chal.php?user_id=$useid&amount=$chaal&tableno=$table&gameid=$gid'));
    final data = jsonDecode(resp.body);
    print('anirudh');

    print(data);
  }

  packapi() async {
    setState(() {
      pack = true;
    });
    final resp = await http.get(Uri.parse(
        'https://apponrent.co.in/rlg/api/pack.php?user_id=$useid&tableno=$table&&gameid=$gid'));
    final data = jsonDecode(resp.body);
    print('anirudh');

    print(data);
  }

  chaalamount() async {
    final resp = await http.get(Uri.parse(
        'https://apponrent.co.in/rlg/api/chal_amount.php?user_id=$useid&tableno=$table&gameid=$gid'));
    final data = jsonDecode(resp.body);
    setState(() {
      chaal = data['chal_amount'];
    });
    print('anirudh');

    print(data);
  }

  nextpos() async {
    final resp = await http.get(Uri.parse(
        'https://apponrent.co.in/rlg/api/next_position.php?user_id=$useid&tableno=$table&gameid=$gid'));
    final data = jsonDecode(resp.body);
    setState(() {
      nextposition = data['nextposition'];
    });
  }

  ///todo:..................
  lastpos() async {
    final resp = await http.get(Uri.parse(
        'https://apponrent.co.in/rlg/api/next_position.php?user_id=$useid&tableno=$table&gameid=$gid'));
    final data = jsonDecode(resp.body);
    setState(() {
      lastposition = data['lastposition'];
    });
  }

  ///todo:................

  String nextposition = '';
  String lastposition = '';

  @override
  Widget build(BuildContext context) {
    // final musicController = Provider.of<MusicController>(context);

    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            // top: 10,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ///table.....
                Positioned(
                    top: 50,
                    right: 67,
                    left: 67,
                    //bottom: 10,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.86,
                      //double.infinity,
                      width: MediaQuery.of(context).size.height * 0.99,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/svg_images/table22.png"
                                //"assets/images/table2.jpg"
                                ),
                            fit: BoxFit.cover),
                      ),
                    )),

                ///music on and off ...

                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          ///todo:comented 3 may ....2024....prince
                          ///
                          Get.back();

                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) => Back(
                          //           useid: useid,
                          //           table: table,
                          //           gid: gid,
                          //         ));

                          ///
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width * 0.0850,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/back.png",
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     ///todo:comented 3 may ....2024....prince
                      //
                      //     showDialog(
                      //         context: context,
                      //         builder: (BuildContext context) => i2());
                      //   },
                      //   child: Container(
                      //     height: MediaQuery.of(context).size.height * 0.13,
                      //     width: MediaQuery.of(context).size.width * 0.0760,
                      //     decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //             image: AssetImage("assets/images/i2.png"),
                      //             fit: BoxFit.fill)),
                      //   ),
                      // ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.83,
                        height: MediaQuery.of(context).size.height * 0.27,
                      ),
                      InkWell(
                        onTap: () {
                          ///todo:comented 3 may ....2024....prince...
                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) => Setting());
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.0960,
                          width: MediaQuery.of(context).size.width * 0.0600,
                          decoration: BoxDecoration(
                              // image: DecorationImage(
                              //     image:
                              //         AssetImage("assets/images/setting.png"),
                              //     fit: BoxFit.fill)
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 23,
                  right: 225,
                  left: 225,
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 0.013,
                    decoration: BoxDecoration(
                        //color: Colors.green,
                        ),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.green.withOpacity(
                            0.0), // Change this color to your desired color
                        BlendMode
                            .color, // You can change the blend mode to achieve different effects
                      ),
                      child: players == null
                          ? Image.asset(
                              "assets/images/svg_images/hostt.png",

                              //"assets/images/gamere.png",
                              fit: BoxFit.cover,
                              // color: Colors.white,
                            )
                          : players[player3]['userimage'] == null
                              ? Image.asset(
                                  "assets/images/svg_images/hostt.png",
                                  //"assets/images/gamere.png",
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  players[player3]['userimage'].toString(),
                                  fit: BoxFit.fill,
                                ),
                    ),
                  ),
                ),

                ///todo: animation...

                Positioned(
                  top: 170,
                  right: 210,
                  left: 280,
                  child: DiceAnimation2(),
                ),

                ///todo:first user....

                Positioned(
                  top: 100,
                  right: 70,
                  left: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2, top: 30),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width * 0.06,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: Colors.white),
                                image: players == null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                            "https://cdn.pixabay.com/photo/2015/05/22/18/10/child-779434_1280.jpg"
                                            // "assets/images/person1.png"
                                            ),
                                        fit: BoxFit.cover,
                                      )
                                    : players[player3]['userimage'] == null
                                        ? DecorationImage(
                                            image: AssetImage(
                                                "assets/images/person1.png"),
                                          )
                                        : DecorationImage(
                                            image: NetworkImage(
                                              players[player3]['userimage']
                                                  .toString(),
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                              ),
                            ),
                          ),
                          Text(
                            'Kartik',
                            style: GoogleFonts.akshar(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2, top: 30),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width * 0.06,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: Colors.white),
                                image: players == null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                            "https://cdn.pixabay.com/photo/2016/07/10/17/54/kid-1508121_1280.jpg"
                                            // "assets/images/person1.png"
                                            ),
                                        fit: BoxFit.cover,
                                      )
                                    : players[player3]['userimage'] == null
                                        ? DecorationImage(
                                            image: AssetImage(
                                                "assets/images/person1.png"),
                                          )
                                        : DecorationImage(
                                            image: NetworkImage(
                                              players[player3]['userimage']
                                                  .toString(),
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                              ),
                            ),
                          ),
                          Text(
                            'Shubham',
                            style: GoogleFonts.akshar(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                ///last sec profile.......
                Positioned(
                  top: 239,
                  right: 110,
                  left: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2, top: 35),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width * 0.06,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: Colors.white),
                                image: players == null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                            "https://cdn.pixabay.com/photo/2019/09/03/01/51/child-4448370_1280.jpg"
                                            // "assets/images/person1.png"
                                            ),
                                        fit: BoxFit.cover,
                                      )
                                    : players[player3]['userimage'] == null
                                        ? DecorationImage(
                                            image: AssetImage(
                                                "assets/images/person1.png"),
                                          )
                                        : DecorationImage(
                                            image: NetworkImage(
                                              players[player3]['userimage']
                                                  .toString(),
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                              ),
                            ),
                          ),
                          Text(
                            'Rakesh',
                            style: GoogleFonts.akshar(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2, top: 36),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width * 0.06,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: Colors.white),
                                image: players == null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                            "https://cdn.pixabay.com/photo/2014/10/30/17/32/boy-509488_1280.jpg"
                                            // "assets/images/person1.png"
                                            ),
                                        fit: BoxFit.cover,
                                      )
                                    : players[player3]['userimage'] == null
                                        ? DecorationImage(
                                            image: AssetImage(
                                                "assets/images/person1.png"),
                                          )
                                        : DecorationImage(
                                            image: NetworkImage(
                                              players[player3]['userimage']
                                                  .toString(),
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                              ),
                            ),
                          ),
                          Text(
                            'Vishal',
                            style: GoogleFonts.akshar(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                //https://cdn.pixabay.com/photo/2024/05/20/16/21/ai-generated-8775720_1280.jpg

                ///last third uaer
                Positioned(
                  top: 279,
                  right: 260,
                  left: 260,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2, top: 23),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width * 0.06,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: Colors.white),
                                image: players == null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                            "https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_1280.jpg"
                                            //"https://cdn.pixabay.com/photo/2024/05/20/16/21/ai-generated-8775720_1280.jpg"
                                            // "https://cdn.pixabay.com/photo/2019/09/03/01/51/child-4448370_1280.jpg"
                                            // "assets/images/person1.png"
                                            ),
                                        fit: BoxFit.cover,
                                      )
                                    : players[player3]['userimage'] == null
                                        ? DecorationImage(
                                            image: AssetImage(
                                                "assets/images/person1.png"),
                                          )
                                        : DecorationImage(
                                            image: NetworkImage(
                                              players[player3]['userimage']
                                                  .toString(),
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                              ),
                            ),
                          ),
                          Text(
                            'Madhu',
                            style: GoogleFonts.akshar(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2, top: 26),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width * 0.06,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: Colors.white),
                                image: players == null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                            "https://cdn.pixabay.com/photo/2016/10/14/22/31/cute-1741376_1280.jpg"
                                            // "assets/images/person1.png"
                                            ),
                                        fit: BoxFit.cover,
                                      )
                                    : players[player3]['userimage'] == null
                                        ? DecorationImage(
                                            image: AssetImage(
                                                "assets/images/person1.png"),
                                          )
                                        : DecorationImage(
                                            image: NetworkImage(
                                              players[player3]['userimage']
                                                  .toString(),
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                              ),
                            ),
                          ),
                          Text(
                            'Akanksha',
                            style: GoogleFonts.akshar(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                ///timer...
                Positioned(
                  top: 40,
                  right: 400,
                  left: 110,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    // Adjust size as needed
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                    ),
                    child: TimerScreen(),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     showTimerDialog(context);
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     primary:
                    //         Colors.red, // Set the background color to red
                    //   ),
                    //   child: Text('Start Game!'),
                    // ),

                    ///TimerScreen(), // Embed TimerScreen here
                  ),
                ),

                ///1

                players == null
                    ? Container()
                    : player3 == null
                        ? Container()
                        : players[player3]['username'] == null
                            ? Container()
                            : Positioned(
                                top: MediaQuery.of(context).size.width * 0.15,
                                left: MediaQuery.of(context).size.width * 0.255,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                Guest_Profile(
                                                    id: players[player3]
                                                        ['rusers_id'],
                                                    img: players[player3]
                                                        ['userimage'],
                                                    name: players[player3]
                                                        ['username'],
                                                    win: players[player2]
                                                        ['Totalwin']));
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.24,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.10,
                                        decoration: BoxDecoration(
                                          image: refdata == null
                                              ? DecorationImage(
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.grey,
                                                    BlendMode.modulate,
                                                  ),
                                                  image: AssetImage(
                                                      "assets/images/PlayPerson1.png"),
                                                  fit: BoxFit.fill)
                                              : refdata[player3]['status']
                                                          .toString() !=
                                                      '1'
                                                  ? DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/PlayPerson1.png"),
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Colors.grey,
                                                        BlendMode.modulate,
                                                      ),
                                                      fit: BoxFit.fill)
                                                  : DecorationImage(
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Colors.grey,
                                                        BlendMode.modulate,
                                                      ),
                                                      image: AssetImage(
                                                          "assets/images/PlayPerson1.png"),
                                                      fit: BoxFit.fill),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .viewInsets
                                                          .right +
                                                      2,
                                                  top: MediaQuery.of(context)
                                                          .viewInsets
                                                          .top +
                                                      25),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.1,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                    image: players == null
                                                        ? DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/person1.png"),
                                                            fit: BoxFit.fill)
                                                        : players[player3][
                                                                    'userimage'] ==
                                                                null
                                                            ? DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/person1.png"))
                                                            : DecorationImage(
                                                                image:
                                                                    NetworkImage(
                                                                  players[player3]
                                                                          [
                                                                          'userimage']
                                                                      .toString(),
                                                                ),
                                                                fit: BoxFit
                                                                    .fill)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .viewInsets
                                                          .top +
                                                      3),
                                              child: Text(
                                                players == null
                                                    ? ''
                                                    : players[player3]
                                                                ['balance'] ==
                                                            null
                                                        ? ''
                                                        : players[player3]
                                                                ['balance']
                                                            .toString(),
                                                style: TextStyle(
                                                    color: Colors.amber,
                                                    fontSize: 12 *
                                                        MediaQuery
                                                            .textScaleFactorOf(
                                                                context),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 65,
                                      child: sideshow != true
                                          ? ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                )
                                              ],
                                            )
                                          : ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player3][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : 1.0,
                                                      child: Image.network(
                                                        carddata == null
                                                            ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                            : carddata[player3][
                                                                    'cardimage1']
                                                                .toString(),
                                                      )),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player3][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : 1.0,
                                                      child: Image.network(carddata ==
                                                              null
                                                          ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                          : carddata[player3]
                                                                  ['cardimage2']
                                                              .toString())),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player3][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : 1.0,
                                                      child: Image.network(carddata ==
                                                              null
                                                          ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                          : carddata[player3]
                                                                  ['cardimage3']
                                                              .toString())),
                                                )
                                              ],
                                            ),
                                    )
                                  ],
                                ),
                              ),

                ///2
                players == null
                    ? Container()
                    : player3 == null
                        ? Container()
                        : players[player3]['username'] == null
                            ? Container()
                            : Positioned(
                                top: MediaQuery.of(context).size.width * 0.229,
                                left: MediaQuery.of(context).size.width * 0.255,
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.0450,
                                  width: MediaQuery.of(context).size.width *
                                      0.0250,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/roulette.png"),
                                          fit: BoxFit.fill)),
                                ),
                              ),

                players == null
                    ? Container()
                    : player4 == null
                        ? Container()
                        : players[player4]['username'] == null
                            ? Container()
                            : Positioned(
                                top: MediaQuery.of(context).size.width * 0.15,
                                right:
                                    MediaQuery.of(context).size.width * 0.255,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                Guest_Profile(
                                                    id: players[player4]
                                                        ['rusers_id'],
                                                    img: players[player4]
                                                        ['userimage'],
                                                    name: players[player4]
                                                        ['username'],
                                                    win: players[player2]
                                                        ['Totalwin']));
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.24,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.10,
                                        decoration: BoxDecoration(
                                          image: refdata == null
                                              ? DecorationImage(
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.grey,
                                                    BlendMode.modulate,
                                                  ),
                                                  image: AssetImage(
                                                      "assets/images/PlayPerson1.png"),
                                                  fit: BoxFit.fill)
                                              : refdata[player4]['status']
                                                          .toString() !=
                                                      '1'
                                                  ? DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/PlayPerson1.png"),
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Colors.grey,
                                                        BlendMode.modulate,
                                                      ),
                                                      fit: BoxFit.fill)
                                                  : DecorationImage(
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Colors.grey,
                                                        BlendMode.modulate,
                                                      ),
                                                      image: AssetImage(
                                                          "assets/images/PlayPerson1.png"),
                                                      fit: BoxFit.fill),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .viewInsets
                                                          .right +
                                                      2,
                                                  top: MediaQuery.of(context)
                                                          .viewInsets
                                                          .top +
                                                      25),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.1,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                    image: players == null
                                                        ? DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/PlayPerson1.png"),
                                                            fit: BoxFit.fill)
                                                        : players[player4][
                                                                    'userimage'] ==
                                                                null
                                                            ? DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/PlayPerson1.png"))
                                                            : DecorationImage(
                                                                image:
                                                                    NetworkImage(
                                                                  players[player4]
                                                                          [
                                                                          'userimage']
                                                                      .toString(),
                                                                ),
                                                                fit: BoxFit
                                                                    .fill)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .viewInsets
                                                          .top +
                                                      3),
                                              child: Text(
                                                players == null
                                                    ? ''
                                                    : players[player4]
                                                                ['balance'] ==
                                                            null
                                                        ? ''
                                                        : players[player4]
                                                                ['balance']
                                                            .toString(),
                                                style: TextStyle(
                                                    color: Colors.amber,
                                                    fontSize: 12 *
                                                        MediaQuery
                                                            .textScaleFactorOf(
                                                                context),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 65,
                                      child: sideshow != true
                                          ? ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                )
                                              ],
                                            )
                                          : ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player4][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : 1.0,
                                                      child: Image.network(
                                                        carddata == null
                                                            ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                            : carddata[player4][
                                                                    'cardimage1']
                                                                .toString(),
                                                      )),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player4][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : 1.0,
                                                      child: Image.network(carddata ==
                                                              null
                                                          ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                          : carddata[player4]
                                                                  ['cardimage2']
                                                              .toString())),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player4][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : 1.0,
                                                      child: Image.network(carddata ==
                                                              null
                                                          ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                          : carddata[player4]
                                                                  ['cardimage3']
                                                              .toString())),
                                                )
                                              ],
                                            ),
                                    )
                                  ],
                                ),
                              ),
                players == null
                    ? Container()
                    : player4 == null
                        ? Container()
                        : players[player4]['username'] == null
                            ? Container()
                            : Positioned(
                                top: MediaQuery.of(context).size.width * 0.229,
                                right:
                                    MediaQuery.of(context).size.width * 0.330,
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.0450,
                                  width: MediaQuery.of(context).size.width *
                                      0.0250,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/roulette.png"),
                                          fit: BoxFit.fill)),
                                ),
                              ),

                ///3
                players == null
                    ? Container()
                    : player2 == null
                        ? Container()
                        : players[player2]['username'] == null
                            ? Container()
                            : Positioned(
                                top: MediaQuery.of(context).size.width * 0.31,
                                left:
                                    MediaQuery.of(context).size.width * 0.0750,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                Guest_Profile(
                                                  id: players[player2]
                                                      ['rusers_id'],
                                                  img: players[player2]
                                                      ['userimage'],
                                                  name: players[player2]
                                                      ['username'],
                                                  win: players[player2]
                                                      ['Totalwin'],
                                                ));
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.24,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.10,
                                        decoration: BoxDecoration(
                                          image: refdata == null
                                              ? DecorationImage(
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.grey,
                                                    BlendMode.modulate,
                                                  ),
                                                  image: AssetImage(
                                                      "assets/images/PlayPerson1.png"),
                                                  fit: BoxFit.fill)
                                              : refdata[player2]['status']
                                                          .toString() !=
                                                      '1'
                                                  ? DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/PlayPerson1.png"),
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Colors.grey,
                                                        BlendMode.modulate,
                                                      ),
                                                      fit: BoxFit.fill)
                                                  : DecorationImage(
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Colors.grey,
                                                        BlendMode.modulate,
                                                      ),
                                                      image: AssetImage(
                                                          "assets/images/PlayPerson1.png"),
                                                      fit: BoxFit.fill),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .viewInsets
                                                          .right +
                                                      2,
                                                  top: MediaQuery.of(context)
                                                          .viewInsets
                                                          .top +
                                                      25),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.1,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                    image: players == null
                                                        ? DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/person1.png"),
                                                            fit: BoxFit.fill)
                                                        : players[player2][
                                                                    'userimage'] ==
                                                                null
                                                            ? DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/person1.png"))
                                                            : DecorationImage(
                                                                image:
                                                                    NetworkImage(
                                                                  players[player2]
                                                                          [
                                                                          'userimage']
                                                                      .toString(),
                                                                ),
                                                                fit: BoxFit
                                                                    .fill)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .viewInsets
                                                          .top +
                                                      6),
                                              child: Text(
                                                players == null
                                                    ? ''
                                                    : players[player2]
                                                                ['balance'] ==
                                                            null
                                                        ? ''
                                                        : players[player2]
                                                                ['balance']
                                                            .toString(),
                                                style: TextStyle(
                                                    color: Colors.amber,
                                                    fontSize: 12 *
                                                        MediaQuery
                                                            .textScaleFactorOf(
                                                                context),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 65,
                                      child: sideshow != true
                                          ? ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                )
                                              ],
                                            )
                                          : ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player2][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : 1.0,
                                                      child: Image.network(
                                                        carddata == null
                                                            ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                            : carddata[player2][
                                                                    'cardimage1']
                                                                .toString(),
                                                      )),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player2][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : 1.0,
                                                      child: Image.network(carddata ==
                                                              null
                                                          ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                          : carddata[player2]
                                                                  ['cardimage2']
                                                              .toString())),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player2][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : 1.0,
                                                      child: Image.network(carddata ==
                                                              null
                                                          ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                          : carddata[player2]
                                                                  ['cardimage3']
                                                              .toString())),
                                                )
                                              ],
                                            ),
                                    )
                                  ],
                                ),
                              ),
                players == null
                    ? Container()
                    : player2 == null
                        ? Container()

                        ///4
                        : players[player2]['username'] == null
                            ? Container()
                            : Positioned(
                                top: MediaQuery.of(context).size.width * 0.389,
                                left:
                                    MediaQuery.of(context).size.width * 0.0760,
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.0450,
                                  width: MediaQuery.of(context).size.width *
                                      0.0250,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/roulette.png"),
                                          fit: BoxFit.fill)),
                                ),
                              ),

                players == null
                    ? Container()
                    : player5 == null
                        ? Container()
                        : players[player5]['username'] == null
                            ? Container()
                            : Positioned(
                                top: MediaQuery.of(context).size.width * 0.31,
                                right:
                                    MediaQuery.of(context).size.width * 0.0650,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 65,
                                      child: sideshow != true
                                          ? ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                )
                                              ],
                                            )
                                          : ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player5][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : 1.0,
                                                      child: Image.network(
                                                        carddata == null
                                                            ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                            : carddata[player5][
                                                                    'cardimage1']
                                                                .toString(),
                                                      )),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player5][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : 1.0,
                                                      child: Image.network(carddata ==
                                                              null
                                                          ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                          : carddata[player5]
                                                                  ['cardimage2']
                                                              .toString())),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player5][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : 1.0,
                                                      child: Image.network(carddata ==
                                                              null
                                                          ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                          : carddata[player5]
                                                                  ['cardimage3']
                                                              .toString())),
                                                )
                                              ],
                                            ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                Guest_Profile(
                                                    id: players[player5]
                                                        ['rusers_id'],
                                                    img: players[player5]
                                                        ['userimage'],
                                                    name: players[player5]
                                                        ['username'],
                                                    win: players[player5]
                                                        ['Totalwin']));
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.24,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.10,
                                        decoration: BoxDecoration(
                                          image: refdata == null
                                              ? DecorationImage(
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.grey,
                                                    BlendMode.modulate,
                                                  ),
                                                  image: AssetImage(
                                                      "assets/images/PlayPerson1.png"),
                                                  fit: BoxFit.fill)
                                              : refdata[player5]['status']
                                                          .toString() !=
                                                      '1'
                                                  ? DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/PlayPerson1.png"),
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Colors.grey,
                                                        BlendMode.modulate,
                                                      ),
                                                      fit: BoxFit.fill)
                                                  : DecorationImage(
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Colors.grey,
                                                        BlendMode.modulate,
                                                      ),
                                                      image: AssetImage(
                                                          "assets/images/PlayPerson1.png"),
                                                      fit: BoxFit.fill),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .viewInsets
                                                          .right +
                                                      1,
                                                  top: MediaQuery.of(context)
                                                          .viewInsets
                                                          .top +
                                                      25),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.1,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                    image: players == null
                                                        ? DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/person1.png"),
                                                            fit: BoxFit.fill)
                                                        : players[player5][
                                                                    'userimage'] ==
                                                                null
                                                            ? DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/person1.png"))
                                                            : DecorationImage(
                                                                image:
                                                                    NetworkImage(
                                                                  players[player5]
                                                                          [
                                                                          'userimage']
                                                                      .toString(),
                                                                ),
                                                                fit: BoxFit
                                                                    .fill)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .viewInsets
                                                          .top +
                                                      6),
                                              child: Text(
                                                players == null
                                                    ? ''
                                                    : players[player5]
                                                                ['balance'] ==
                                                            null
                                                        ? ''
                                                        : players[player5]
                                                                ['balance']
                                                            .toString(),
                                                style: TextStyle(
                                                    color: Colors.amber,
                                                    fontSize: 12 *
                                                        MediaQuery
                                                            .textScaleFactorOf(
                                                                context),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                players == null
                    ? Container()
                    : player5 == null
                        ? Container()
                        : players[player5]['username'] == null
                            ? Container()
                            : Positioned(
                                top: MediaQuery.of(context).size.width * 0.389,
                                right: MediaQuery.of(context).size.width * 0.14,
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.0450,
                                  width: MediaQuery.of(context).size.width *
                                      0.0250,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/roulette.png"),
                                          fit: BoxFit.fill)),
                                ),
                              ),

                players == null
                    ? Container()
                    : player1 == null
                        ? Container()
                        : players[player1]['username'] == null
                            ? Container()
                            : Positioned(
                                bottom:
                                    MediaQuery.of(context).size.width * 0.045,
                                right: MediaQuery.of(context).size.width * 0.40,
                                child: Row(
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        Guest_Profile(
                                                          id: players[player1]
                                                              ['rusers_id'],
                                                          img: players[player1]
                                                              ['userimage'],
                                                          name: players[player1]
                                                              ['username'],
                                                          win: players[player1]
                                                              ['Totalwin'],
                                                        ));
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.24,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.10,
                                            decoration: BoxDecoration(
                                              image: pack == true
                                                  ? DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/PlayPerson1.png"),
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Colors.grey,
                                                        BlendMode.modulate,
                                                      ),
                                                      fit: BoxFit.fill)
                                                  : refdata == null
                                                      ? DecorationImage(
                                                          colorFilter:
                                                              ColorFilter.mode(
                                                            Colors.grey,
                                                            BlendMode.modulate,
                                                          ),
                                                          image: AssetImage(
                                                              "assets/images/PlayPerson1.png"),
                                                          fit: BoxFit.fill)
                                                      : refdata[player1]
                                                                      ['status']
                                                                  .toString() !=
                                                              '1'
                                                          ? DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/PlayPerson1.png"),
                                                              colorFilter:
                                                                  ColorFilter
                                                                      .mode(
                                                                Colors.grey,
                                                                BlendMode
                                                                    .modulate,
                                                              ),
                                                              fit: BoxFit.fill)
                                                          : DecorationImage(
                                                              colorFilter:
                                                                  ColorFilter
                                                                      .mode(
                                                                Colors.grey,
                                                                BlendMode
                                                                    .modulate,
                                                              ),
                                                              image: AssetImage(
                                                                  "assets/images/PlayPerson1.png"),
                                                              fit: BoxFit.fill),
                                            ),

                                            ///5
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right:
                                                          MediaQuery.of(context)
                                                                  .viewInsets
                                                                  .right +
                                                              2,
                                                      top:
                                                          MediaQuery.of(context)
                                                                  .viewInsets
                                                                  .top +
                                                              25),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.06,
                                                    decoration: BoxDecoration(
                                                        image: players == null
                                                            ? DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/person1.png"),
                                                                fit:
                                                                    BoxFit.fill)
                                                            : players[player1][
                                                                        'userimage'] ==
                                                                    null
                                                                ? DecorationImage(
                                                                    image: AssetImage(
                                                                        "assets/images/person1.png"))
                                                                : DecorationImage(
                                                                    image:
                                                                        NetworkImage(
                                                                      players[player1]
                                                                              [
                                                                              'userimage']
                                                                          .toString(),
                                                                    ),
                                                                    fit: BoxFit
                                                                        .fill)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top:
                                                          MediaQuery.of(context)
                                                                  .viewInsets
                                                                  .top +
                                                              3),
                                                  child: Text(
                                                    players == null
                                                        ? ''
                                                        : players[player1][
                                                                    'balance'] ==
                                                                null
                                                            ? '0'
                                                            : players[player1]
                                                                    ['balance']
                                                                .toString(),
                                                    style: TextStyle(
                                                        color: Colors.amber,
                                                        fontSize: 12 *
                                                            MediaQuery
                                                                .textScaleFactorOf(
                                                                    context),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.030,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.010,
                                            child: Borderanimate(
                                              milisecond: 20000,
                                              child: Text(''),
                                            )),
                                      ],
                                    ),
                                    Container(
                                      height: 30,
                                      width: 65,
                                      child: show == false
                                          ? ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                      "assets/images/backcard1.jpg"),
                                                )
                                              ],
                                            )
                                          : ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player4][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : pack == true
                                                                  ? 0.4
                                                                  : 1.0,
                                                      child: Image.network(
                                                        carddata == null
                                                            ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                            : carddata[player1][
                                                                    'cardimage1']
                                                                .toString(),
                                                      )),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player4][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : pack == true
                                                                  ? 0.4
                                                                  : 1.0,
                                                      child: Image.network(carddata ==
                                                              null
                                                          ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                          : carddata[player1]
                                                                  ['cardimage2']
                                                              .toString())),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Opacity(
                                                      opacity: refdata == null
                                                          ? 1.0
                                                          : refdata[player4][
                                                                          'status']
                                                                      .toString() !=
                                                                  '1'
                                                              ? 0.4
                                                              : pack == true
                                                                  ? 0.4
                                                                  : 1.0,
                                                      child: Image.network(carddata ==
                                                              null
                                                          ? 'https://previews.123rf.com/images/rlmf/rlmf1512/rlmf151200181/49319355-playing-cards-back.jpg'
                                                          : carddata[player1]
                                                                  ['cardimage3']
                                                              .toString())),
                                                )
                                              ],
                                            ),
                                    )
                                  ],
                                ),
                              ),
                players == null
                    ? Container()
                    : player1 == null
                        ? Container()
                        : players[player1]['username'] == null
                            ? Container()
                            : Positioned(
                                top: MediaQuery.of(context).size.width * 0.418,
                                left: MediaQuery.of(context).size.width * 0.41,
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.0450,
                                  width: MediaQuery.of(context).size.width *
                                      0.0250,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/roulette.png"),
                                          fit: BoxFit.fill)),
                                ),
                              ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool gamestart = true;
  bool show = false;
  int chaal = 2;
  bool inc = false;
  bool pack = false;
  bool sideshow = false;

  void showTimerDialog(BuildContext context,
      {double heightFactor = 0.4, double widthFactor = 0.4}) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing dialog on tap outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            height: MediaQuery.of(context).size.height * heightFactor,
            width: MediaQuery.of(context).size.width * widthFactor,
            // Adjust size as needed
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
            ),
            child: TimerScreen(), // Embed TimerScreen here
          ),
        );
      },
    );
  }

  @override
  void initState() {
    ///AnimatedImageContainer();
    tablecreate();

    ///tablecreate();

    //profile();
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    // _audioPlayer = AudioPlayer();
    // _startRollingMusic();
  }

  ///todo: roll dice qfter 10 second
  void _startRollingMusic() {
    _startTimer = Timer(Duration(seconds: 6), () {
      _audioPlayer.play(UrlSource(
          'https://admin.hirejobindia.com/BannerImages/gamemusic.mp3'));

      // Speed up the audio for 1 second at 1.5x speed
      _audioPlayer.setPlaybackRate(1.3);
      _speedTimer = Timer(Duration(seconds: 1), () {
        // Return to normal speed after 1 second
        _audioPlayer.setPlaybackRate(1.3);
      });

      // Stop the audio after 15 seconds
      _stopTimer = Timer(Duration(seconds: 12), () {
        _audioPlayer.stop();
      });
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _startTimer?.cancel();
    _stopTimer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }
}

///todo:screen timer....
