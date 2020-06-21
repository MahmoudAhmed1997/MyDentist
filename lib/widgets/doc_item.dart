//import 'package:clincapp/provider/saved_item.dart';
//import 'package:clincapp/screens/booking.dart';
//import 'package:clincapp/screens/doctor_information.dart';
//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//import '../constants.dart';
//
//class DoctorItemFavourite extends StatelessWidget {
//  final String id;
//  final String doctorId;
//  final String name;
//  final String imagePath;
//  final String location;
//  final prefs = SharedPreferences.getInstance();
//
//  DoctorItemFavourite(this.id, this.doctorId, this.name, this.imagePath, this.location);
//
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Dismissible(
//      key: ValueKey(id),
//      background: Container(
//        color: Theme.of(context).errorColor,
//        child: Icon(
//          Icons.delete,
//          color: Colors.white,
//          size: 40,
//        ),
//        alignment: Alignment.centerRight,
//        padding: EdgeInsets.only(right: 20),
//        margin: EdgeInsets.symmetric(
//          horizontal: 15,
//          vertical: 4,
//        ),
//      ),
//      direction: DismissDirection.endToStart,
//      confirmDismiss: (direction) {
//        return showDialog(
//            context: context,
//            builder: (ctx) => AlertDialog(
//              title: Text("Are you sure ?"),
//              content: Text('Do you want to remove the doctor from the favourite list?'),
//              actions: <Widget>[
//                FlatButton(
//                  child: Text("No"),
//                  onPressed: () {
//                    Navigator.of(ctx).pop(false);
//                  },
//                ),
//                FlatButton(
//                  child: Text("Yes"),
//                  onPressed: () {
//
//                    Navigator.of(ctx).pop(true);
//                  },
//                ),
//              ],
//            ));
//      },
//      onDismissed: (direction) {
//        Provider.of<SavedDoc>(context, listen: false).removeItem(doctorId);
//      },
//      child:Card(
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(15.0),
//        ),
//        color: Colors.white,
//        elevation: 0.6,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            // SizedBox(),
//            Container(
//              height: 159,
//              width: MediaQuery.of(context).size.width,
//              decoration: BoxDecoration(
//                  image: DecorationImage(
//                      image: NetworkImage(
//                        imagePath,
//                      ),
//                      fit: BoxFit.fill),
//                  borderRadius: BorderRadius.only(
//                      topRight: Radius.circular(12.0),
//                      topLeft: Radius.circular(12.0))),
////            child: Image.network(
////              doctor.imagePath,
////              fit: BoxFit.fill,
////              height:120.0,
////              width:165.0,
//            ),
//
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                  children: <Widget>[
//                    Column(
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.only(top: 10.0),
//                          child: Text(
//                            name,
//                            style: kTextStyleDocAndButton,
//                          ),
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            Icon(
//                              Icons.location_on,
//                              size: 13.0,
//                              color: Color(0xff8E8E93),
//                            ),
//                            SizedBox(
//                              width: 4.0,
//                            ),
//                            Text(
//                             location,
//                              style: TextStyle(
//                                  color: Color(0xff8E8E93), fontSize: 14.5),
//                              textAlign: TextAlign.center,
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//                Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 10),
//                  child: FlatButton(
//                    onPressed: () {
//                      Navigator.of(context).pushNamed(BooKingScreen.routeName,
//                          arguments: doctorId);
//                    },
//                    child: Text("Book Now",
//                        style: kTextStyleDocAndButton.copyWith(
//                          color: Color(0xff1DE9B6),
//                        )),
//                  ),
//                ),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
