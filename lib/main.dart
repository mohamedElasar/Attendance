import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/Admin_Login/Admin_login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'حضور',
      theme: ThemeData(),
      home: Admin_logIn(),
    );
  }
}
