
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white/screens/empty_screen.dart';
import 'package:white/screens/home_page.dart';
import 'package:white/screens/my_schedual.dart';
import 'package:white/screens/notification.dart';
import 'package:white/screens/user_information.dart';

class BottomAppBarItems extends StatefulWidget {
  final index;
  final String id;

   BottomAppBarItems({this.index,this.id}) ;

  @override
  _BottomAppBarItemsState createState() => _BottomAppBarItemsState();
}

class _BottomAppBarItemsState extends State<BottomAppBarItems> {
  @override
  Widget build(BuildContext context) {
//    final doctorId = ModalRoute.of(context).settings.arguments as String;
//    final loadedDoctor = Provider.of<Doctors>(
//      context,
//      listen: false,
//    ).findById(doctorId);
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                color: widget.index == 0 ? Colors.greenAccent : Colors.grey,
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalHomePage()));
                  });
                },
                icon: Icon(
                  Icons.home,
                  size: 30.0,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.date_range,
                    size: 30.0,
                  ),
                  color: widget.index == 1 ? Colors.greenAccent : Colors.grey,
                  onPressed: () => widget.id == null
                      ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          EmptyScreen()))
                      : Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MySchedule(
                        index: widget.index,
                      )))),
              IconButton(
                  icon: Icon(
                    Icons.notifications,
                    size: 30.0,
                  ),
                  color: widget.index == 2 ? Colors.greenAccent : Colors.grey,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NotificationPage()))),
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    size: 30.0,
                  ),
                  color: widget.index == 3 ? Colors.greenAccent : Colors.grey,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserInformation()))),
            ]),
      ),
    );
  }
}
