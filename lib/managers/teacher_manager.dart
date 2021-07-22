import 'dart:convert';
import 'dart:io';
import 'package:attendance/helper/httpexception.dart';

import 'package:attendance/managers/Auth_manager.dart';
import 'package:attendance/models/teacher.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TeacherManager extends ChangeNotifier {
  void receiveToken(Auth_manager auth, List<TeacherModel> teachers) {
    _authToken = auth.token;
    _teachers = teachers;
  }

  String? _authToken;
  List<TeacherModel> _teachers = [];
  List<TeacherModel> get teachers => _teachers;
  get hasmore => _hasMore;
  get pageNumber => _pageNumber;
  get error => _error;
  get loading => _loading;

  bool _hasMore = false;
  int _pageNumber = 1;
  bool _error = false;
  bool _loading = true;

  final int _defaultPerPageCount = 15;

  Future<void> add_teacher(
    String? name,
    String? phone,
    String? email,
    String? phone2,
    String? password,
    String? passwordConfirmation,
    String? assistantPhone,
    String? assistantPhone2,
    String? school,
    String? experience,
    String? note,
    String? subject,
    String? years,
    String? cityId,
  ) async {
    var url = Uri.https('development.mrsaidmostafa.com', '/api/teachers');
    try {
      var response = await http.post(
        url,
        body: {
          'name': name,
          'phone': phone,
          'email': email,
          'phone2': phone2,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'assistant_phone': assistantPhone,
          'assistant_phone2': assistantPhone2,
          'school': school,
          'experience': experience,
          'note': note,
          'subject_id': subject,
          'years[]': years,
          'city_id': cityId,
        },
        headers: {
          'Accept': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $_authToken'
        },
      );
      final responseData = json.decode(response.body);
      print(responseData['errors']);

      if (responseData['errors'] != null) {
        List<String> errors = [];
        for (var value in responseData['errors'].values) errors.add(value[0]);
        throw HttpException(errors.join('  '));
      }
    } catch (error) {
      throw (error);
    }

    notifyListeners();
  }

  Future<void> get_teachers() async {
    var url = Uri.https('development.mrsaidmostafa.com', '/api/teachers');
    try {
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $_authToken'
        },
      );
      final responseData = json.decode(response.body);

      List<dynamic> yearsList = responseData['data'];
      var list = yearsList.map((data) => TeacherModel.fromJson(data)).toList();
      _teachers = list;
      print(responseData);
      // add exception

    } catch (error) {
      print('teacherall');
      print(error);
    }

    notifyListeners();
  }

  Future<void> getMoreData() async {
    try {
      var url = Uri.https('development.mrsaidmostafa.com', '/api/teachers',
          {"page": _pageNumber.toString()});
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $_authToken'
        },
      );

      final responseData = json.decode(response.body);

      List<dynamic> yearsList = responseData['data'];
      var fetched =
          yearsList.map((data) => TeacherModel.fromJson(data)).toList();
      _hasMore = fetched.length == _defaultPerPageCount;
      _loading = false;
      _pageNumber = _pageNumber + 1;

      _teachers.addAll(fetched);
    } catch (e) {
      _loading = false;
      _error = true;
      notifyListeners();
    }

    notifyListeners();
  }

  void resetlist() {
    _teachers = [];
    _loading = true;
    _pageNumber = 1;
    _error = false;
    _loading = true;
  }

  void setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void seterror(bool value) {
    _error = value;
    notifyListeners();
  }
}
