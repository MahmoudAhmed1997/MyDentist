//import 'dart:convert';
//import 'package:http/http.dart' as http;
//import 'package:white/model/doctor_search.dart';
//
//class Services {
//  static const String url = 'https://clink-cc4da.firebaseio.com/doctors.json';
//
//  static Future<List<DoctorSearch>> getDoctors() async {
//    try {
//      final response = await http.get(url);
//      if (response.statusCode == 200) {
//        List<DoctorSearch> list = parseUsers(response.body);
//        return list;
//      } else {
//        throw Exception("Error");
//      }
//    } catch (e) {
//      throw Exception(e.toString());
//    }
//  }
//
//  static List<DoctorSearch> parseUsers(String responseBody) {
//    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//    return parsed.map<DoctorSearch>((json) => DoctorSearch.fromJson(json)).toList();
//  }
//}