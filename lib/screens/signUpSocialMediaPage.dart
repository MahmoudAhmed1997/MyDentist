
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:white/widgets/rounded_button.dart';

import '../constants.dart';
import 'auth_screen.dart';
import 'google_signup.dart';
import 'home_page.dart';
//import 'package:provider/provider.dart';

class SignUpBySocialMedia extends StatefulWidget {
  @override
  _SignUpBySocialMediaState createState() => _SignUpBySocialMediaState();
}

class _SignUpBySocialMediaState extends State<SignUpBySocialMedia> {
  String myText = null;

  FirebaseUser _user;

  FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );
    AuthResult result = (await _auth.signInWithCredential(credential));

    _user = result.user;
    print("signed in " + _user.displayName);
    Navigator.push(context, MaterialPageRoute(builder: (context) => DentalHomePage()));

  }

  void _signOut() {
    googleSignIn.signOut();
    print('Signed Out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Center(
                  child: Image(image: AssetImage(
                    "assets/images/Logo.png",

                  ),
                    color: Color(0xff1DE9B6),
                    height: 96.0,
                    width: 90.0,
                  ),),
                ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                "My Dentist",
                style: kTextStyleHeadline.copyWith(
                    color: Color(0xff1DE9B6),

                    fontSize: 30.0,
                    fontFamily: "mvboli"),
              ),
              SizedBox(
                height: 20.0,
              ),
              AuthCard(),
              Column(
                children: <Widget>[
                  Text(
                    "Sign up by",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),



                  RoundedButtonSignUp(
                      image: AssetImage("assets/imagesH/google-icon.png"),
                      textButton: "GOOGLE",
                      materialColor: Colors.white,
                      buttonColor: Colors.black,
                    onPress: _signIn
                  ),

                  SizedBox(
                    height: 15.0,
                  ),
                  RoundedButtonSignUp(
                    image: AssetImage("assets/imagesH/facebook_icon.png"),
                    textButton: "FACEBOOK",
                    materialColor: Color(0xff3B5999),
                    buttonColor: Colors.white,
                    onPress: () {
                      null;
                    },
                  ),
//                  SizedBox(
//                    height: 30.0,
//                  ),
//                  Text(
//                    "Or Continue by email",
//                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
//                  ),
//                  SizedBox(
//                    height: 15.0,
//                  ),
//                  Row(
//                    // crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Expanded(
//                          child: FlatButtonStyle(
//                               onPress: ()async { await Navigator.pushNamed(context,AuthScreen.routeName);},
//
//                          text: "Sign up",
//                        color: Color(0xff1DE9B6),
//                        radius: 30.0,
//                      )),
//                      SizedBox(width: 10.0,),
//                      Expanded(
//                        child: FlatButtonStyle(
//                       //   onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthScreen()));},
//
//                          text: "Login",
//                          color: Color(0xff1DE9B6),
//                          radius: 30.0,
//                        ),
//                      ),
//                    ],
//                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
