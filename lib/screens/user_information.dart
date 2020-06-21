
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:white/provider/auth.dart';
import 'package:white/screens/about_us_screen.dart';
import 'package:white/screens/profile.dart';
import 'package:white/screens/support_screen.dart';
import 'package:white/widgets/bottomAppBarItems.dart';
import 'package:white/widgets/row_iconbutton.dart';

import '../constants.dart';
int index1 =0;

class UserInformation extends StatefulWidget {
  final colorBottomIcon;
  final index;

  const UserInformation({ this.colorBottomIcon,this.index}) ;
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBarItems(index: 3,),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 80.0, 15.0, 0.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/mahmoud.jpg"),
                        radius: 34,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Mahmoud",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileEdit(),
                      ),
                    );
                  },
                  child: Text("Edit",
                      style: kTextStyleDocAndButton.copyWith(
                        color: Color(0xff1DE9B6),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 40.0,
            ),
//            RowIconandButton(
//              text: "Saved Doctors",
//              icon: Icons.bookmark,
//              styleText: kTextStyleFlatButtonInUserInfo,
//              onPress: () {
//
//                Navigator.of(context).pushNamed(SavedScreen.routeName);
//              },
//            ),

            RowIconandButton(
              text: "Language",
              icon: Icons.language,
              styleText: kTextStyleFlatButtonInUserInfo.copyWith(color: Colors.black),
            ),
            RowIconandButton(
              text: "Share",
              icon: Icons.share,
              styleText: kTextStyleFlatButtonInUserInfo.copyWith(color: Colors.black),
            ),
            RowIconandButton(
              text: "Support",
              icon: Icons.headset_mic,
              styleText: kTextStyleFlatButtonInUserInfo,
              onPress: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SupportScreen()));
              },
            ),
            RowIconandButton(
              text: "About us",
              icon: Icons.report,
              styleText: kTextStyleFlatButtonInUserInfo,
              onPress: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutUs()));
              },
            ),
            SizedBox(height: 90.0,),
            Divider(
              color: Colors.grey,
            ),
            InkWell(
              onTap: (){
                Navigator.pop(context);

                Provider.of<Auth>(context,listen: false).logOut();

              },
              child: RowIconandButton(
                text: "Logout",
                icon: Icons.exit_to_app,
                styleText:
                    kTextStyleFlatButtonInUserInfo.copyWith(color: Colors.grey),


              ),
            ),
          ],
        ),
      ),
    );
  }
}
