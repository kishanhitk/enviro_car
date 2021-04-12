import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/view/bluetooth_page/bluetooth_page.dart';
import 'package:enviro_car/view/core/base_widget.dart';
import 'package:enviro_car/view/dashboard_page/dashboard_page.dart';
import 'package:enviro_car/view/landing_page/landing_page.dart';
import 'package:enviro_car/view/login_page/login_page.dart';
import 'package:enviro_car/view/register_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      initialRoute: initialRoute,
      routes: routes,
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}

ThemeData themeData = ThemeData(
  primaryColor: kThemeBlueColor,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide.none,
    ),
    isDense: true,
    hintStyle: TextStyle(
      color: Colors.white38,
    ),
    filled: true,
    fillColor: Colors.black12,
    prefixStyle: TextStyle(
      color: Colors.white,
    ),
  ),
  // primaryColor: kThemeBlueColor,
  // canvasColor: kThemeBlueColor,
  textTheme: GoogleFonts.latoTextTheme(),
);

String initialRoute = '/';

Map<String, Widget Function(dynamic)> routes = {
  '/': (ctx) => LandingPage(),
  '/login': (ctx) => LoginPage(),
  '/register': (ctx) => RegisterPage(),
  '/dashboard': (ctx) => DashboardPage(),
  '/bluetooth': (ctx) => BluetoothPage(),
  '/base': (ctx) => BaseWidget()
};
