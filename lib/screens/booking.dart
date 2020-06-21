import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:table_calendar/table_calendar.dart';
import 'package:white/provider/PatientData.dart';
import 'package:white/provider/doctors.dart';
import 'package:white/provider/patient_name.dart';
import 'package:white/screens/search_filter.dart';
import 'package:white/screens/user_information.dart';
import 'package:white/widgets/flat_button.dart';
import 'package:white/widgets/rating_bar.dart';

import 'about_us_screen.dart';
import 'complete_booking_screen.dart';
enum pageEnum{about,setting}
class BooKingScreen extends StatefulWidget {
  static const String routeName = "/booking_screen";
  @override
  _BooKingScreenState createState() => _BooKingScreenState();
}

class _BooKingScreenState extends State<BooKingScreen> {
  CalendarController _controller;
  @override
  void initState() {
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    final doctorId = ModalRoute.of(context).settings.arguments as String;
    final loadedDoctor = Provider.of<Doctors>(
      context,
      listen: false,
    ).findById(doctorId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData.fallback(),
        backgroundColor: Color(0xffFFFFFF),
        actions: <Widget>[
          PopupMenuButton(
            color: Colors.white,
            onSelected: (pageEnum value) {
              switch(value){
                case pageEnum.about:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutUs()));
                  break;
                case pageEnum.setting:
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (BuildContext context) => UserInformation()));
                  break;
              }
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('About'),
                value: pageEnum.about,

              ),
              PopupMenuItem(
                child: Text('Setting'),
                value: pageEnum.setting,
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 2.0, left: 15.0),
              child: RowImageAndNameDoc(
                imagePath: loadedDoctor.imagePath,
              )),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.white,
              child: TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.sunday,
                headerStyle: HeaderStyle(
                    leftChevronMargin: EdgeInsets.only(left: 80.0),
                    rightChevronMargin: EdgeInsets.only(right: 80.0),
                    headerMargin: EdgeInsets.only(bottom: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                     // color: Color(0xff1DE9B6),
                    ),
                    centerHeaderTitle: true,
                    formatButtonVisible: false),
                initialCalendarFormat: CalendarFormat.month,
                calendarController: _controller,
                calendarStyle: CalendarStyle(
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                        color: Colors.white)),
                onDaySelected: (date, event) async {
                  setState(() {
                  // Provider.of<PatientData>(context,listen: false).addDate(date.toIso8601String());
                    print(date.toIso8601String());

                  });
//                  final url = "https://clink-cc4da.firebaseio.com/TimtAppointment.json";
//                  await http.post(
//                    url,
//                    body: json.encode({
//                      'day' : date.toIso8601String()
//                      // 'creatorId': userId,
//                    }),
//                  );
//                  print(date.toIso8601String());
                },
                builders: CalendarBuilders(
                    selectedDayBuilder: (context, date, events) {
                  // ignore: missing_return
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.grey),
                      alignment: Alignment.center,
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }, todayDayBuilder: (context, date, events) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xff1DB6E9)),
                      alignment: Alignment.center,
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Time",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 110.0,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: Provider.of<PatientData>(context).appointment.length,
                    itemBuilder: (ctx, i) =>
                    FlatButtonStyle(
                      text: Provider.of<PatientData>(context).appointment[i],
                      color: Color(0xff8E8E93),
                      radius: 50.0,
                      onPress: (){

                      },
                    ),

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    FlatButtonStyle(
//                      text: "6 : 00 PM",
//                      color: Color(0xff8E8E93),
//                      radius: 50.0,
//                    ),
//                    FlatButtonStyle(
//                      text: "6 : 45 PM",
//                      color: Color(0xff8E8E93),
//                      radius: 50.0,
//                    ),
//                    FlatButtonStyle(
//                      text: "7 : 30 PM",
//                      color: Color(0xff8E8E93),
//                      radius: 50.0,
//                    ),
//                  ],
//                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      //   decoration:BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                      width: 180.0,
                      height: 60,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () {

                          Navigator.of(context).pushNamed(BooKingScreenTwo.routeName,arguments: loadedDoctor.id);
                        },
                        color: Color(0xff1DE9B6),
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RowImageAndNameDoc extends StatelessWidget {
  const RowImageAndNameDoc({Key key,this.imagePath,this.name}) : super(key: key);
  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    final doctorId = ModalRoute.of(context).settings.arguments as String;
    final loadedDoctor = Provider.of<Doctors>(
      context,
      listen: false,
    ).findById(doctorId);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    loadedDoctor.imagePath,
                  ),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              )),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              loadedDoctor.name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
            ),
            SizedBox(height: 8.0,),
          //  RatingWidget(),
          ],
        ),
      ],
    );
  }
}
