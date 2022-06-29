import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/apiServis/postmodel.dart';
import 'package:flutter_application_1/cars/fordFocus.dart';
import 'package:flutter_application_1/history.dart';
import 'package:flutter_application_1/mainscreen.dart';
import 'package:flutter_application_1/settings.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      backgroundColor:Colors.deepPurple.shade500,
      selectedItemColor:Colors.white,
      unselectedItemColor: Colors.deepPurple.shade50,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      onTap: (value) {
        setState(() => _currentIndex = value);
        value == 0
            ? Navigator.push(
              context, MaterialPageRoute(builder: (context) =>mainScreen()))
            : value == 1
                ? Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HistoryScreen()))
                : Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
      },
      items: const [
        BottomNavigationBarItem(
          label: "Anasayfa",
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: "Geçmiş",
          icon: Icon(Icons.access_time_sharp),
        ),
        BottomNavigationBarItem(
          label: "Ayarlar",
          icon: Icon(Icons.settings),
        ),
        
      ],
    );
  }
}