import 'dart:convert';
import 'dart:io';

import 'package:attendance/managers/Auth_manager.dart';
import 'package:attendance/models/group.dart';
import 'package:attendance/models/subject.dart';
import 'package:attendance/models/teacher.dart';
import 'package:attendance/models/year.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GroupManager extends ChangeNotifier {
  void receiveToken(Auth_manager auth, List<GroupModel> groups) {
    _authToken = auth.token;
    _groups = groups;
  }

  String? _authToken;
  List<GroupModel> _groups = [];
  List<GroupModel> get groups => _groups;
  get hasmore => _hasMore;
  get pageNumber => _pageNumber;
  get error => _error;
  get loading => _loading;

  bool _hasMore = false;
  int _pageNumber = 1;
  bool _error = false;
  bool _loading = true;
  final int _defaultGroupsPerPageCount = 15;

  Future<void> add_group(
    String? name,
    String? year,
    String? subject,
    String? teacher,
    String? day,
    String? time,
  ) async {
    var url = Uri.https('development.mrsaidmostafa.com', '/api/groups');
    try {
      var response = await http.post(
        url,
        body: {
          'name': name,
          'year_id': year,
          'subject_id': subject,
          'teacher_id': teacher,
          'day': day,
          'time': time
        },
        headers: {
          'Accept': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $_authToken'
        },
      );
      final responseData = json.decode(response.body);
      print(responseData);

      // if (response.statusCode == 200) {}
      // add exception

    } catch (error) {
      print('object');
      throw (error);
    }

    notifyListeners();
  }

  Future<void> get_groups() async {
    var url = Uri.https('development.mrsaidmostafa.com', '/api/groups');
    try {
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $_authToken'
        },
      );
      final responseData = json.decode(response.body);

      List<dynamic> stagesList = responseData['data'];
      var list = stagesList.map((data) => GroupModel.fromJson(data)).toList();
      _groups = list;

      // add exception

    } catch (error) {
      print(error);
    }

    notifyListeners();
  }

  Future<void> getMoreData() async {
    try {
      var url = Uri.https('development.mrsaidmostafa.com', '/api/groups',
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
      var fetchedGroups =
          yearsList.map((data) => GroupModel.fromJson(data)).toList();
      _hasMore = fetchedGroups.length == _defaultGroupsPerPageCount;
      _loading = false;
      _pageNumber = _pageNumber + 1;

      _groups.addAll(fetchedGroups);
    } catch (e) {
      _loading = false;
      _error = true;
      notifyListeners();
    }

    notifyListeners();
  }

  void resetlist() {
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
