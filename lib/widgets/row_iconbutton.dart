import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RowIconandButton extends StatelessWidget {
  final Function onPress;
  final icon;
  final text;
  final styleText;
  const RowIconandButton({Key key, this.text,this.onPress, this.icon,this.styleText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                icon,
                color: Color(0xff8E8E93),
              ),
              SizedBox(
                width: 10.0,
              ),
              FlatButton(
                  onPressed:onPress,
                  child: Text(
                    text,
                    style:styleText,
                  )),

            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],

      ),
    );
  }
}
