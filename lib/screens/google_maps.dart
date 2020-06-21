import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:white/provider/doctors.dart';

class GoogleMapScreen extends StatefulWidget {
  static String routeName ='/google_maps';
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController mapController;

  final LatLng _center = LatLng(31.534670, 34.474606);

  void _onMapCreated(GoogleMapController controller) async{
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {

    final doctorId = ModalRoute.of(context).settings.arguments as String;
    final loadedDoctor = Provider.of<Doctors>(
        context,
        listen: false
    ).findById(doctorId);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
              child: GoogleMap(
          onMapCreated:  _onMapCreated,

          initialCameraPosition: CameraPosition(
              target: LatLng(loadedDoctor.latitude,loadedDoctor.longitude),

              zoom: 18.0,
          ),
        ),
            )));
  }
}
