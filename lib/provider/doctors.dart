import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:white/model/doctor_search.dart';
import 'package:white/provider/doctor.dart';
class Doctors with ChangeNotifier {
   List<Doctor> _doctorsInfo = [
//    Doctor(
//        id: "D1",
//        name: "Dr Mohammed",
//        about:
//            " loves creating a calm, relaxing atmosphere for all his patients, often playing instrumental music in the background. He focuses on providing high quality conservative treatment with the best possible technology and materials available.",
//        imagePath: "assets/imagesH/photo.png",
//        city: "Gaza",
//        locationDetail: "Gaza , Al-Rimal"),
//    Doctor(
//        id: "D2",
//        name: "Dr Rema",
//        about:
//            " is known for her friendly smile. Always trying to keep your best interests in mind, Dr Rami strives to provide personalised high quality care.",
//        imagePath: "assets/imagesH/photo-1.png",
//        city: "Khan Yunis",
//        locationDetail: "Khan Yunis , Jasser Building"),
//    Doctor(
//        id: "D3",
//        name: "Dr Husam",
//        about:
//            " has a caring and gentle way of treating her patients. She likes to spend time educating and sharing information so that her patients can make an informed decision. She always has her patient’s best interests in mind while delivering professional and quality treatment.",
//        imagePath: "assets/imagesH/photo-2.png",
//        city: "North Gaza",
//        locationDetail: "North Gaza , Beit Lahiya"),
//    Doctor(
//        id: "D4",
//        name: "Dr Nadia",
//        about:
//            "graduated from medicine at the end of 1999. He worked in various capacities as a medical practitioner until 2003. In 2003, he started working as an intensive care doctor and subsequently as a maxillofacial surgery doctor. His further training then took him from Townsville to Melbourne to Hobart then Hamilton and Auckland. ",
//        imagePath: "assets/imagesH/photo-3.png",
//        city: "Rafah",
//        locationDetail: "Rafah , Tall as-Sultan"),
//    Doctor(
//        id: "D5",
//        name: "Dr Mahmoud",
//        about:
//            "Abed is passionate about providing high quality dental hygiene and therapy. Patients often comment on her ability to make them feel at ease and relaxed during treatment. She has a calm and patient nature with a thoroughness and attention to detail that her clients appreciate.",
//        imagePath: "assets/imagesH/photo-4.png",
//        city: "Jabalia",
//        locationDetail: "Jabalia , Al_Nazla"),
//    Doctor(
//        id: "D6",
//        name: "Dr fathia",
//        about:
//            "As our practice manager, Rebekah looks after the day to day running of the clinic. She is always updating herself with codes of practice, cross-infection control and new materials and equipment. Rebekah has enjoyed working in the dental industry for many years, ",
//        imagePath: "assets/imagesH/photo-5.png",
//        city: "Deir al-Balah",
//        locationDetail: "Deir al-Balah , Palm Street"),
  ];


   final String authToken;
   final String userId;

   Doctors(this.authToken, this.userId, this._doctorsInfo);

  List<Doctor> get doctorsInfo {
    return [..._doctorsInfo];
  }

  Doctor findById(String id) {
    return _doctorsInfo.firstWhere((doc) => doc.id == id);
  }

  List<Doctor> get favoriteItems {
    return _doctorsInfo.where((docItem) => docItem.isFavorite).toList();
  }
   List<Doctor> _filteredUsers = List();
   List<Doctor> get filteredUsers {
     return [..._filteredUsers];
   }

   Future<void> fetchAndSetDoctors([bool filterByUser = false]) async {
     final filterString = filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
     var url =
         'https://clink-cc4da.firebaseio.com/doctors.json?auth=$authToken&$filterString';

     try {
       final response = await http.get(url);
       final extractedData = json.decode(response.body) as Map<String, dynamic>;
       if (extractedData == null) {
         return;
       }
       url =
       'https://clink-cc4da.firebaseio.com/userFavorites/$userId.json?auth=$authToken';
       final favoriteResponse = await http.get(url);
       final favoriteData = json.decode(favoriteResponse.body);
       final List<Doctor> loadedDoctors = [];
       extractedData.forEach((doctorId, doctorData) {
         loadedDoctors.add(Doctor(
           id: doctorId,
           name: doctorData['name'],
           about: doctorData['about'],
           imagePath: doctorData['imagePath'],
           isFavorite:
           favoriteData == null ? false : favoriteData[doctorId] ?? false,
           city: doctorData['city'],
           locationDetail: doctorData['locationDetail'],
           imageGalary1: doctorData['imageGalary1'],
           imageGalary2: doctorData['imageGalary2'],
           imageGalary3: doctorData['imageGalary3'],
           longitude: doctorData['longitude'],
           latitude: doctorData['latitude'],

         ));
       });
       _doctorsInfo = loadedDoctors;
       notifyListeners();
     } catch (error) {
       throw (error);
     }
   }

//   void showFavoritesOnly() {
//     _showFavoritesOnly = true;
//     notifyListeners();
//   }
//
//   void showAll() {
//     _showFavoritesOnly = false;
//     notifyListeners();
//   }
}
