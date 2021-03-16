import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/services/auth/auth_services.dart';
import 'package:enviro_car/utils/media_query.dart';
import 'package:enviro_car/view/common/widgets/buttons.dart';
import 'package:enviro_car/view/common/widgets/input_fields.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: getScreenHeight(context),
            width: getScreenWidth(context),
            child: Image.asset(
              'assets/mapeffect.png',
              fit: BoxFit.fill,
            ),
          ),
          Scaffold(
            backgroundColor: kThemeBlueColor.withOpacity(0.9),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20),
                      child: Image.asset(
                        'assets/img_envirocar_logo_white.png',
                        width: getScreenWidth(context) * 0.7,
                      ),
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            UsernameInput(
                              usernameController: usernameController,
                            ),
                            PasswordInput(
                              passwordController: passwordController,
                            ),
                            _isLoading
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  )
                                : AuthButton(
                                    label: "Login",
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        await _handleLogin();
                                      }
                                    },
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Don't have an account yet?"),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/register'),
                              child: Text(
                                "Register Here!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _handleLogin() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await AuthenticationServices().login(
        usernameController.text,
        passwordController.text,
      );
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/dashboard', (route) => false);
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }
}

