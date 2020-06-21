//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/widgets.dart';
//import 'package:provider/provider.dart';
//import 'package:white/provider/auth.dart';
//import 'package:white/provider/doctor.dart';
//import 'package:white/provider/doctors.dart';
//import 'package:white/provider/saved_item.dart';
//import 'package:white/widgets/bottomAppBarItems.dart';
//import 'package:white/widgets/doctor_grid.dart';
//import 'package:white/widgets/search_button.dart';
//
//import '../constants.dart';
//import 'doctor_information.dart';
//
//
//enum FilterOptions {
//  Favorites,
//  All,
//}
//class SearchPage extends StatefulWidget {
// // static String routeName = "/search_page";
//
//  @override
//  _SearchPageState createState() => _SearchPageState();
//}
//
//class _SearchPageState extends State<SearchPage> {
//  var _isInit = true;
//  var _isLoading = false;
//
//  @override
//  void initState() {
//    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
//    // Future.delayed(Duration.zero).then((_) {
//    //   Provider.of<Products>(context).fetchAndSetProducts();
//    // });
//    super.initState();
//  }
//
//  @override
//  void didChangeDependencies() {
//    if (_isInit) {
//      setState(() {
//        _isLoading = true;
//      });
//      Provider.of<Doctors>(context).fetchAndSetDoctors().then((_) {
//        setState(() {
//          _isLoading = false;
//        });
//      });
//    }
//    _isInit = false;
//    super.didChangeDependencies();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//        resizeToAvoidBottomInset: true,
//
//        bottomNavigationBar: BottomAppBarItems(index: 0),
//        body: ListView(
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.only(
//                    right: 20.0, left: 20.0, bottom: 20.0, top: 30.0),
//                child: SearchButton(),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              Padding(
//                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
//                  child: Container(
//                    height: MediaQuery.of(context).size.height / 1.6,
//                    child:_isLoading
//                        ? Center(
//                      child: CircularProgressIndicator(),
//                    )
//                        : DoctorsGrid(),
//                  ))]));
//  }
//}
//
//
//
//class DoctorsGrid extends StatelessWidget {
//
//
//  @override
//  Widget build(BuildContext context) {
//    final productsData = Provider.of<Doctors>(context);
//    final products =productsData.doctorsInfo;
//    return GridView.builder(
//      padding: const EdgeInsets.all(10.0),
//      itemCount: products.length,
//      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
//        // builder: (c) => products[i],
//        value: products[i],
//        child: DoctorItem(
//        ),
//      ),
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 2,
//        childAspectRatio: 3.5 / 2,
//        crossAxisSpacing: 10,
//        mainAxisSpacing: 10,
//      ),
//    );
//  }
//}
//
//
//
//class DoctorItem extends StatefulWidget {
//  @override
//  _DoctorItemState createState() => _DoctorItemState();
//}
//
//class _DoctorItemState extends State<DoctorItem> {
//  @override
//  Widget build(BuildContext context) {
//    final doctor = Provider.of<Doctor>(context, listen: false);
//
//
//    return Card(
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.circular(15.0),
//      ),
//      color: Colors.white,
//      elevation: 0.6,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          // SizedBox(),
//
//
//          Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceAround,
//                children: <Widget>[
//                  Column(
//                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.only(top: 10.0),
//                        child: Text(
//                          doctor.name,
//                          style: kTextStyleDocAndButton,
//                        ),
//                      ),
//                      SizedBox(height: 12.0,),
//                      Text(
//                        doctor.city,
//                        style: TextStyle(
//                            color: Color(0xff8E8E93), fontSize: 14.5),
//                        textAlign: TextAlign.center,
//                      ),
//                    ],
//                  ),
//
//                ],
//              ),
//
//            ],
//          ),
//        ],
//      ),
//    );
//  }
//}
//
