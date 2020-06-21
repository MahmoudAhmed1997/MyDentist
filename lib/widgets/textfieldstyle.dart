import 'package:flutter/material.dart';

import '../constants.dart';


class TextFieldStyle extends StatelessWidget {
final text;
final decoration;
final keyboardType;
final  Function onChanged;
const TextFieldStyle({Key key, this.text, this.decoration, this.keyboardType,this.onChanged})
: super(key: key);

@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: kTextStyleBookingTwo,
        ),
        SizedBox(
          height: 12.0,
        ),

         TextField(
           onChanged:onChanged ,




            keyboardType: keyboardType,
            decoration: decoration,
          ),

      ],
    ),
  );
}
}
