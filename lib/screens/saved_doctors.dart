////import 'package:dentalclinc/provider/doctors.dart';
////import 'package:dentalclinc/widgets/doctor_item.dart';
////import 'package:flutter/material.dart';
////import 'package:provider/provider.dart';
//
//
//import 'package:clincapp/provider/doctor.dart';
//
//import '../provider/saved_item.dart' show SavedDoc;
//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import '../widgets/doc_item.dart';
//
//
//
//class SavedScreen extends StatelessWidget {
//  static const routeName = '/saved';
//
//  @override
//  Widget build(BuildContext context) {
//    final save = Provider.of<SavedDoc>(context);
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Saved Doctors'),
//      ),
//      body: Column(
//        children: <Widget>[
//
//          SizedBox(height: 10),
//          Expanded(
//            child: ListView.builder(
//              itemCount: save.items.length,
//              itemBuilder: (ctx, i) => DoctorItemFavourite(
//
//                save.items.values.toList()[i].id,
//                save.items.keys.toList()[i],
//                save.items.values.toList()[i].name,
//                save.items.values.toList()[i].imagePath,
//                save.items.values.toList()[i].location,
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////
////import '../constants.dart';
////import 'doctor_information.dart';
////
////class SavedDoctors extends StatelessWidget {
////  static String routeName = "/saved_doctors";
////  @override
////  Widget build(BuildContext context) {
////    final doctorId = ModalRoute.of(context).settings.arguments as String;
////    final loadedDoctor = Provider.of<Doctors>(
////      context,
////      listen: false,
////    ).findById(doctorId);
////    final productsData = Provider.of<Doctors>(context);
////    final products = productsData.doctorsInfo;
////    return GridView.builder(
////      padding: const EdgeInsets.all(10.0),
////      itemCount: products.length,
////      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
////        // builder: (c) => products[i],
////        value: products[i],
////        child: Card(
////          shape: RoundedRectangleBorder(
////            borderRadius: BorderRadius.circular(15.0),
////          ),
////          color: Colors.white,
////          elevation: 0.6,
////          child: Column(
////            mainAxisAlignment: MainAxisAlignment.spaceBetween,
////            children: <Widget>[
////              // SizedBox(),
////              Container(
////                height: 159,
////                width: MediaQuery.of(context).size.width,
////                decoration: BoxDecoration(
////                    image: DecorationImage(
////                        image: NetworkImage(
////                          loadedDoctor.imagePath,
////                        ),
////                        fit: BoxFit.fill),
////                    borderRadius: BorderRadius.only(
////                        topRight: Radius.circular(12.0),
////                        topLeft: Radius.circular(12.0))),
//////            child: Image.network(
//////              doctor.imagePath,
//////              fit: BoxFit.fill,
//////              height:120.0,
//////              width:165.0,
////              ),
////
////              Column(
////                crossAxisAlignment: CrossAxisAlignment.center,
////                children: <Widget>[
////                  Row(
////                    mainAxisAlignment: MainAxisAlignment.spaceAround,
////                    children: <Widget>[
////                      Column(
////                        children: <Widget>[
////                          Padding(
////                            padding: const EdgeInsets.only(top: 10.0),
////                            child: Text(
////                              loadedDoctor.name,
////                              style: kTextStyleDocAndButton,
////                            ),
////                          ),
////                          Row(
////                            mainAxisAlignment: MainAxisAlignment.center,
////                            children: <Widget>[
////                              Icon(
////                                Icons.location_on,
////                                size: 13.0,
////                                color: Color(0xff8E8E93),
////                              ),
////                              SizedBox(
////                                width: 4.0,
////                              ),
////                              Text(
////                                loadedDoctor.city,
////                                style: TextStyle(
////                                    color: Color(0xff8E8E93), fontSize: 14.5),
////                                textAlign: TextAlign.center,
////                              ),
////                            ],
////                          ),
////                        ],
////                      ),
////                    ],
////                  ),
////                  Padding(
////                    padding: const EdgeInsets.symmetric(vertical: 10),
////                    child: FlatButton(
////                      onPressed: () {
////                        Navigator.of(context).pushNamed(
////                            DoctorInformation.routeName,
////                            arguments: loadedDoctor.id);
////                      },
////                      child: Text("Book Now",
////                          style: kTextStyleDocAndButton.copyWith(
////                            color: Color(0xff1DE9B6),
////                          )),
////                    ),
////                  ),
////                ],
////              ),
////            ],
////          ),
////        ),
////      ),
////      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
////        crossAxisCount: 2,
////        childAspectRatio: 1.2 / 2,
////        crossAxisSpacing: 10,
////        mainAxisSpacing: 10,
////      ),
////    );
////  }
////}
