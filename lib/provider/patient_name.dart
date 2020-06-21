import 'package:flutter/material.dart';

class PatientDetails with ChangeNotifier{
  final String id;
  final String name ;
  final int phone;
  final int age;
  final String note;
  final String procedure;
  final DateTime appointment;
  final DateTime day;

  PatientDetails({this.id,this.name, this.phone, this.age, this.note,this.procedure,this.appointment,this.day});

}