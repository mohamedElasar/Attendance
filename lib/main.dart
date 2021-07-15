import 'package:attendance/managers/Auth_manager.dart';
import 'package:attendance/screens/Add_group/Add_group_Screen.dart';
import 'package:attendance/screens/Filter_screen.dart/Fliter_Screen_6.dart';
import 'package:attendance/screens/Single_Student.dart/Single_Student_Screen.dart';
import 'package:attendance/screens/degrees/Degrees_Screen.dart';
import 'package:attendance/screens/modify_lessons/modify_lessons_screen.dart';
import 'package:attendance/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'managers/App_State_manager.dart';
import 'navigation/app_router.dart';
import 'screens/Add_teacher/Add_Teacher_Screen.dart';
import 'screens/Admin_Login/Admin_login_screen.dart';

import 'screens/Home/Home_Screen.dart';
import 'screens/Student_register/Student_register_screen.dart';
import 'screens/Students/Students_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/single_student_attendance/Single_Student_atten.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appStateManager = AppStateManager();
  final _auth_Manager = Auth_manager();

  AppRouter GetRouter() {
    // _auth_Manager.tryAutoLogin();
    return AppRouter(
      appStateManager: _appStateManager,
      authmanager: _auth_Manager,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _appStateManager),
        ChangeNotifierProvider(create: (context) => _auth_Manager),
      ],
      child: MaterialApp(
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
          theme: ThemeData(
              // canvasColor: Colors.transparent,
              ),
          home: FutureBuilder(
            future: _auth_Manager.tryAutoLogin(),
            builder: (context, datasnapshot) =>
                datasnapshot.connectionState == ConnectionState.waiting
                    ? Splash_Screen()
                    : Router(
                        routerDelegate: GetRouter(),
                        backButtonDispatcher: RootBackButtonDispatcher(),
                      ),
          )),
    );
  }
}
