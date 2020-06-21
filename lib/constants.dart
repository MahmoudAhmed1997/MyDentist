import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const kTextStyleMyScheduleWords = TextStyle(color: Color(0xff8E8E93),fontSize: 18.0);
const kTextStyleDocAndButton = TextStyle(fontSize: 17.0);
const kTextStyleFlatButtonInUserInfo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500);
const kTextStyleHeadline =
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400);
const kDecorationContainer = BoxDecoration(
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
);
const kDecorationContainerGallery =
    BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.0)));
const kTextStyleBookingTwo =
    TextStyle(color: Color(0xff8E8E93), fontSize: 18.0);
const KTextFieldDecoration = InputDecoration(
    contentPadding:
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: "",hintStyle: TextStyle(color: Color(0xffC2C2C2)),
    filled: true,
    fillColor: Color(0xffEFEFF4),
    enabled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(15.0))),
    //icon: Icon(Icons.arrow_drop_down),

    alignLabelWithHint: true,
    labelStyle: TextStyle(color: Colors.black));
