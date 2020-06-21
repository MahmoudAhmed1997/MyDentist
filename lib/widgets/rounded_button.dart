import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class RoundedButtonSignUp extends StatelessWidget {
  final materialColor;
  final buttonColor;
  final textButton;
  final image;
  final  onPress;
  const RoundedButtonSignUp(
      {Key key, this.materialColor, this.buttonColor, this.textButton,this.image,this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      child: Material(
        color: materialColor,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: MaterialButton(
          onPressed: onPress,
          //color: Color(0xff7676801F),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: image,fit: BoxFit.fill,height: 18.0,),
              SizedBox(width: 7.0,),Text(
                textButton,
                style: TextStyle(
                    color: buttonColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}