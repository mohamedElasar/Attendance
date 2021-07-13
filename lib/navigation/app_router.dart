import 'package:attendance/managers/App_State_manager.dart';
import 'package:attendance/screens/Add_group/Add_group_Screen.dart';
import 'package:attendance/screens/Add_teacher/Add_Teacher_Screen.dart';
import 'package:attendance/screens/Admin_Login/Admin_login_screen.dart';
import 'package:attendance/screens/Filter_screen.dart/Fliter_Screen_6.dart';
import 'package:attendance/screens/Home/Home_Screen.dart';
import 'package:attendance/screens/Student_register/Student_register_screen.dart';
import 'package:attendance/screens/Students/Students_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;

  AppRouter({
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isLoggedIn) Admin_logIn.page(),
        if (appStateManager.isLoggedIn) Home_Screen.page(),
        if (appStateManager.isLoggedIn && appStateManager.studentRegister)
          Student_Register_Screen.page(),
        if (appStateManager.isLoggedIn && appStateManager.teacherRegister)
          Add_Teacher_Screeen.page(),
        if (appStateManager.isLoggedIn && appStateManager.groupRegister)
          Add_group_screen.page(),
        if (appStateManager.isLoggedIn && appStateManager.communicateStudents)
          Students_Screen.page(),
        if (appStateManager.isLoggedIn && appStateManager.dataStudents)
          Filter_Screen_6.page(),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    // 3
    if (!route.didPop(result)) {
      // 4
      return false;
    }

    // 5
    // if (route.settings.name == FooderlichPages.onboardingPath) {
    //   appStateManager.logout();
    // }

    return true;
  }

  // 9
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
