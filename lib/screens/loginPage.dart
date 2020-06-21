//
//import 'package:dental_clinic/constants.dart';
//import 'package:dental_clinic/screens/home_page.dart';
//import 'package:dental_clinic/screens/signUpSocialMediaPage.dart';
//import 'package:dental_clinic/screens/signupPage.dart';
//import 'package:dental_clinic/widgets/rounded%20button.dart';
//import 'package:dental_clinic/widgets/text%20field%20style.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';
//
//class LoginPage extends StatefulWidget {
//  @override
//  _LoginPageState createState() => _LoginPageState();
//}
//
//class _LoginPageState extends State<LoginPage> {
//
//  final _auth =FirebaseAuth.instance;
//  bool showSpinner = false;
//  String email;
//  String password;
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Color(0xffFFFFFF),
//      appBar: AppBar(
//        iconTheme: IconThemeData.fallback(),
//        backgroundColor: Color(0xffFFFFFF),
//        elevation: 0.0,
//      ),
//      body: ModalProgressHUD(
//        inAsyncCall: showSpinner,
//        child: Padding(
//          padding: const EdgeInsets.all(15.0),
//          child: SingleChildScrollView(
//            scrollDirection: Axis.vertical,
//            child: Form(
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Text(
//                    "Login",
//                    style: TextStyle(color: Colors.black, fontSize: 35.0),
//                  ),
//                  SizedBox(
//                    height: 20.0,
//                  ),
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text("E-Email",style:kTextStyleBookingTwo,
//                          ),
//                      SizedBox(height: 10,),
//                      TextFormField(
//                        decoration: KTextFieldDecoration.copyWith(
//                            hintText: "example@gmail.com"),
//                        keyboardType: TextInputType.text,
//                        validator: (value) {
//                          if (value.isEmpty || !value.contains('@')) {
//                            return 'Invalid email!';
//                          }
//                        },
//                        onSaved: (value) {
//                          email = value;
//                        },
//                        onChanged: (value){
//                          email=value;
//                        },
//
//                      ),
//                    ],
//                  ),
//                  TextFormField(
//                    onChanged: (value){
//                      password=value;
//                    },
//                    decoration: KTextFieldDecoration.copyWith(
//                        hintText: "At least 8 character"),
//                    keyboardType: TextInputType.number,
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(left: 15.0),
//                    child: Text("Forget Password?"),
//                  ),
//                  SizedBox(
//                    height: 40.0,
//                  ),
//                  RoundedButtonSignUp(
//                    onPress: ()async {
//                      setState(() {
//                        showSpinner=true;
//                      });
//                      try{
//                        final user =await _auth.signInWithEmailAndPassword(email: email, password: password);
//                        if(user!=null){
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => DentalHomePage()));
//                        }
//                        setState(() {
//                          showSpinner=false;
//                        });
//                      }catch(e){
//                        print(e);
//                      }
//
//
//
//                    },
//                    image: AssetImage(""),
//                    textButton: "Login",
//                    materialColor: Color(0xff1DE9B6),
//                    buttonColor: Colors.white,
//                  ),
//                  SizedBox(
//                    height: 40.0,
//                  ),
//                  Column(
//                    children: <Widget>[
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Text(
//                            "Don\'t have account? ",
//                          ),
//                        ],
//                      ),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          FlatButton(
//                            onPressed: () {
//                              Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) => SignUPPage()));
//                            },
//                            child: Text(
//                              "Sign UP",
//                              style: TextStyle(color: Color(0xff1DB6E9)),
//                            ),
//                          ),
//                        ],
//                      )
//                    ],
//                  )
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
