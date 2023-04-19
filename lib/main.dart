import 'dart:io';

import 'package:akshar_ecommerce_app/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

void main() {
  runApp(
      MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splashscreenpage(),
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
}