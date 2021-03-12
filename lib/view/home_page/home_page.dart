import 'package:enviro_car/main.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (userBox.get('user') != null) {
      Navigator.of(context).pushReplacementNamed('/dashboard');
      return Container();
    } else
      return Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
                child: Text("Register")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: Text("Login")),
          ],
        ),
      ));
  }
}
