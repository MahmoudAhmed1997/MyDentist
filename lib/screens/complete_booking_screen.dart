
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:white/model/local_notification_helper.dart';
import 'package:white/provider/PatientData.dart';
import 'package:white/provider/doctors.dart';
import 'package:white/provider/patient_name.dart';
import 'package:white/screens/second_page.dart';
import 'package:white/screens/user_information.dart';


import '../constants.dart';
import 'about_us_screen.dart';
import 'booking.dart';
import 'my_schedual.dart';

class BooKingScreenTwo extends StatefulWidget {
  static const String routeName = "/booking_two_screen";
  @override
  _BooKingScreenTwoState createState() => _BooKingScreenTwoState();
}

class _BooKingScreenTwoState extends State<BooKingScreenTwo> {
  String selected = null;
  List<DropdownMenuItem<String>> listDrop = [];

  void loadList() {
    listDrop = [];
    listDrop.add(DropdownMenuItem(
      child: Text("Dental bridge"),
      value: "Dental bridge",
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("Take off the jaw"),
      value: "Take off the jaw",
    ));
    listDrop.add(
      DropdownMenuItem(
        child: Text("Take off Tar"),
        value: "Take off Tar",
      ),
    );
    listDrop.add(
      DropdownMenuItem(
        child: Text("Installing dentures"),
        value: "Installing dentures",
      ),
    );
    listDrop.add(
      DropdownMenuItem(
        child: Text("Fitting composition"),
        value: "Fitting composition",
      ),
    );
    listDrop.add(
      DropdownMenuItem(
        child: Text("Teeth whitening"),
        value: "Teeth whitening",
      ),
    );listDrop.add(
      DropdownMenuItem(
        child: Text("Bonding"),
        value: "Bonding",
      ),
    );listDrop.add(
      DropdownMenuItem(
        child: Text("Braces"),
        value: "Braces",
      ),
    );listDrop.add(
      DropdownMenuItem(
        child: Text("Extractions"),
        value: "Extractions",
      ),
    );listDrop.add(
      DropdownMenuItem(
        child: Text("Fillings and Repairs"),
        value: "Fillings and Repairs",
      ),
    );listDrop.add(
      DropdownMenuItem(
        child: Text("Veneers"),
        value: "Veneers",
      ),
    );
  }


  final _phoneFocusNode = FocusNode();
  final _ageFocusNode = FocusNode();
  final _noteController = TextEditingController();
  final _noteFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  final FirebaseMessaging _fcm = FirebaseMessaging();

  var _editedPatient =
  PatientDetails(
      id: null,
      name: '',
      phone: 0,
      age: 0,
      note: '',
      procedure: '');
  var _initValues = {
    'name': '',
    'phone': '',
    'age': '',
    'notes': '',
    'procedure': null
  };

  var _isLoading = false;
  var _isInit = true;


  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final settingsAndroid = AndroidInitializationSettings('logo_green');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

//
//  @override
//  void didChangeDependencies() {
//    if (_isInit) {
//      final patientId = ModalRoute.of(context).settings.arguments as String;
//      if (patientId != null) {
//        _editedPatient =
//            Provider.of<PatientData>(context, listen: false).findById(patientId);
//        _initValues = {
//          'name': _editedPatient.name,
//          'phone': _editedPatient.phone.toString(),
//          'age': _editedPatient.age.toString(),
//          'notes': '',
//          'procedure': _editedPatient.note
//        };
//       // _imageUrlController.text = _editedProduct.imageUrl;
//      }
//    }
//    _isInit = false;
//    super.didChangeDependencies();
//  }

  Future onSelectNotification(String payload) async =>
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondPage(payload: payload)),
      );

  Future<void> _saveForm(String id) async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
    await Provider.of<PatientData>(context, listen: false)
        .addPatientData(_editedPatient);

   Navigator.of(context).pushNamed(MySchedule.routeName,arguments: id);
    showOngoingNotification(notifications,
        title: 'Request Done', body: 'Wait for confirmation');

    } catch (error) {
      await showDialog(
        context: context,
        builder: (ctx) =>
            AlertDialog(
              title: Text('An error occurred!'),
              content: Text('Something went wrong.'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ),
      );
    }
    // finally {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   Navigator.of(context).pop();
    // }

   setState(() {
     _isLoading = false;
   });
  }

  String getprocedure (String pro){
    return pro;
  }
  String getNote (String note){
    return note;
  }

  @override
  Widget build(BuildContext context) {
    final doctorId = ModalRoute.of(context).settings.arguments as String;
    final loadedDoctor = Provider.of<Doctors>(
      context,
      listen: false,
    ).findById(doctorId);
//    final patientId = ModalRoute.of(context).settings.arguments as String;
//    final loadedPaitent = Provider.of<PatientData>(
//      context,
//      listen: false,
//    ).findById(patientId);
    loadList();
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
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 15.0, right: 2.0, left: 15.0),
            child: RowImageAndNameDoc(imagePath: loadedDoctor.imagePath,),
          ),
//
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Procedure",
                          style: kTextStyleBookingTwo,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffEFEFF4),
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(16)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffEFEFF4)))),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: 30.0,
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Please Choose your procedure';
                              }
                               return null;
                            },

                            hint: Text(
                              "Choose your procedure",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            ),
                            onSaved: (valueProcedure) {
                              _editedPatient = PatientDetails(
                                id: _editedPatient.id,
                                name: _editedPatient.name,
                                phone: _editedPatient.phone,
                                age: _editedPatient.age,
                                note: _editedPatient.note,
                                procedure: valueProcedure,
                              );
//
                            },


                            value: selected,
                            items: listDrop,
                            onChanged: (value) {
                              setState(() {
                                selected = value;
                                getprocedure(value);
                              });
                              Provider.of<PatientData>(context,listen: false).addData(value);

                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Name",
                          style: kTextStyleBookingTwo,
                        ),
                      ),
                      TextFormField(
                        decoration: KTextFieldDecoration,
                        initialValue: _initValues['name'],
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_phoneFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please provide a value.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedPatient = PatientDetails(
                            id: _editedPatient.id,

                            name: value,
                            phone: _editedPatient.phone,
                            age: _editedPatient.age,
                            note: _editedPatient.note,
                            procedure: _editedPatient.procedure,
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Phone",
                          style: kTextStyleBookingTwo,
                        ),
                      ),
                      TextFormField(
                        decoration: KTextFieldDecoration,
                        initialValue: _initValues['phone'],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        focusNode: _phoneFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_ageFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a phone.';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number.';
                          }
                          if (double.parse(value) <= 0) {
                            return 'Please enter a valid number.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedPatient = PatientDetails(
                            id: _editedPatient.id,

                            name: _editedPatient.name,
                            phone: int.parse(value),
                            age: _editedPatient.age,
                            note: _editedPatient.note,
                            procedure: _editedPatient.procedure,
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Age",
                          style: kTextStyleBookingTwo,
                        ),
                      ),
                      TextFormField(
                        decoration: KTextFieldDecoration,
                        initialValue: _initValues['age'],
                        keyboardType: TextInputType.number,
                        focusNode: _noteFocusNode,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a age.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedPatient = PatientDetails(
                            id: _editedPatient.id,

                            name: _editedPatient.name,
                            phone: _editedPatient.phone,
                            age: int.parse(value),
                            note: _editedPatient.note,
                            procedure: _editedPatient.procedure,
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Notes",
                          style: kTextStyleBookingTwo,
                        ),
                      ),
                      TextFormField(
                        decoration: KTextFieldDecoration,
                        initialValue: _initValues['note'],
                        maxLines: 1,
                        keyboardType: TextInputType.multiline,
                        onSaved: (valuem) {

                          _editedPatient = PatientDetails(
                            id: _editedPatient.id,

                            name: _editedPatient.name,
                            phone: _editedPatient.phone,
                            age: _editedPatient.age,
                            note: valuem,
                            procedure: _editedPatient.procedure,

                          );
                        },
                        onChanged: (value){
                          setState(() {

                            getNote(value);

                          });
                          Provider.of<PatientData>(context,listen: false).addNote(value);

                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
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
                      _saveForm(loadedDoctor.id,);





                    },
                    color: Color(0xff1DE9B6),
                    child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//class RowImageAndNameDoctorInBookingTwo extends StatelessWidget {
//  String index;
//  @override
//  Widget build(BuildContext context) {
//    final doctorId = ModalRoute.of(context).settings.arguments as String;
//    final loadedDoctor = Provider.of<Doctors>(
//      context,
//      listen: false,
//    ).findById(doctorId);
//    return Row(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: <Widget>[
//        Container(
//          height: 60,
//          width: 60,
//          decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(15.0),
//              image: DecorationImage(
//                  image: AssetImage(loadedDoctor.imagePath), fit: BoxFit.fill)),
//        ),
//        SizedBox(
//          width: 20.0,
//        ),
//        Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Text(
//              loadedDoctor.name,
//              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23.0),
//            ),
//            RatingWidget(),
//          ],
//        ),
//      ],
//    );
//  }
//}
