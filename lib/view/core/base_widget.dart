import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/view/dashboard_page/dashboard_page.dart';
import 'package:enviro_car/view/my_tracks_page/my_tracks_page.dart';
import 'package:enviro_car/view/others_page/others_page.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatefulWidget {
  static const String routeName = '/base';

  @override
  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: IndexedStack(
            index: _selectedIndex,
            children: <Widget>[
              DashboardPage(),
              MyTrackPage(),
              OtherPage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.speed),
              label: "Dashboard",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.add_road),
              label: "My Tracks",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: "Others",
            ),
          ],
          unselectedItemColor: kGrey,
          currentIndex: _selectedIndex,
          selectedItemColor: kThemeBlueColor,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
