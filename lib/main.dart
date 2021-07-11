import 'package:attendance/screens/Add_group/Add_group_Screen.dart';
import 'package:attendance/screens/Filter_screen.dart/Filte_Screen_2.dart';
import 'package:attendance/screens/Filter_screen.dart/Filter_Screen.dart';
import 'package:attendance/screens/Filter_screen.dart/Filter_Screen_5.dart';
import 'package:attendance/screens/Filter_screen.dart/Fliter_Screen_6.dart';
import 'package:attendance/screens/Filter_screen.dart/Fliter_Screen_7.dart';
import 'package:attendance/screens/Single_Student.dart/Single_Student_Screen.dart';
import 'package:attendance/screens/degrees/Degrees_Screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/Add_teacher/Add_Teacher_Screen.dart';
import 'screens/Admin_Login/Admin_login_screen.dart';
import 'screens/Filter_screen.dart/Filter_Screen_4.dart';
import 'screens/Filter_screen.dart/Filter_screen_3.dart';
import 'screens/Home/Home_Screen.dart';
import 'screens/Student_register/Student_register_screen.dart';
import 'screens/Students/Students_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AE"),
      ],
      locale: Locale("ar", "AE"),
      debugShowCheckedModeBanner: false,
      title: 'حضور',
      theme: ThemeData(),
      home: Filter_Screen_6(),
    );
  }
}
