import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class withdrawal extends StatefulWidget {
  const withdrawal({Key? key}) : super(key: key);

  @override
  State<withdrawal> createState() => _withdrawalState();
}

class _withdrawalState extends State<withdrawal> {
  TextEditingController _bankid = TextEditingController();
  TextEditingController _coins = TextEditingController();
  @override
  void initState() {
    bankkk();
    super.initState();
  }

  String ?bank ;
  List bank_data = [];
  Future<String> bankkk() async {
    final res = await http.get(
        Uri.parse('https://rlg.apponrent.co.in/public/api/bank/2')
    );
    final resBody = json.decode(res.body);

    setState(() {
      bank_data = resBody['data'];
    });
    return "Sucess";
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height:  double.infinity,
              width:  MediaQuery.of(context).size.width*0.77,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/backtable.png"),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.29,),
                      Padding(
                        padding:  EdgeInsets.only(top: 5.0),
                        child: Text("𝐖𝐢𝐭𝐡𝐝𝐫𝐚𝐰𝐚𝐥",style: TextStyle(color: Color(0xff2c0000),fontSize: 24*MediaQuery.textScaleFactorOf(context),fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.24,),
                      InkWell(onTap: (){Navigator.pop(context);},
                        child: Container(
                          height:  MediaQuery.of(context).size.height*0.0950,
                          width:  MediaQuery.of(context).size.width*0.0600,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/cross.png"),fit: BoxFit.fill)
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.11,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/regisbutton.png"),
                          fit: BoxFit.fill),
                    ),
                    child: DropdownButtonHideUnderline(

                      child:DropdownButton(
                        style: TextStyle(color: Colors.white),
                        hint:  Text('Select your Bank a/c',

                          style: TextStyle(
                            fontSize: 18,
                            color: Theme
                                .of(context)
                                .hintColor,
                          ),
                        ),
                        items: bank_data.map((item) {
                          return DropdownMenuItem(
                              child:  Text(
                                item['account'].toString(), overflow: TextOverflow.clip,
                                // maxLines: ,
                                softWrap: false,
                                style: TextStyle(fontFamily: "Windsor",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  // color: Colors.black
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              value: item['id'].toString()
                          );
                        }).toList(),
                        onChanged: (value) async {
                          setState(() {
                            bank = value as String ;
                          }
                          );
                        },
                        value: bank,
                        // buttonHeight: 40,
                        // buttonWidth: 140,
                        // itemHeight: 40,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.0500,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/regisbutton.png"),
                          fit: BoxFit.fill),
                    ),
                    child: TextFormField(
                      controller: _coins,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.currency_bitcoin,
                          color: Colors.white,
                          size: 27,
                        ),
                        border: InputBorder.none,
                        hintText: "Coins",
                        hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 18 *
                                MediaQuery.textScaleFactorOf(context),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.0600,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/loginred.png"),
                            fit: BoxFit.fill)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).viewInsets.left +
                                  17.0),
                          child: Text(
                            "Withdraw",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16 *
                                    MediaQuery.textScaleFactorOf(context),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

        )
    );
  }
}
