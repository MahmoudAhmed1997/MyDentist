import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff1DE9B6),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
 Image(image: AssetImage(
          "assets/images/Logo.png",

        ),
        color: Colors.white,
        height: 96.0,
        width: 90.0,
 ),Text(
              "My Dentist",
              style: kTextStyleHeadline.copyWith(color: Colors.white,fontSize:
              30.0,fontFamily: "mvboli"),
            ),            ],
        ),
      ),
    );
  }
}
