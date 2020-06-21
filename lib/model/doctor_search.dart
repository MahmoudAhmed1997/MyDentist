import 'package:flutter/cupertino.dart';

class DoctorSearch with ChangeNotifier{
  String id;
  String name;
  String city;

  DoctorSearch({this.id, this.name, this.city});
//
//  factory DoctorSearch.fromJson(Map<String, dynamic> json) {
//    return DoctorSearch(
//      name: json["name"] as String,
//      city: json["city"] as String,
//    );
//  }
}