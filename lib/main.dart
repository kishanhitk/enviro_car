import 'package:enviro_car/models/user_model.dart';
import 'package:enviro_car/view/dashboard_page/dashboard_page.dart';
import 'package:enviro_car/view/home_page/home_page.dart';
import 'package:enviro_car/view/login_page/login_page.dart';
import 'package:enviro_car/view/register_page/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Box userBox;
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(UserAdapter());
  userBox = await Hive.openBox('userBox');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ctx) => LandingPage(),
        '/register': (ctx) => RegisterPage(),
        '/login': (ctx) => LoginPage(),
        '/dashboard': (ctx) => DashboardPage(),
      },
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
