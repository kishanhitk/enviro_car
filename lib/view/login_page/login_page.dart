import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/services/auth/auth_services.dart';
import 'package:enviro_car/utils/media_query.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  bool _obsecureText = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: usernameController,
                              decoration: inputDecoration(
                                  'Username', Icons.person_outline),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                } else if (value.length < 6) {
                                  return 'This username is too short';
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextFormField(
                                obscureText: _obsecureText,
                                controller: passwordController,
                                decoration:
                                    inputDecoration('Password', Icons.lock)
                                        .copyWith(
                                  suffixIcon: IconButton(
                                    icon: Icon(_obsecureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _obsecureText = !_obsecureText;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  } else if (value.length < 6) {
                                    return 'This password is too short';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            isLoading
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
                              onPressed: () => Navigator.pushReplacementNamed(
                                  context, '/register'),
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
      isLoading = true;
    });
    try {
      await AuthenticationServices().login(
        usernameController.text,
        passwordController.text,
      );
      Navigator.of(context).pushReplacementNamed('/dashboard');
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
      isLoading = false;
    });
  }

  InputDecoration inputDecoration(String hintText, IconData icon) {
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
        icon,
        color: Colors.white,
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  const AuthButton({
    Key key,
    @required this.onPressed,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 12,
          ),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Color(0xff01456C)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: Text(label),
      onPressed: onPressed,
    );
  }
}
