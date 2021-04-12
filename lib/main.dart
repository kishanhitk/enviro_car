import 'package:enviro_car/app.dart';
import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

late Box userBox;
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
  runApp(
    MyApp(),
  );
}
