import 'package:flutter/material.dart';

import 'home_page.dart';

class EmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("My Schedual"),
      ),
      body: Column(
        children: <Widget>[
          Icon(Icons.error,size: 150,color: Colors.grey,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  "There are no reservations yet!!",
                  style: TextStyle(color: Colors.red, fontSize: 25.0),
                ),
              ),
              SizedBox(height: 50.0,),
              RaisedButton(
                color: Colors.white,
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DentalHomePage())),
                child: Text(
                  "Return to Home Page",
                  style: TextStyle(color: Colors.greenAccent, fontSize: 25.0),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
