import 'package:flutter/material.dart';

class Update_profile extends StatefulWidget {
  const Update_profile({Key? key}) : super(key: key);

  @override
  State<Update_profile> createState() => _Update_profileState();
}

class _Update_profileState extends State<Update_profile> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.topRight,
      shape: RoundedRectangleBorder(),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.34,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/profiledetailtable1.png"),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  Text(
                    "Edit your name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16 * MediaQuery.textScaleFactorOf(context)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/browntxtfield.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).viewInsets.left + 10),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Guest_63",
                            hintStyle: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                            suffixIcon: Icon(
                              Icons.edit_rounded,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                  Text(
                    "Edit Player ID",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16 * MediaQuery.textScaleFactorOf(context)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/browntxtfield.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).viewInsets.left + 10),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "  utp_6wqdg",
                            hintStyle: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                            suffixIcon: Icon(
                              Icons.edit_rounded,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.0200,),
                  Text(
                    "Edit Profile Picture",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16 * MediaQuery.textScaleFactorOf(context)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.0500,),
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.11,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                        AssetImage("assets/images/person1.png"),
                        fit: BoxFit.fill)),
              ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.0500,),
                  InkWell(
                    onTap: (){Navigator.pop(context);},
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                              AssetImage("assets/images/greenredeem.png"),
                              fit: BoxFit.fill)
                      ),
                      child: Center(child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 19*MediaQuery.textScaleFactorOf(context),fontWeight: FontWeight.bold),)),
                    ),
                  ),

                ],
              )
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.37,
            right: MediaQuery.of(context).size.width * 0.35,
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
                        fit: BoxFit.fill)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
