import 'dart:async';
import 'package:attendance/helper/httpexception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Auth_manager extends ChangeNotifier {
  String? token;
  int? _userId;
  String? _userEmail;
  String? _userPhone;
  late String _name;

  bool get isLoggedIn => token != null;
  String get name => _name;

  Future<void> login(String email, String password) async {
    var url = Uri.https('development.mrsaidmostafa.com', '/api/login');
    try {
      var response = await http.post(
        url,
        body: {'username': email, 'password': password},
        headers: {'Accept': 'application/json'},
      );
      final responseData = json.decode(response.body);

      if (responseData['errors'] != null) {
        throw HttpException(responseData['errors']['username'][0]);
      }
      token = responseData['token'];
      _userId = responseData['data']['id'];
      _userEmail = responseData['data']['email'];
      _userPhone = responseData['data']['phone'];
      _name = responseData['data']['name'];
    } catch (error) {
      throw (error);
    }

    notifyListeners();
  }

  Future<void> rememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode(
      {
        'token': token,
        'userId': _userId,
        'userEmail': _userEmail,
        'userPhone': _userPhone,
        'name': _name,
      },
    );
    prefs.setString('userData', userData);
  }

  void logout() async {
    token = null;
    _userId = null;
    _userEmail = null;
    _userPhone = null;

    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<bool> tryAutoLogin() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedData = prefs.getString('userData');

    final data = (json.decode(extractedData!));
    token = data['token'];
    _userId = data['userId'];
    _userPhone = data['userPhone'];
    _userEmail = data['userEmail'];
    _name = data['name'];
    notifyListeners();
    return true;
  }
}
