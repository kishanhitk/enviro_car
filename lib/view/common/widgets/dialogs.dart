import 'package:flutter/material.dart';

class RegistrationSuccessDialog extends StatelessWidget {
  const RegistrationSuccessDialog({
    Key? key,
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
