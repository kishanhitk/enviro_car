import 'package:enviro_car/consts/colors.dart';
import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kThemeBlueColor,
        title: SizedBox(
          height: 30,
          child: Image.asset(
            'assets/img_envirocar_logo_white.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Column(
        children: [
          ListTileOther(
            label: "Log Book",
            icon: Icons.book,
          ),
          Divider(
            height: 1,
          ),
          ListTileOther(
            icon: Icons.settings,
            label: "Settings",
          ),
          Divider(
            height: 1,
          ),
          ListTileOther(
            icon: Icons.help_outline,
            label: "Help",
          ),
          Divider(
            height: 1,
          ),
          ListTileOther(
            icon: Icons.bug_report,
            label: "Report Issue",
          ),
          Divider(
            height: 1,
          ),
          ListTileOther(
            icon: Icons.star,
            label: "Rate Us",
          ),
          Divider(
            height: 1,
          ),
          ListTileOther(
            icon: Icons.logout,
            label: "Logout",
          ),
          Divider(
            height: 1,
          ),
          ListTileOther(
            icon: Icons.power_settings_new_outlined,
            label: "Close enviroCar",
          ),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}

class ListTileOther extends StatelessWidget {
  final String label;
  final IconData icon;
  const ListTileOther({
    Key key,
    this.label,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: label == "Close enviroCar" ? Colors.red : Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20,
                color: label == "Close enviroCar" ? Colors.red : kLightBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
