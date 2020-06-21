

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:white/provider/auth.dart';
import 'package:white/provider/doctor.dart';
import 'package:white/provider/doctors.dart';
import 'package:white/screens/review_list.dart';
import 'package:white/widgets/gallery_list.dart';
import 'package:white/widgets/rating_bar.dart';
import '../constants.dart';
import 'add_comment_review.dart';
import 'booking.dart';
import 'google_maps.dart';


class DoctorInfoWithoutAppBar extends StatefulWidget {

  final int index;

  const DoctorInfoWithoutAppBar({Key key, this.index})
      : super(
    key: key,
  );

  @override
  _DoctorInfoWithoutAppBarState createState() => _DoctorInfoWithoutAppBarState();
}

class _DoctorInfoWithoutAppBarState extends State<DoctorInfoWithoutAppBar> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
//    final doctor = Provider.of<Doctor>(
//      context,
//
//    );
//    final productsData = Provider.of<Doctors>(context);
//    final products = showFavs ? productsData.favoriteItems : productsData.doctorsInfo;

    final doctorId = ModalRoute.of(context).settings.arguments as String;
    final loadedDoctor = Provider.of<Doctors>(
        context,
        listen: false
    ).findById(doctorId);
    return Material(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData.fallback(),
          backgroundColor: Color(0xffFFFFFF),
          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text(""),
                ),
                PopupMenuItem(
                  child: Text(""),
                ),
                PopupMenuItem(
                  child: Text(""),
                ),
              ],
            ),
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 2.0, left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 129,
                    width: 129,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: AssetImage(loadedDoctor.imagePath),
                            fit: BoxFit.fill)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        loadedDoctor.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 23.0),
                      ),
                 //     RatingWidget(),
                      // RatingBarRow(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          height: 60.0,
                          width: 150,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(BooKingScreen.routeName,arguments: loadedDoctor.id);
                            },
                            child: Text('Book Now',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20.0)),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.green,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80.0),
                    child:  Consumer<Doctor>(
                      builder: (ctx,doctor,_)=>
                          IconButton(
                              icon: Icon(
                                loadedDoctor.isFavorite ? Icons.bookmark_border : Icons.bookmark,
                              ),
                              color: Theme.of(context).accentColor,
                              onPressed:(){
                                setState(() {
                                  loadedDoctor.toggleFavoriteStatus(
                                      auth.token, auth.userId);
                                });
                              }


                          ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.location_on),
                  onPressed: () {},
                ),
                Expanded(
                  child: Text(
                    loadedDoctor.locationDetail,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoogleMapScreen()));
                    },
                    child: Text(
                      "Open Google Maps",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ))
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            ListTile(
              title: Text(
                "About",
                style: kTextStyleHeadline,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  loadedDoctor.about,
                  maxLines: 5,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Gallary",
                    style: kTextStyleHeadline,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            GalleryList(),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Rview",
                style: kTextStyleHeadline,
              ),
            ),
//            Padding(
//              padding:
//                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//              child: ListOfCommentsDecor(),
//            ),
//            Padding(
//              padding:
//                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//              child: ListOfCommentsDecor(),
//            ),
//            Padding(
//              padding:
//                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//              child: ListOfCommentsDecor(),
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                FlatButton(
//                    onPressed: () {},
//                    child: Text(
//                      "Add review",
//                      style:
//                          kTextStyleHeadline.copyWith(color: Color(0xff1DB6E9)),
//                    )),
//              ],
//            ),
            SizedBox(
              height: 20.0,
            ),
            Container(height: 300.0, child: ReviewsList()),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => AddCommentScreen());
                    },
                    backgroundColor: Colors.lightBlueAccent,
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




