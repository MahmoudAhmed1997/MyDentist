import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white/provider/Comment_Data.dart';
class AddCommentScreen extends StatelessWidget {
  


  @override
  Widget build(BuildContext context)  {

 
    String newTextTitle;

    return Scaffold(
     // extendBody: true,
      resizeToAvoidBottomPadding: true,
      body: Container(
        color: Color(0xff757575),
        child: Container(
          height: 1000.0,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    20.0,
                  ),
                  topRight: Radius.circular(20.0))),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Text(
                "Add Review",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlue, fontSize: 30.0),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  newTextTitle = newText;
                },
              ),
              FlatButton(

                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.lightBlue,
                onPressed: () {
                  Provider.of<CommentData>(context,listen: false).addComment(newTextTitle);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
