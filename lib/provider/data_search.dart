
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:white/screens/doctorpage_withoutappbar.dart';

import 'doctor.dart';
import 'doctors.dart';
import 'package:http/http.dart'as http;



class DataSearch extends SearchDelegate<String> {
  DataSearch( {
    String hintText = "type doctor name..",
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
    );
  }
  int index = 0;
  List<Doctor>doctorsInfo =[];
  Future<void> fetchDoctorsName() async {
    //final filterString = filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    var url =
        'https://clink-cc4da.firebaseio.com/doctors.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Doctor> loadedDoctorsName = [];
      extractedData.forEach((prodId, prodData) {
        loadedDoctorsName.add(Doctor(
          id: prodId,
          name: prodData['name']
        ));
      });
      doctorsInfo = loadedDoctorsName;
    } catch (error) {
      throw (error);
    }
  }
  

//  Map<String,String> doctorsName = {
//    "name" : 
//  }


  final recentList = [
    "Dr Mahmoud",
    "Dr Nadia",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  Widget _buildChild() {
    if (query == doctorsInfo[index].name) {
      return DoctorInfoWithoutAppBar(index: index);
    } else {
      return Center(
        child: Container(
          height: 100,
          width: 200.0,
          child: Text(
            "Nothing here!!",
            style: TextStyle(color: Colors.red, fontSize: 40.0),
          ),
        ),
      );
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildChild();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionResult = query.isEmpty
        ? recentList
        : doctorsInfo.where((p) => p.name==query).toList();
    return ListView.builder(
     itemCount: suggestionResult.length,
      itemBuilder: (context, index) {
        return ListTile(
            onTap: () => showResults(context),
            leading: Icon(Icons.location_city),
//            title: RichText(
//              text: TextSpan(
//                  text: suggestionResult[index].substring(0, query.length),
//                  style: TextStyle(
//                      color: Colors.black, fontWeight: FontWeight.bold),
//                  children: [
//                    TextSpan(
//                      text: suggestionResult[index].substring(query.length),
//                      style: TextStyle(color: Colors.grey),
//                    )
//                  ]),
//            )
        );
      },
    );
  }
}
