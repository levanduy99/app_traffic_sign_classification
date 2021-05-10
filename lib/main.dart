import 'package:flutter/material.dart';
import './app_screens/home.dart';
import './app_screens/colors.dart';

void main() {
  runApp(new MaterialApp(
    title: "Camera Test",
    theme: appTheme,
    home: LandingScreen(),
  ));
}
