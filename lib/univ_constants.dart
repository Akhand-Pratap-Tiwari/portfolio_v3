import 'package:flutter/material.dart';

const primaryColor = Colors.tealAccent; //Color(0xFFFFC107);
const secondaryColor = Color(0xFF242430);
const darkColor = Color(0xFF191923);
const bodyTextColor = Color(0xFF8B8B8D);
const bgColor = Color(0xFF1E1E28);

const defaultPadding = 20.0;
const defaultDuration = Duration(seconds: 1); // we use it on our animation
const maxWidth = 1440.0; // max width of our web
const defaultRadius = 16.0;
final defaultBoxShadow = [
  BoxShadow(
    color: Colors.white.withOpacity(0.2),
    spreadRadius: 1,//5
    blurRadius: 30,//15
    offset: Offset(0, 0),
  ),
];
