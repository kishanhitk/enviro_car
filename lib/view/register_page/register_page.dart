import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/services/auth/auth_services.dart';
import 'package:enviro_car/utils/media_query.dart';
import 'package:enviro_car/view/login_page/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  bool _hiddenPassword = true;
  bool _hiddenConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: usernameController,
                              decoration: inputDecoration(
                                  'Username', Icons.person_outline),
                              validator: (value) {
                                RegExp usernameRegExp =
                                    RegExp(r'^[_A-Za-z0-9-]{4,}$');

                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                } else if (value.length < 4) {
                                  return 'This username is too short';
                                } else if (!usernameRegExp.hasMatch(value)) {
                                  return 'Username should only contain alphanumeric values';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration:
                                  inputDecoration('E-Mail', Icons.email),
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                RegExp regExp = RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                } else if (!regExp.hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration:
                                  inputDecoration('Password', Icons.lock)
                                      .copyWith(
                                errorMaxLines: 2,
                                suffixIcon: IconButton(
                                  icon: Icon(_hiddenPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _hiddenPassword = !_hiddenPassword;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                RegExp _passwordRegex = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                } else if (value.length < 6) {
                                  return 'Password should containe atleast 6 characters.';
                                } else if (!_passwordRegex.hasMatch(value)) {
                                  return 'Password should contain at least one uppercase, one lowercase and one numeric value.';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              obscureText: _hiddenPassword,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: _hiddenConfirmPassword,
                              style: TextStyle(color: Colors.white),
                              controller: confirmPasswordController,
                              decoration: inputDecoration(
                                      'Confirm Password', Icons.lock)
                                  .copyWith(
                                suffixIcon: IconButton(
                                  icon: Icon(_hiddenConfirmPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _hiddenConfirmPassword =
                                          !_hiddenConfirmPassword;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                } else if (value != passwordController.text) {
                                  return 'Both passwords are not same';
                                }
                                return null;
                              },
                            ),
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
                                      if (_formKey.currentState.validate()) {
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
                                  context, '/login'),
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
      Navigator.of(context).pushNamed('/');
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

  InputDecoration inputDecoration(String hintText, IconData prefixIcon) {
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
        prefixIcon,
        color: Colors.white,
      ),
    );
  }
}

class RegistrationSuccessDialog extends StatelessWidget {
  const RegistrationSuccessDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text("You are just one step away...."),
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
  }
}
