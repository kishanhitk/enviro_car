import 'package:enviro_car/consts/colors.dart';
import 'package:flutter/material.dart';

class MyTrackPage extends StatelessWidget {
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
      body: Center(child: Text("My Tracks")),
    );
  }
}
