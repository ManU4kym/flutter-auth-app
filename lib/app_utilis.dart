import 'package:flutter/material.dart';

const Color colorWhite = Colors.white;

const Color colorPrimary = Color.fromARGB(255, 141, 83, 62);

const Color colorGrey = Color.fromARGB(255, 242, 243, 247);

const String fontFamily = " fonts/Montserrat-ExtraLight.ttf";

showScaffold(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
