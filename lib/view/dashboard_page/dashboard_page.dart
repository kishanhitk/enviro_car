import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/main.dart';
import 'package:enviro_car/models/user_model.dart';
import 'package:enviro_car/view/common/widgets/buttons.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final user = userBox.get('user') as User?;
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
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await _logout();
                Navigator.of(context).pushReplacementNamed('/');
              })
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome ${user!.name}"),
              Text("Your email is ${user!.mail}"),
              AuthButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed('/bluetooth');
                },
                label: "Bluetooth Page",
              )
            ],
          ),
        ),
      ),
    );
  }
}
