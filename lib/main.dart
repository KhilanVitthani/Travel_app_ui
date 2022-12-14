import 'package:flutter/material.dart';
import 'package:travel_app/screens/main_screen.dart';
import 'package:travel_app/screens/signup.dart';
import 'package:travel_app/util/const.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      // theme: Constants.lightTheme,
      // darkTheme: Constants.darkTheme,
      home: Signup(),
    );
  }
}
