
import 'dart:io';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:white/widgets/flat_button.dart';
import 'package:white/widgets/textfieldstyle.dart';

import '../constants.dart';


double radius =30.0;
class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController controllerNickname;
  TextEditingController controllerAboutMe;

  SharedPreferences prefs;

  String id = '';
  String name = '';
  String email = '';
  String photoUrl = '';
  int phoneNumber = 0;
  int birthDay = 0;
  String nameEmergency = '';
  int phoneNumberEmergency = 0;

  bool isLoading = false;
  File avatarImageFile;

  final FocusNode focusNodeNickname = new FocusNode();
  final FocusNode focusNodeAboutMe = new FocusNode();

  @override
  void initState() {
    super.initState();
    readLocal();
  }

  void readLocal() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id') ?? '';
    name = prefs.getString('nickname') ?? '';
    phoneNumber = prefs.getInt('phoneNumber') ?? '';
    photoUrl = prefs.getString('photoUrl') ?? '';

    controllerNickname = new TextEditingController(text: name);
    controllerAboutMe = new TextEditingController(text: phoneNumber.toString());

    // Force refresh input
    setState(() {});
  }

  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        avatarImageFile = image;
        isLoading = true;
      });
    }
    uploadFile();
  }

  Future uploadFile() async {
    String fileName = id;
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = reference.putFile(avatarImageFile);
    StorageTaskSnapshot storageTaskSnapshot;
    uploadTask.onComplete.then((value) {
      if (value.error == null) {
        storageTaskSnapshot = value;
        storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
          photoUrl = downloadUrl;
          Firestore.instance
              .collection('users')
              .document(id)
              .updateData({'name': name, 'phoneNumber': phoneNumber, 'photoUrl': photoUrl}).then((data) async {
            await prefs.setString('photoUrl', photoUrl);
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(msg: "Upload success");
          }).catchError((err) {
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(msg: err.toString());
          });
        }, onError: (err) {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(msg: 'This file is not an image');
        });
      } else {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: 'This file is not an image');
      }
    }, onError: (err) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: err.toString());
    });
  }

  void handleUpdateData() {
    focusNodeNickname.unfocus();
    focusNodeAboutMe.unfocus();

    setState(() {
      isLoading = true;
    });

    Firestore.instance
        .collection('users')
        .document(id)
        .updateData({'name': name, 'phoneNumber': phoneNumber, 'photoUrl': photoUrl}).then((data) async {
      await prefs.setString('name', name);
      await prefs.setString('phoneNumber', phoneNumber.toString());
      await prefs.setString('photoUrl', photoUrl);

      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: "Update success");
    }).catchError((err) {
      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: err.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0.0,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          color: Color(0xffFFFFFF),
          child: ListView(
            children: <Widget>[
              Center(
                child:Stack(
                  children: <Widget>[
                    (avatarImageFile == null)
                        ? (photoUrl != ''
                        ? Material(
                      child: CachedNetworkImage(
                        placeholder: (context, url) => Container(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                          ),
                          width: 90.0,
                          height: 90.0,
                          padding: EdgeInsets.all(20.0),
                        ),
                        imageUrl: photoUrl,
                        width: 90.0,
                        height: 90.0,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      clipBehavior: Clip.hardEdge,
                    )
                        : Icon(
                      Icons.account_circle,
                      size: 90.0,
                      color: Colors.grey,
                    ))
                        : Material(
                      child: Image.file(
                        avatarImageFile,
                        width: 90.0,
                        height: 90.0,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      clipBehavior: Clip.hardEdge,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      onPressed: getImage,
                      padding: EdgeInsets.all(30.0),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.grey,
                      iconSize: 30.0,
                    ),
                  ],
                ),
//                child: Column(
//                  children: <Widget>[
//                    CircleAvatar(
//                      maxRadius: 50.0,
//                      backgroundColor: Colors.white,
//                      child: CircleAvatar(
//                        maxRadius: 50.0,
//                        backgroundImage:
//                            AssetImage("assets/images/mahmoud1.jpg"),
//                      ),
//                    ),
//                    FlatButton(
//                      onPressed: () {
//                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UploadImage()));
//                      },
//                      child: Text(
//                        "Change profile photo",
//                        style: kTextStyleFlatButtonInUserInfo.copyWith(
//                            color: Color(0xff1DB6E9)),
//                      ),
////                    ), (_inProcess)?Container(
////                      color: Colors.white,
////                      height: MediaQuery.of(context).size.height * 0.95,
////                      child: Center(
////                        child: CircularProgressIndicator(),
////                      ),
////                    ):Center()
//                    )],
//                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Profile Information",
                    style:
                        kTextStyleHeadline.copyWith(color: Color(0xff8E8E93)),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                TextFieldStyle(
                  text: "Name",
                  decoration: KTextFieldDecoration,
                  keyboardType: TextInputType.text,
                ),
                TextFieldStyle(
                  text: "Email",
                  decoration: KTextFieldDecoration,
                  keyboardType: TextInputType.text,
                ),
                TextFieldStyle(
                  text: "Phone Number",
                  decoration: KTextFieldDecoration,
                  keyboardType: TextInputType.text,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Gender",style: kTextStyleBookingTwo,

                      ),
                      SizedBox(height: 15.0,),
                      Row(children: <Widget>[
                        FlatButtonStyle(
                          color: Color(0xff1DE9B6),
                          radius: 10.0,



                          text: "Male",
                        ),
                        SizedBox(width: 15.0,),
                        FlatButtonStyle(
                          radius: 10.0,

                          color: Color(0xff8E8E93),
                          text: "Female",
                        ),
                      ],)
                    ],
                  ),
                ),
                //Gender
                TextFieldStyle(
                  text: "Birthday",
                  decoration: KTextFieldDecoration,
                  keyboardType: TextInputType.text,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Close Person for emeregency Cases",
                        style: kTextStyleHeadline.copyWith(
                            color: Color(0xff8E8E93), fontSize: 15.0),
                      )
                    ],
                  ),
                ),
                TextFieldStyle(
                  text: "Name",
                  decoration: KTextFieldDecoration,
                  keyboardType: TextInputType.text,
                ),
                TextFieldStyle(
                  text: "Phone Number",
                  decoration: KTextFieldDecoration,
                  keyboardType: TextInputType.text,
                ),
              ],)

            ],
          ),
        ),
      ),
    );
  }
}
