
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white/provider/PatientData.dart';
import 'package:white/provider/doctors.dart';
import 'package:white/provider/patient_name.dart';
import 'package:white/screens/user_information.dart';
import 'package:white/widgets/bottomAppBarItems.dart';

import '../constants.dart';
import 'booking.dart';
import 'complete_booking_screen.dart';
import 'home_page.dart';

class MySchedule extends StatefulWidget {
  final String id;
  final String index;
  final int colorBottomIcon;
  static const String routeName = "/my_schedule";

  MySchedule({Key key, this.index, this.colorBottomIcon,
  this.id}) : super(key: key);

  @override
  _MyScheduleState createState() => _MyScheduleState();
}

class _MyScheduleState extends State<MySchedule> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    Provider.of<Doctors>(context,listen: false).fetchAndSetDoctors(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Doctors>(context).fetchAndSetDoctors().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
   // final scaffold =Scaffold.of(context);

    final paitent = Provider.of<PatientDetails>(context, listen: false);

    final doctorId = ModalRoute.of(context).settings.arguments as String;
    final loadedDoctor = Provider.of<Doctors>(
      context,
      listen: false,
    ).findById(doctorId);
//
//    final patientId = ModalRoute.of(context).settings.arguments as String;
//    final loadedPatients = Provider.of<PatientData>(
//      context,
//      listen: false,
//    ).findById(patientId);
    String procedure =
    Provider.of<PatientData>(context).patients[index1].procedure;
    String note = Provider.of<PatientData>(context).patients[index1].note;
    //String date = Provider.of<PatientData>(context).patients[index1].day.toIso8601String();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFFFF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Text(
              "Upcoming Appointments",
              style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2.0),
            ),
            Icon(
              Icons.filter_list,
              color: Color(0xff8E8E93),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarItems(
        index: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[

            Row(
              children: <Widget>[
                Text(
                  "Today\'s appointment",
                  style: kTextStyleHeadline,
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  color: Color(0xffFFFFFF)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15.0, right: 1.0, left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RowImageAndNameDoc(
                          imagePath: loadedDoctor.imagePath,
                          name: loadedDoctor.name,

                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) => BooKingScreenTwo(),
//                              ),
//                            );
                          },
                          child: Text("Edit",
                              style: kTextStyleDocAndButton.copyWith(
                                color: Color(0xff1DE9B6),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Color(0xff8E8E93),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          loadedDoctor.locationDetail,
                          style: kTextStyleMyScheduleWords,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Start Time: ",
                              style: kTextStyleMyScheduleWords,
                            ),
                            Text(
                              "06:00 PM ",
                              style: kTextStyleMyScheduleWords.copyWith(
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "End Time: ",
                              style: kTextStyleMyScheduleWords,
                            ),
                            Text(
                              "07:00 PM ",
                              style: kTextStyleMyScheduleWords.copyWith(
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),  Row(
                          children: <Widget>[
                            Text(
                              "date: ",
                              style: kTextStyleMyScheduleWords,
                            ),
                            Text(
                                "11/6/2020",
                              style: kTextStyleMyScheduleWords.copyWith(
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Duration: ",
                              style: kTextStyleMyScheduleWords,
                            ),
                            Text(
                              "00:60 min",
                              style: kTextStyleMyScheduleWords.copyWith(
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Status: ",
                              style: kTextStyleMyScheduleWords,
                            ),
                            Text(
                              "Under review",
                              style: kTextStyleMyScheduleWords.copyWith(
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Procedure: ",
                              style: kTextStyleMyScheduleWords,
                            ),
                            Text(
                              procedure,
                              style: kTextStyleMyScheduleWords.copyWith(
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Notes: ",
                              style: kTextStyleMyScheduleWords,
                            ),
                            Expanded(
                              child: Text(
                                note,
                                textAlign: TextAlign.left,
                                style: kTextStyleMyScheduleWords.copyWith(
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.0,),
                        Center(
                          child: FlatButton(
                            child: Text(
                              "Cancel the appointment",
                              style: TextStyle(color: Colors.red,fontSize: 14.0),
                            ),
                                onPressed: () async {
                              try{
                               await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DentalHomePage()));

                                await  Provider.of<PatientData>(context).deletePatient("inmU3j2HGgO2M3hqYpgVpj0Kkgb2");

                                    }catch(error){
                                   //   scaffold.showSnackBar(SnackBar(content: Text('Deleting Failed',textAlign: TextAlign.center,)));

                                    }


                              },

                          ),
                        ),
                        SizedBox(height: 25.0,),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//class RowImageNameDocSchedule extends StatelessWidget {
//  final index;
//
//  const RowImageNameDocSchedule({Key key, this.index}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    final doctorId = ModalRoute.of(context).settings.arguments as String;
//    final loadedDoctor = Provider.of<Doctors>(
//      context,
//      listen: false,
//    ).findById(doctorId);
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: <Widget>[
//        Row(
//          children: <Widget>[
//            Container(
//              height: 80,
//              width: 80,
//              decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(15.0),
//                  image: DecorationImage(
//                      image: AssetImage(loadedDoctor.imagePath),
//                      fit: BoxFit.fill)),
//            ),
//            SizedBox(
//              width: 5.0,
//            ),
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text(
//                  loadedDoctor.name,
//                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23.0),
//                ),
//                RatingWidget(),
//              ],
//            ),
//          ],
//        ),
//        FlatButton(
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (context) => UserInformation(),
//              ),
//            );
//          },
//          child: Text("Edit",
//              style: kTextStyleDocAndButton.copyWith(
//                color: Color(0xff1DE9B6),
//              )),
//       ),
//      ],
//    );
//  }
//}
