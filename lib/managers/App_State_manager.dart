import 'dart:async';
import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  bool _loggedIn = false;

  // home screen state.. start
  bool _home_options = false;
  bool _student_register = false;
  bool _teacher_register = false;
  bool _group_register = false;
  bool _communicate_students = false;
  bool _data_students = false;
  // home screen state.. end

  bool get isLoggedIn => _loggedIn;
  // home screen state.. start
  bool get homeOptions => _home_options;
  bool get studentRegister => _student_register;
  bool get teacherRegister => _teacher_register;
  bool get groupRegister => _group_register;
  bool get communicateStudents => _communicate_students;
  bool get dataStudents => _data_students;
  // home screen end

  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  void setHomeOptions(bool value) {
    _home_options = value;
    notifyListeners();
  }

  void registerStudent() {
    _student_register = true;
    notifyListeners();
  }

  void registerTeacher() {
    _teacher_register = true;
    notifyListeners();
  }

  void registerGroup() {
    _group_register = true;
    notifyListeners();
  }

  void studentsCommunicate() {
    _communicate_students = true;
    notifyListeners();
  }

  void studentsData() {
    _data_students = true;
    notifyListeners();
  }
}
