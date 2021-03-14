import 'package:enviro_car/blocs/authentication/authentication_bloc.dart';
import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/models/user_model.dart';
import 'package:enviro_car/services/auth/auth_services.dart';
import 'package:enviro_car/view/dashboard_page/dashboard_page.dart';
import 'package:enviro_car/view/landing_page/landing_page.dart';
import 'package:enviro_car/view/login_page/login_page.dart';
import 'package:enviro_car/view/register_page/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/authentication/authentication_event.dart';

Box userBox;
Future _initHive() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(UserAdapter());
  userBox = await Hive.openBox('userBox');
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initHive();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: kThemeBlueColor,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationServices>(
      create: (context) => AuthenticationServices(),
      child: BlocProvider<AuthenticationBloc>(
        create: (context) {
          final authService =
              RepositoryProvider.of<AuthenticationServices>(context);
          return AuthenticationBloc(authService)..add(AppLoaded());
        },
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: kThemeBlueColor,
            canvasColor: kThemeBlueColor,
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (ctx) => LandingPage(),
            '/register': (ctx) => RegisterPage(),
            '/login': (ctx) => LoginPage(),
            '/dashboard': (ctx) => DashboardPage(),
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
