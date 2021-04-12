import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController? passwordController;

  const PasswordInput({Key? key, this.passwordController}) : super(key: key);
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        obscureText: _obsecureText,
        controller: widget.passwordController,
        decoration: InputDecoration(
          hintText: "Password",
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            icon: Icon(_obsecureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _obsecureText = !_obsecureText;
              });
            },
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text';
          } else if (value.length < 6) {
            return 'This password is too short';
          }
          return null;
        },
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class UsernameInput extends StatelessWidget {
  final TextEditingController? usernameController;

  const UsernameInput({Key? key, this.usernameController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: usernameController,
      decoration: InputDecoration(
        hintText: "Username",
        prefixIcon: Icon(
          Icons.person_outline,
          color: Colors.white,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        } else if (value.length < 6) {
          return 'This username is too short';
        }
        return null;
      },
    );
  }
}

class ConfirmCreatedPasswordInput extends StatefulWidget {
  const ConfirmCreatedPasswordInput({
    Key? key,
    required this.confirmPasswordController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;

  @override
  _ConfirmCreatedPasswordInputState createState() =>
      _ConfirmCreatedPasswordInputState();
}

class _ConfirmCreatedPasswordInputState
    extends State<ConfirmCreatedPasswordInput> {
  bool _hiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _hiddenPassword,
      decoration: InputDecoration(
        hintText: "Confirm Password",
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.white,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _hiddenPassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _hiddenPassword = !_hiddenPassword;
            });
          },
        ),
      ),
      style: TextStyle(color: Colors.white),
      controller: widget.confirmPasswordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        } else if (value != widget.passwordController.text) {
          return 'Both passwords are not same';
        }
        return null;
      },
    );
  }
}

class CreatePasswordInput extends StatefulWidget {
  final TextEditingController? passwordController;
  const CreatePasswordInput({
    Key? key,
    this.passwordController,
  }) : super(key: key);

  @override
  _CreatePasswordInputState createState() => _CreatePasswordInputState();
}

class _CreatePasswordInputState extends State<CreatePasswordInput> {
  bool _hiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      decoration: InputDecoration(
        errorMaxLines: 2,
        hintText: "Password",
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.white,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _hiddenPassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _hiddenPassword = !_hiddenPassword;
            });
          },
        ),
      ),
      validator: (value) {
        RegExp _passwordRegex =
            RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
        if (value!.isEmpty) {
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
    );
  }
}

class EmailInput extends StatelessWidget {
  final TextEditingController? emailcontroller;
  const EmailInput({
    Key? key,
    this.emailcontroller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailcontroller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          color: Colors.white,
        ),
        hintText: "E-mail",
      ),
      style: TextStyle(color: Colors.white),
      validator: (value) {
        RegExp regExp = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
        if (value!.isEmpty) {
          return 'Please enter some text';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}
