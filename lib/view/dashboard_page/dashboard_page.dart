import 'package:enviro_car/main.dart';
import 'package:enviro_car/models/user_model.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = userBox.get('user') as User;
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome ${user.name}"),
              Text("Your email is ${user.mail}"),
              ElevatedButton(
                  onPressed: () async {
                    await userBox.clear();
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: Text("Logout"))
            ],
          ),
        ),
      ),
    );
  }
}
