import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white/provider/doctor.dart';
import 'package:white/provider/doctors.dart';

import 'doctor_item.dart';


class DoctorsGrid extends StatelessWidget {
  final bool showFavs;

  DoctorsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Doctors>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.doctorsInfo;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: products[i],
        child: DoctorItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
