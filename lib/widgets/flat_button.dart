import 'package:flutter/material.dart';
class FlatButtonStyle extends StatelessWidget {
  final color ;
  final text;
  final radius ;
  final Function onPress;


  const FlatButtonStyle({Key key, this.text,this.color,this.radius,this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: FlatButton(
        onPressed: onPress,
        child: Text(text,
            style: TextStyle(color: color, fontSize: 16.0)),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: color, width:1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
