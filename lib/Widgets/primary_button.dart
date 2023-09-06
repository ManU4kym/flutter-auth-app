import 'package:finance_app/app_utilis.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class primaryButton extends StatelessWidget {
  const primaryButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(30),
          ),
          constraints: const BoxConstraints(maxHeight: 60),
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 16.0, fontFamily: fontFamily),
          ),
        ),
      ),
    );
  }
}
