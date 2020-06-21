import 'package:flutter/material.dart';
import 'package:white/screens/user_information.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,title: Text("About Us"),),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top:70.0,right: 25.0,left: 25.0),
        child: Column(

          children: <Widget>[
            Container(
              height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        image: AssetImage("assets/images/uni.jpg",),fit: BoxFit.cover,),)),
           SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),

                    child: Text(
                      "Hello ,",
                      style: TextStyle(color: Colors.grey,fontSize: 16)
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),),

                    child: Text(
                      "We are university students studying software engineering at the University of Palestine from Gaza.",
                      style: TextStyle(color: Colors.grey,fontSize: 16)
                    ),
                  ),
                  //SizedBox(height: 12.0,),

                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),

                    child: Text(
                      "This project is a graduation project from this Faculty of Engineering from 2020.",
                      style: TextStyle(color: Colors.grey,fontSize:16)
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
