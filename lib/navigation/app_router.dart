import 'package:attendance/managers/App_State_manager.dart';
import 'package:attendance/managers/Auth_manager.dart';
import 'package:attendance/screens/Add_academic_year/Academic_year.dart';
import 'package:attendance/screens/Add_group/Add_group_Screen.dart';
import 'package:attendance/screens/Add_subject/Academic_subject.dart';
import 'package:attendance/screens/Add_teacher/Add_Teacher_Screen.dart';
import 'package:attendance/screens/Admin_Login/Admin_login_screen.dart';
import 'package:attendance/screens/Filter_screen.dart/Fliter_Screen_6.dart';
import 'package:attendance/screens/Home/Home_Screen.dart';
import 'package:attendance/screens/Single_Student.dart/Single_Student_Screen.dart';
import 'package:attendance/screens/Student_register/Student_register_screen.dart';
import 'package:attendance/screens/Students/Students_screen.dart';
import 'package:attendance/screens/modify_lessons/modify_lessons_screen.dart';
import 'package:attendance/screens/single_student_attendance/Single_Student_atten.dart';
import 'package:flutter/material.dart';
import 'screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final Auth_manager authmanager;

  AppRouter({
    required this.appStateManager,
    required this.authmanager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    authmanager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    authmanager.removeListener(notifyListeners);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!authmanager.isLoggedIn) Admin_logIn.page(),
        if (authmanager.isLoggedIn) Home_Screen.page(),
        if (authmanager.isLoggedIn && appStateManager.studentRegister)
          Student_Register_Screen.page(),
        if (authmanager.isLoggedIn && appStateManager.teacherRegister)
          Add_Teacher_Screeen.page(),
        if (authmanager.isLoggedIn && appStateManager.groupRegister)
          Add_group_screen.page(),
        if (authmanager.isLoggedIn && appStateManager.communicateStudents)
          Students_Screen.page(),
        if (authmanager.isLoggedIn && appStateManager.dataStudents)
          Filter_Screen_6.page(),
        if (authmanager.isLoggedIn && appStateManager.lessonModify)
          Modify_Lessons_screen.page(),
        if (authmanager.isLoggedIn && appStateManager.subjectsModify)
          Add_academic_subject.page(),
        if (authmanager.isLoggedIn && appStateManager.yearsAdd)
          Add_academic_year.page(),
        if (authmanager.isLoggedIn &&
            appStateManager.communicateStudents &&
            appStateManager.singleStudent)
          Single_Student_Screen.page(),
        if (authmanager.isLoggedIn &&
            appStateManager.singleStudent &&
            appStateManager.singleStudentAttend)
          Single_Student_attend.page(),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == Attendance_Screens.lesson_modify ||
        route.settings.name == Attendance_Screens.communicate_students ||
        route.settings.name == Attendance_Screens.data_students ||
        route.settings.name == Attendance_Screens.group_registerpath ||
        route.settings.name == Attendance_Screens.student_registerpath ||
        route.settings.name == Attendance_Screens.subjects_add ||
        route.settings.name == Attendance_Screens.years_add ||
        route.settings.name == Attendance_Screens.teacher_registerpath) {
      appStateManager.go_to_Home();
    }
    if (route.settings.name == Attendance_Screens.single_student) {
      appStateManager.goToSingleStudent(false);
    }
    if (route.settings.name == Attendance_Screens.single_student_attend) {
      appStateManager.goToSingleStudentAttend(false);
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
