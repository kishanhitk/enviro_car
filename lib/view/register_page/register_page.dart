import 'package:enviro_car/services/auth/auth_services.dart';
import 'package:enviro_car/utils/media_query.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              "Sign Up",
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
                      controller: emailController,
                      decoration: inputDecoration('E-Mail'),
                      style: TextStyle(color: Colors.white),
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
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: confirmPasswordController,
                      decoration: inputDecoration('Confirm Password'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        } else if (value != passwordController.text) {
                          return 'Both passwords are not same';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          try {
                            await AuthenticationServices().register(
                              usernameController.text,
                              passwordController.text,
                              emailController.text,
                            );
                            await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text(
                                      "You are just one step away...."),
                                  content: new Text(
                                    "You are just one step away from activating your account on enviroCar. Please check your mails in order to complete the registration",
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"))
                                  ],
                                );
                              },
                            );
                            Navigator.of(context).pushNamed('/');
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      child: Text('Submit'),
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
