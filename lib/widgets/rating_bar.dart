//import 'package:flutter/material.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
//class RatingWidget extends StatefulWidget {
//  @override
//  _RatingWidgetState createState() => _RatingWidgetState();
//}
//
//class _RatingWidgetState extends State<RatingWidget> {
//  double _rating ;
//  double rating ;
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//
//      child: Row(
//        children: <Widget>[
//          RatingBar(
//            onRatingUpdate: (rating) {
//              setState(() {
//                var text =  Text(rating.toString());
//                print(text);
//              });
//            },
//            initialRating: 3,
//            minRating: 1,
//            itemSize: 10.0,
//            direction: Axis.horizontal,
//            allowHalfRating: true,
//            itemCount: 5,
//            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
//            itemBuilder: (context, _) => Icon(
//              Icons.star,
//              color: Colors.amber,
//            ),
//
//          ),
//
//
//        ],
//      ),
//    );
//  }
//}
