import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/services/auth/auth_services.dart';
import 'package:enviro_car/utils/media_query.dart';
import 'package:enviro_car/view/common/widgets/buttons.dart';
import 'package:enviro_car/view/common/widgets/dialogs.dart';
import 'package:enviro_car/view/common/widgets/input_fields.dart';
import 'package:enviro_car/view/landing_page/landing_page.dart';
import 'package:enviro_car/view/login_page/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: getScreenHeight(context),
          width: getScreenWidth(context),
          child: Image.asset(
            'assets/mapeffect.png',
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: kThemeBlueColor.withOpacity(0.9),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
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
                      "Sign Up",
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
                            SizedBox(
                              height: 10,
                            ),
                            EmailInput(
                              emailcontroller: emailController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CreatePasswordInput(
                              passwordController: passwordController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ConfirmCreatedPasswordInput(
                                confirmPasswordController:
                                    confirmPasswordController,
                                passwordController: passwordController),
                            SizedBox(
                              height: 10,
                            ),
                            _isLoading
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  )
                                : AuthButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        _handleRegisterButton();
                                      }
                                    },
                                    label: 'Register',
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Already have an account"),
                            TextButton(
                              onPressed: () => Navigator.pushReplacementNamed(
                                context,
                                LoginPage.routename,
                              ),
                              child: Text(
                                "Sign in Here!",
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
        ),
      ],
    );
  }

  Future _handleRegisterButton() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await AuthenticationServices().register(
        usernameController.text,
        passwordController.text,
        emailController.text,
      );
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return RegistrationSuccessDialog();
        },
      );
      Navigator.of(context).pushNamed(
        LandingPage.routename,
      );
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
