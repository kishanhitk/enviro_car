import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/main.dart';
import 'package:enviro_car/models/user_model.dart';
import 'package:enviro_car/view/bluetooth_page/bluetooth_page.dart';
import 'package:enviro_car/view/common/widgets/buttons.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  static const String routename = '/dashboard';

  final user = userBox.get('user') as User?;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                color: kThemeBlueColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 30,
                        child: Image.asset(
                          'assets/img_envirocar_logo_white.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Icon(
                          Icons.person,
                          color: kButtonColor,
                          size: 80,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: kButtonColor),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        user?.name ?? "User",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              AuthButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed(BluetoothPage.routename);
                },
                label: "Bluetooth Page",
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
