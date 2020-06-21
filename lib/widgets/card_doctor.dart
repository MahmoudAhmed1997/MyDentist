
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white/provider/doctor.dart';
import 'package:white/screens/doctor_information.dart';

import '../constants.dart';

class CardDoctor extends StatelessWidget {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<Doctor>(context, listen: false);
    double height = 159.0;
    double width = 170.0;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      elevation: 0.6,
      child: Column(
        children: <Widget>[
          Container(
              height: height,
              width: double.maxFinite,
              decoration: kDecorationContainer.copyWith(
                  image: DecorationImage(
                      image: AssetImage(doctor.imagePath),
                      fit: BoxFit.cover))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  doctor.name,
                  style: kTextStyleDocAndButton,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 13.0,
                    color: Color(0xff8E8E93),
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    doctor.city,
                    style:
                        TextStyle(color: Color(0xff8E8E93), fontSize: 14.5),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        DoctorInformation.routeName,
                        arguments: doctor.id);
                  },
                  child: Text("Book Now",
                      style: kTextStyleDocAndButton.copyWith(
                        color: Color(0xff1DE9B6),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
