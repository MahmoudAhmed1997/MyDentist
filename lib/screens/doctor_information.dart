
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white/provider/auth.dart';
import 'package:white/provider/doctor.dart';
import 'package:white/provider/doctors.dart';
import 'package:white/screens/about_us_screen.dart';
import 'package:white/screens/review_list.dart';
import 'package:white/screens/user_information.dart';
import 'package:white/widgets/gallery_list.dart';
import 'package:white/widgets/rating_bar.dart';

import '../constants.dart';
import 'add_comment_review.dart';
import 'booking.dart';
import 'google_maps.dart';

enum pageEnum {about,setting}
class DoctorInformation extends StatefulWidget {
  final bool showFavs ;
  static const routeName = '/doctor-information';

  const DoctorInformation({Key key, this.showFavs}) : super(key: key);

  @override
  _DoctorInformationState createState() => _DoctorInformationState();
}

class _DoctorInformationState extends State<DoctorInformation> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);


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
              color: Colors.white,
              onSelected: (pageEnum value) {
                switch(value){
                  case pageEnum.about:
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutUs()));
                    break;
                  case pageEnum.setting:
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) => UserInformation()));
                    break;
                }
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('About'),
                  value: pageEnum.about,

                ),
                PopupMenuItem(
                  child: Text('Setting'),
                  value: pageEnum.setting,
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
                        image: DecorationImage(
                            image: NetworkImage(
                              loadedDoctor.imagePath,
                            ),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                           )),
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
                     // RatingWidget(),
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
                            loadedDoctor.isFavorite ? Icons.bookmark : Icons.bookmark_border,
                          ),
                          color:Colors.grey,
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
                  icon: Icon(Icons.location_on,color: Colors.grey,),
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
                      Navigator.of(context).pushNamed(GoogleMapScreen.routeName,arguments: loadedDoctor.id);

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
