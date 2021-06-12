import 'package:autolibdz/views/HomeScreen.dart';
import 'package:autolibdz/views/PlanMaintenance.dart';
import 'package:autolibdz/views/listeCars.dart';
import 'package:autolibdz/views/panne.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  int _bottomNavigationIndex = 0;
  BottomNavigationBarComponent(this._bottomNavigationIndex);

  @override
  _BottomNavigationBarComponentState createState() =>
      _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff252834),
      currentIndex: widget._bottomNavigationIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      iconSize: 25,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Acceuil",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.time_to_leave_rounded,
          ),
          label: "Véhicules",
        ),
        BottomNavigationBarItem(
          label: "Pannes",
          icon: Icon(
            Icons.build,
          ),
        ),
        BottomNavigationBarItem(
          label: "Plan",
          icon: Icon(
            Icons.calendar_today_outlined,
          ),
        )
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }
            break;
          case 1:
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListeCars()),
              );
            }
            break;
          case 2:
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Panne()),
              );
            }
            break;
          case 3:
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlanMaintenance()),
              );
            }
            break;
        }
      },
    );
  }
}
