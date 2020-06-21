//
//import 'package:dental_clinic/constants.dart';
//import 'package:dental_clinic/screens/home_page.dart';
//import 'package:dental_clinic/screens/loginPage.dart';
//import 'package:dental_clinic/screens/signUpSocialMediaPage.dart';
//import 'package:dental_clinic/widgets/rounded%20button.dart';
//import 'package:dental_clinic/widgets/text%20field%20style.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';
//
//class SignUPPage extends StatefulWidget {
//  @override
//  _SignUPPageState createState() => _SignUPPageState();
//}
//
//class _SignUPPageState extends State<SignUPPage> {
//  final _auth =FirebaseAuth.instance;
//  String email;
//  String password;
//  bool showSpinner = false;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Color(0xffFFFFFF),
//      appBar: AppBar(   iconTheme: IconThemeData.fallback(),
//        backgroundColor: Color(0xffFFFFFF),elevation: 0.0,),
//      body: ModalProgressHUD(
//        inAsyncCall: showSpinner,
//        child: Padding(
//          padding: const EdgeInsets.all(15.0),
//          child: SingleChildScrollView(
//            scrollDirection: Axis.vertical,
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  "Sign Up",
//                  style: TextStyle(color: Colors.black, fontSize: 35.0),
//                ),
//                SizedBox(height: 20.0,),
//                TextFieldStyle(
//                  onChanged: (value){
//                    email=value;
//
//                  },
//
//                  text: "Email",
//                  decoration: KTextFieldDecoration.copyWith(hintText: "example@gmail.com"),
//                  keyboardType: TextInputType.text,
//                ),
//                TextFieldStyle(
//                  onChanged: (value){
//                    password=value;
//
//                  },
//                  text: "Password",
//                  decoration: KTextFieldDecoration.copyWith(hintText: "At least 8 character"),
//                  keyboardType: TextInputType.number,
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(left: 15.0),
//                  child: Text(""),
//                ),
//                SizedBox(height: 40.0,),
//                RoundedButtonSignUp(
//                  onPress: ()async{
//                    setState(() {
//                      showSpinner =true;
//                    });
//                    final newUser =await _auth.createUserWithEmailAndPassword(email: email, password: password);
//                    if(newUser != null){
//                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DentalHomePage()));
//                    }
//                    setState(() {
//                      showSpinner=false;
//                    });
//                  },
//                  image: AssetImage(""),
//                  textButton: "Sign UP",
//                  materialColor: Color(0xff1DE9B6),
//                  buttonColor: Colors.white,
//                ),
//                SizedBox(height: 40.0,),
//                Column(
//
//                  children: <Widget>[
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text("Have An Account? ",),
//                      ],
//                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        FlatButton(
//                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));},
//
//                          child: Text("Login",style: TextStyle(color: Color(0xff1DB6E9)),),),
//                      ],
//                    )
//                  ],)
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
