import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white/provider/Comment_Data.dart';
import 'package:white/provider/PatientData.dart';
import 'package:white/provider/auth.dart';
import 'package:white/provider/doctor.dart';
import 'package:white/provider/doctors.dart';
import 'package:white/provider/patient_name.dart';
import 'package:white/provider/saved_item.dart';
import 'package:white/screens/booking.dart';
import 'package:white/screens/complete_booking_screen.dart';
import 'package:white/screens/doctor_information.dart';
import 'package:white/screens/google_maps.dart';
import 'package:white/screens/home_page.dart';
import 'package:white/screens/my_schedual.dart';
import 'package:white/screens/signUpSocialMediaPage.dart';
import 'package:white/screens/splash_screen.dart';

import './screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: SavedDoc(),
        ),
        ChangeNotifierProvider.value(
          value: PatientDetails(),
        ),
        ChangeNotifierProvider.value(
          value: Doctor(),
        ),
        ChangeNotifierProxyProvider<Auth, PatientData>(
          update: (ctx, auth, previousPatients) => PatientData(
            auth.token,
            auth.userId,
            previousPatients == null ? [] : previousPatients.patients,
          ),
        ),
        ChangeNotifierProvider.value(
          value: CommentData(),
        ),
        ChangeNotifierProxyProvider<Auth, Doctors>(
          update: (ctx, auth, previousProducts) => Doctors(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.doctorsInfo,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.lightBlue,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth
              ? DentalHomePage()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshots) =>
                      authResultSnapshots.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : SignUpBySocialMedia(),
                ),
          routes: {
            DoctorInformation.routeName: (ctx) => DoctorInformation(),
            BooKingScreen.routeName: (ctx) => BooKingScreen(),
            BooKingScreenTwo.routeName: (ctx) => BooKingScreenTwo(),
            MySchedule.routeName: (ctx) => MySchedule(),
            AuthScreen.routeName: (ctx) => AuthScreen(),
            GoogleMapScreen.routeName: (ctx) => GoogleMapScreen(),
            // EditProductScreen.routeName: (ctx) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}
