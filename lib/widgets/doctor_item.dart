
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white/provider/auth.dart';
import 'package:white/provider/doctor.dart';
import 'package:white/provider/saved_item.dart';
import 'package:white/screens/booking.dart';
import 'package:white/screens/doctor_information.dart';

import '../constants.dart';

class DoctorItem extends StatefulWidget {
  @override
  _DoctorItemState createState() => _DoctorItemState();
}

class _DoctorItemState extends State<DoctorItem> {
  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<Doctor>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    final saved = Provider.of<SavedDoc>(context, listen: false);

    double height = 120.0;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(DoctorInformation.routeName,
            arguments: doctor.id);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // SizedBox(),
            Container(
              height: 159,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        doctor.imagePath,
                      ),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0))),
//            child: Image.network(
//              doctor.imagePath,
//              fit: BoxFit.fill,
//              height:120.0,
//              width:165.0,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            doctor.name,
                            style: kTextStyleDocAndButton,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              size: 13.0,
                              color: Color(0xff8E8E93),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              doctor.city,
                              style: TextStyle(
                                  color: Color(0xff8E8E93), fontSize: 14.5),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Consumer<Doctor>(
                      builder: (ctx, doctor, _) => IconButton(
                          icon: Icon(
                            doctor.isFavorite
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                          ),
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {
                              doctor.toggleFavoriteStatus(
                                  authData.token, authData.userId);
                            });
                            saved.addItem(doctor.id, doctor.name,
                                doctor.imagePath, doctor.locationDetail);
                            Scaffold.of(context).hideCurrentSnackBar();
                            doctor.isFavorite
                                ? Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      "Added doctor to favourite list !!",
                                      textAlign: TextAlign.left,
                                    ),
                                    duration: Duration(seconds: 2),
//                            action: SnackBarAction(label: "UNDO", onPressed: (){
//                              saved.removeSingleItem(product.id);
//                            } ),
                                  ))
                                 : Scaffold.of(context).showSnackBar(SnackBar(
                                      backgroundColor: Colors.white,
                                    content: Text(
                                      "removed doctor from favourite list !!",
                                      textAlign: TextAlign.left,
                                    ),
                                    duration: Duration(seconds: 2),
//                            action: SnackBarAction(label: "UNDO", onPressed: (){
//                              saved.removeSingleItem(product.id);
//                            } ),
                                  ));
                            //    Navigator.of(context).pushNamed(SavedDoctors.routeName,arguments: doctor.id);
                          }),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(BooKingScreen.routeName,
                          arguments: doctor.id);
                    },
                    child: Text("Book Now",
                        style: kTextStyleDocAndButton.copyWith(
                          color: Color(0xff1DE9B6),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
