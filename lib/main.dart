import 'package:daily_attendance/screens/info_screen.dart';
import 'package:daily_attendance/screens/signin_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InfoScreen(),

    );
  }
}
