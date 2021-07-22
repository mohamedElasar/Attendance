import 'dart:convert';
import 'dart:io';
import 'package:attendance/helper/httpexception.dart';

import 'package:attendance/managers/Auth_manager.dart';
import 'package:attendance/models/subject.dart';
import 'package:attendance/models/teacher.dart';
import 'package:attendance/models/year.dart';
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
        throw HttpException(errors.join(' , '));
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
}
