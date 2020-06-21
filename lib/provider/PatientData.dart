
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:white/model/http_exception.dart';
import 'package:white/provider/patient_name.dart';

class PatientData with ChangeNotifier {

  List<PatientDetails> _patients = [


  ];

  PatientData(this.token,this.userId,this._patients);

 // PatientData(this.userId, this.authToken,this._patients);


  List<PatientDetails>get patients {
    return [..._patients];

  }
  PatientDetails findById(String id) {
    return _patients.firstWhere((pat) => pat.id == id);
  }
  void addData(String newData){
    patients.add(PatientDetails(procedure: newData));
    notifyListeners();

  }
  void addNote(String newData){
    patients.add(PatientDetails(note : newData));
    notifyListeners();

  }
  void addDate(DateTime newDate){
    patients.add(PatientDetails(day : newDate));
    notifyListeners();

  }
  List<String> _appointment =[
    "4:00 PM","5:00 PM","6:00 PM","7:00 PM","8:00 PM","9:00 PM"
  ];
  List<String> get appointment {
    return _appointment;
  }
//  Patient findById(String id) {
//    return _patients.firstWhere((pat) => pat.id == id);
//  }
   final String token;  final String userId;

  Future<void> addPatientData(PatientDetails patient) async {

    final url =

    "https://clink-cc4da.firebaseio.com/paitentsData.json?auth=$token";

    try {
      final response = await http.post(
        url,
        body: json.encode({
        'name': patient.name,
        'phone': patient.phone,
        'age': patient.age,
        'note': patient.note,
        'procedure':patient.procedure,
        'appointment':patient.appointment,
        'day':patient.day,
         'creatorId':userId
        }),
      );
      final newPatient = PatientDetails(
        name: patient.name,
        phone: patient.phone,
        age: patient.age,
        note: patient.note,
        procedure: patient.procedure,
        appointment: patient.appointment,
        day: patient.day,
        id: json.decode(response.body)['name'],
      );
      _patients.add(newPatient);
    // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }

  }
  Future<void> deletePatient(String id) async {
    final url =
        'https://clink-cc4da.firebaseio.com/paitentsData/$id.json?auth=$token';
    final existingPatientsIndex = _patients.indexWhere((appointment) => appointment.id == id);
    var existingPatient = _patients[existingPatientsIndex];
    _patients.removeAt(existingPatientsIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _patients.insert(existingPatientsIndex, existingPatient);
      notifyListeners();
      throw HttpException('Could not delete appointment.');
    }
    existingPatient = null;
  }
//  Patient findById(String id) {
//    return _patients.firstWhere((pat) => pat.id == id);
//  }
//  void addPatientData (Patient patient) async{
//    final url = "https://clink-cc4da.firebaseio.com/PatientData.json?auth=$authToken";
//   final response = await http.post(
//      url,
//      body: json.encode({
//        'name': patient.name,
//        'phone': patient.phone,
//        'age': patient.age,
//        'note': patient.note,
//        'procedure':patient.procedure,
//        'appointment':patient.appointment,
//        'day':patient.day,
//        'creatorId':userId
//       // 'creatorId': userId,
//      }),
//    );
//
//    notifyListeners();
//  }
}