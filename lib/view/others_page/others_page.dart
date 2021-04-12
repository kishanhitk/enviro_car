import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/view/landing_page/landing_page.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class OtherPage extends StatelessWidget {
  static const String routename = '/others';
  Future<void> _logout() async {
    await userBox.clear();
  }

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
            onPressed: null,
          ),
          Divider(
            height: 1,
          ),
          ListTileOther(
            icon: Icons.settings,
            label: "Settings",
            onPressed: null,
          ),
          Divider(
            height: 1,
          ),
          ListTileOther(
            icon: Icons.help_outline,
            label: "Help",
            onPressed: null,
          ),
          Divider(
            height: 1,
          ),
          ListTileOther(
            icon: Icons.bug_report,
            label: "Report Issue",
            onPressed: null,
          ),
          Divider(
            height: 1,
          ),
          ListTileOther(
            icon: Icons.star,
            label: "Rate Us",
            onPressed: null,
          ),
          Divider(
            height: 1,
          ),
          ListTileOther(
            icon: Icons.logout,
            label: "Logout",
            onPressed: () async {
              await _logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LandingPage.routename, (route) => false);
            },
          ),
          Divider(
            height: 1,
          ),
          ListTileOther(
            icon: Icons.power_settings_new_outlined,
            label: "Close enviroCar",
            onPressed: null,
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
  final Function? onPressed;
  final String? label;
  final IconData? icon;
  const ListTileOther({
    Key? key,
    this.label,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Padding(
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
                label!,
                style: TextStyle(
                  fontSize: 20,
                  color: label == "Close enviroCar" ? Colors.red : kLightBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
