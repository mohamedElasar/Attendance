import 'package:attendance/managers/Auth_manager.dart';
import 'package:attendance/managers/Student_manager.dart';
import 'package:attendance/managers/cities_manager.dart';
import 'package:attendance/managers/group_manager.dart';
import 'package:attendance/managers/stage_manager.dart';
import 'package:attendance/managers/subject_manager.dart';
import 'package:attendance/managers/teacher_manager.dart';
import 'package:attendance/screens/Add_academic_year/Academic_year.dart';
import 'package:attendance/screens/Add_teacher/Add_Teacher_Screen.dart';
import 'package:attendance/screens/Student_register/Student_register_screen.dart';

import 'package:attendance/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'managers/App_State_manager.dart';
import 'managers/year_manager.dart';
import 'navigation/app_router.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/Add_subject/Academic_subject.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appStateManager = AppStateManager();
  final _auth_Manager = Auth_manager();
  final _yearManager = YearManager();
  final _stageManager = StageManager();
  final _teachermanager = TeacherManager();
  final _citymanager = CitiesManager();
  final _groupmanager = GroupManager();
  final _studentsmanager = StudentManager();

  AppRouter GetRouter() {
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
        ChangeNotifierProvider(create: (context) => _citymanager),
        ChangeNotifierProxyProvider<Auth_manager, YearManager>(
          create: (ctx) => YearManager(),
          update: (ctx, auth, prevyear) => prevyear!
            ..receiveToken(auth, prevyear == null ? [] : prevyear.years),
        ),
        ChangeNotifierProxyProvider<Auth_manager, StageManager>(
          create: (ctx) => StageManager(),
          update: (ctx, auth, prevstage) => prevstage!
            ..receiveToken(auth, prevstage == null ? [] : prevstage.stages!),
        ),
        ChangeNotifierProxyProvider<Auth_manager, SubjectManager>(
          create: (ctx) => SubjectManager(),
          update: (ctx, auth, prevstage) => prevstage!
            ..receiveToken(auth, prevstage == null ? [] : prevstage.subjects),
        ),
        ChangeNotifierProxyProvider<Auth_manager, TeacherManager>(
          create: (ctx) => TeacherManager(),
          update: (ctx, auth, prevstage) => prevstage!
            ..receiveToken(auth, prevstage == null ? [] : prevstage.teachers),
        ),
        ChangeNotifierProxyProvider<Auth_manager, GroupManager>(
          create: (ctx) => GroupManager(),
          update: (ctx, auth, prevstage) => prevstage!
            ..receiveToken(auth, prevstage == null ? [] : prevstage.groups),
        ),
        ChangeNotifierProxyProvider<Auth_manager, StudentManager>(
          create: (ctx) => StudentManager(),
          update: (ctx, auth, prevstage) => prevstage!
            ..receiveToken(auth, prevstage == null ? [] : prevstage.students),
        ),
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
        ),
      ),
    );
  }
}
