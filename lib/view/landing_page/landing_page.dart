import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/main.dart';
import 'package:enviro_car/utils/media_query.dart';
import 'package:enviro_car/view/common/widgets/buttons.dart';
import 'package:enviro_car/view/dashboard_page/dashboard_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (userBox.get('user') != null) {
      return DashboardPage();
    } else {
      return LandingPageView();
    }
  }
}

class LandingPageView extends StatelessWidget {
  const LandingPageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kThemeBlueColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img_envirocar_logo_white.png',
                width: getScreenWidth(context) * 0.8,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Start Today\nJoin the Community",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              AuthButton(
                label: "Get Started",
                onPressed: () => Navigator.of(context).pushNamed('/login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
