import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:white/provider/auth.dart';
import 'package:white/provider/doctor.dart';
import 'package:white/provider/doctors.dart';
import 'package:white/provider/saved_item.dart';
import 'package:white/screens/doctor_information.dart';
import 'package:white/widgets/bottomAppBarItems.dart';
import 'package:white/widgets/doctor_grid.dart';
import 'package:white/widgets/search_button.dart';

import '../constants.dart';

enum FilterOptions {
  Favorites,
  All,
}

class DentalHomePage extends StatefulWidget {
  static String routeName = "/dental_home_page";

  final index;
  final colorBottomIcon;
   DentalHomePage({
    this.index,
    this.colorBottomIcon,
  });
  @override
  _DentalHomePageState createState() => _DentalHomePageState();
}
class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _DentalHomePageState extends State<DentalHomePage> {
  final _debouncer = Debouncer(milliseconds: 500);
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {

     Future.delayed(Duration.zero).then((_) {
     Provider.of<Doctors>(context,listen: false).fetchAndSetDoctors();
   });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Doctors>(context).fetchAndSetDoctors().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<Doctor> doctors = Provider.of<Doctors>(context).doctorsInfo;
    List<Doctor> doctorsSearch = Provider.of<Doctors>(context).filteredUsers;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(

          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffFFFFFF),
          title: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text(
              "HOME",
              style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: <Widget>[
            PopupMenuButton(
              color: Colors.white,
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBarItems(index: 0),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                right: 20.0, left: 20.0, bottom: 20.0, top: 30.0),

            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search by name or city',
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    doctorsSearch = doctors
                        .where((u) => (u.name
                        .toLowerCase()
                        .contains(string.toLowerCase()) ||
                        u.city.contains(string.toLowerCase())))
                        .toList();
                  });
                });
              },
            ),
            // child: SearchButton(),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.6,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : DoctorsGrid(_showOnlyFavorites),
              ))
        ]));
  }
}




