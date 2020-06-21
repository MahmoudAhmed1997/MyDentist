import 'package:flutter/material.dart';
import 'package:white/widgets/bottomAppBarItems.dart';

import '../constants.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: kTextStyleHeadline,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomAppBarItems(
        index: 2,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.today,color: Colors.greenAccent,),
                SizedBox(width: 12.0,),
                Expanded(
                  child: Text(
                      "Your appointment with doctor Sara Sameer on Monday at 06:00 PM under review.",style: TextStyle(color: Colors.grey,fontSize: 16.0),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
