import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white/provider/auth.dart';
import 'package:white/provider/doctor.dart';
import 'package:white/provider/doctors.dart';

import '../constants.dart';
double height = 150.0;
double width = 150.0;

class GalleryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctorId = ModalRoute.of(context).settings.arguments as String;
    final loadedDoctor = Provider.of<Doctors>(
        context,
        listen: false
    ).findById(doctorId);

    return Container(
      height: height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GalleryImageDecoration(imagePath:loadedDoctor.imageGalary1),
          ), Padding(
            padding: const EdgeInsets.all(15.0),
            child: GalleryImageDecoration(imagePath:loadedDoctor.imageGalary2),
          ), Padding(
            padding: const EdgeInsets.all(15.0),
            child: GalleryImageDecoration(imagePath:loadedDoctor.imageGalary3),
          ),
        ],
      ),
    );
  }
}

class GalleryImageDecoration extends StatelessWidget {

  final String imagePath ;
  const GalleryImageDecoration({
    Key key,

    this.imagePath
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: kDecorationContainerGallery.copyWith(
            image: DecorationImage(
                image: NetworkImage(
                 imagePath,
                ),
                fit: BoxFit.fill)));
  }
}
