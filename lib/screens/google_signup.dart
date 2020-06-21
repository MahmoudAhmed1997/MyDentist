

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

import 'package:white/screens/home_page.dart';

class GoogleSignUp extends StatefulWidget {
  @override
  _GoogleSignUpState createState() => _GoogleSignUpState();
}

class _GoogleSignUpState extends State<GoogleSignUp> {
  String myText = null;
  FirebaseUser _user;


  //firebase auth+++++++++++++++++++++++++++++++
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

  //-----------------------------------firebase_auth
  ///////////////////////////////////////////////
  ////////////////////////////////////////////////
  //*********************************************************************************************************************
  ////////////////////////////////////////////////
  //cloud_firedtore+++++++++++++++++++++++++++++++(CRUD)
 // final DocumentReference documentReference =
//  Firestore.instance.collection('myData').document('dummy');

//  void _add() {
//    Map<String, String> data = <String, String>{
//      "name": "MAhmoud Ahmad",
//      "desc": "Flutter Developer"
//    };
//    documentReference.setData(data).whenComplete(() {
//      print('Document Added');
//    }).catchError((e) {
//      print(e);
//    });
//  }
//
//  void _delete() {
//    documentReference.delete().whenComplete(() {
//      print('Document Deleted');
//    }).catchError((e) {
//      print(e);
//    });
//  }
//
//  void _update() {
//    Map<String, String> data = <String, String>{
//      "name": "MAhmoud Ahmad updated",
//      "desc": "Flutter Developer updated"
//    };
//    documentReference.updateData(data).whenComplete(() {
//      print('Document Added');
//    }).catchError((e) {
//      print(e);
//    });
//  }
//
//  void _fetch() {
//    documentReference.get().then((datasnapshot) {
//      if (datasnapshot.exists) {
//        setState(() {
//          myText = datasnapshot.data['desc'];
//        });
//      }
//    });
//  }
//
//  //----------------------------Cloud_firestore(CRUD)
//  //RealTime++++++++++++++++++++++++++++++++++++++++
//  StreamSubscription<DocumentSnapshot> subscription;

//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    subscription = documentReference.snapshots().listen((datasnapshot) {
//      if (datasnapshot.exists) {
//        setState(() {
//          myText = datasnapshot.data['desc'];
//        });
//      }
//    });
//  }
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    super.dispose();
//    subscription?.cancel();
//  }
  //-------------------------------------------RealTime
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: _signIn

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: _signOut,
                color: Colors.black,
              ),
            ),

            myText == null
                ? new Container()
                : new Text(
              myText,
              style: TextStyle(fontSize: 35),
            )
          ],
        ),
      ),
    );
  }
}
//----------End Second Class







//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//
//
//class GoogleSignUP extends StatefulWidget {
//  @override
//  _GoogleSignUPState createState() => _GoogleSignUPState();
//}
//
//class _GoogleSignUPState extends State<GoogleSignUP> {
//  FirebaseAuth _auth = FirebaseAuth.instance;
//  FirebaseUser _user;
//
//  GoogleSignIn _googleSignIn = new GoogleSignIn();
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: Scaffold(
//          appBar: AppBar(
//            title: Text("google Authentication"),
//          ),
//          body: isSignIn
//              ? Center(
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                CircleAvatar(
//                  backgroundImage: NetworkImage(_user.photoUrl),
//                ),
//                Text(_user.displayName),
//                OutlineButton(
//                  onPressed: () {
//                    gooleSignout();
//                  },
//                  child: Text("Logout"),
//                )
//              ],
//            ),
//          )
//              : Center(
//            child: OutlineButton(
//              onPressed: () {
//                handleSignIn();
//              },
//              child: Text("SignIn with Goolge"),
//            ),
//          )),
//    );
//  }
//
//  bool isSignIn = false;
//
//  Future<void> handleSignIn() async {
//    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
//    GoogleSignInAuthentication googleSignInAuthentication =
//    await googleSignInAccount.authentication;
//
//    AuthCredential credential = GoogleAuthProvider.getCredential(
//        idToken: googleSignInAuthentication.idToken,
//        accessToken: googleSignInAuthentication.accessToken);
//
//    AuthResult result = (await _auth.signInWithCredential(credential));
//
//    _user = result.user;

//    setState(() {
//      isSignIn = true;
//    });
//  }
//
//  Future<void> gooleSignout() async {
//    await _auth.signOut().then((onValue) {
//      _googleSignIn.signOut();
//      setState(() {
//        isSignIn = true;
//      });
//    });
//  }
//}