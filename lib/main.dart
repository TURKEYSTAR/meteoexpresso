import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen()
    );
  }
}
