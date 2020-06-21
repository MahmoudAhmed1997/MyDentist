import 'package:flutter/material.dart';
import 'package:white/provider/data_search.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0, width: double.infinity,


      child: RaisedButton(
        shape: RoundedRectangleBorder(
          //  side: BorderSide(color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
          onPressed: () {
        showSearch(
              context: context, delegate: DataSearch());
      },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.grey,
              size: 30,
            ),
            SizedBox(
              width: 12.0,
            ),
            Text(
              "Search",
              style: TextStyle(
                  color: Colors.grey.withOpacity(0.4),
                  fontSize: 23,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
//      child: MaterialButton(
//        onPressed: (){
//          showSearch(
//              context: context, delegate: DataSearch());
//        },
//        color: Color(0xff7676801F),

//      ),
    );
  }
}
