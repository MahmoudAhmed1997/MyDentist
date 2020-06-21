
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white/provider/Comment_Data.dart';
import 'package:white/widgets/rating_bar.dart';

import '../constants.dart';


class ReviewsList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Consumer<CommentData>(
          builder: (context,commentData,child){
            return ListView.builder(
                itemBuilder: (context, index) {
                   return Container(
                    height: 120.0,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Mahmoud",
                              style: kTextStyleHeadline.copyWith(color: Color(0xff8E8E93)),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                           // RatingWidget()
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              commentData.comments[index].text,
                              style: kTextStyleHeadline.copyWith(
                                  fontWeight: FontWeight.w100, color: Color(0xff8E8E93)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Divider()
                      ],
                    ),
                  );
                },
                itemCount: commentData.commentCount,
              
            );
          },

        ));
  }
}
