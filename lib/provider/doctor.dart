import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Doctor with ChangeNotifier {
  String id;
  String name;
  String about;
  String imagePath;
  String city;
  String locationDetail;String imageGalary1;
  String imageGalary2;
  String imageGalary3;
  double longitude;
  double latitude;
  bool isFavorite;

  Doctor
      ({@required this.id,
    @required this.name,
    @required this.about,
    @required this.imagePath,
    @required this.city,
    @required this.locationDetail,
    @required this.imageGalary1,
    @required this.imageGalary2,
    @required this.imageGalary3,
    @required this.longitude,
    @required this.latitude,

    this.isFavorite = false});

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }
//

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url =
        'https://clink-cc4da.firebaseio.com/userFavorites/$userId/$id.json?auth=$token';
    try {
      final response = await http.put(
        url,
        body: json.encode(
          isFavorite,
        ),
      );
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (error) {
      _setFavValue(oldStatus);
    }
  }

}
