import 'package:enviro_car/services/auth/auth_services.dart';
import 'package:enviro_car/utils/media_query.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.shade900,
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: usernameController,
                      decoration: inputDecoration('Username'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        } else if (value.length < 6) {
                          return 'This username is too short';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: inputDecoration('Password'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        } else if (value.length < 6) {
                          return 'This username is too short';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          try {
                            await AuthenticationServices().login(
                              usernameController.text,
                              passwordController.text,
                            );
                            Navigator.of(context).pushNamed('/dashboard');
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      child: Text('Login'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
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
      hintText: hintText,
      prefixIcon: Icon(
        Icons.person,
        color: Colors.white,
      ),
    );
  }
}
