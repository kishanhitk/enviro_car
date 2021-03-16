import 'package:enviro_car/consts/colors.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: MaterialStateProperty.all(kButtonColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: Text(label),
      onPressed: onPressed,
    );
  }
}
