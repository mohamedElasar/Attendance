import 'dart:convert';

import 'package:attendance/helper/httpexception.dart';
import 'package:attendance/models/create_teacher.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Teacher_manager extends ChangeNotifier {
  String? _token;
  // int? _userId;

  String? _userPhone;
  String? _userPhone2;
  String? _userName;
  String? _userSchool;
  int? _userSubjectId;
  String? _userStages;
  String? _userCityId;
  String? _assistantPhone;
  String? _assistantPhone2;
  String? _userExperience;
  String? _userNote;

// Future<Create_Year> fetchYear() async {
//   final response =
//       await http.get(Uri.parse('https://development.mrsaidmostafa.com/api/years'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Create_Year.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

  Future<void> fetch() async {
    final url = Uri.parse('https://development.mrsaidmostafa.com/api/years');
    http.Response response =
        await http.get(url, headers: {'Accept': 'application/json'});
    print(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return Create_Year.fromJson(jsonDecode(response.body));
      print('okkk');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<void> add_teacher(
    String name,
    String phone,
    String phone2,
    String stages,
    String school,
    String subject_id,
    String city_id,
    String experience,
    String assistant_phone,
    String assistant_phone2,
    String note,
  ) async {
    var url = Uri.https('development.mrsaidmostafa.com', '/api/teachers');
    try {
      var response = await http.post(
        url,
        body: {
          'name': name,
          'phone': phone,
          'school': school,
          'subject_id': subject_id,
          'city_id': city_id,
          'phone2': phone2,
          'stages': stages,
          'assistant_phone': assistant_phone,
          'assistant_phone2': assistant_phone2,
          'experience': experience,
          'note': note
        },
        headers: {'Accept': 'application/json'},
      );
      final responseData = json.decode(response.body);

      if (responseData['errors'] != null) {
        throw HttpException('Failed to Add Teacher');
      }
      _token = responseData['token'];
      // _userId = responseData['data']['id'];
      _userName = responseData['data']['name'];
      _userPhone = responseData['data']['phone'];
      _userPhone2 = responseData['data']['phone2'];
      _userCityId = responseData['data']['city_id'];
      _userSchool = responseData['data']['school'];
      _userSubjectId = responseData['data']['subject_id'];
      _userStages = responseData['data']['stages'];
      _assistantPhone = responseData['data']['assistant_phone'];
      _assistantPhone2 = responseData['data']['assistant_phone2'];
      _userExperience = responseData['data']['experience'];
      _userNote = responseData['data']['note'];
    } catch (error) {
      throw (error);
    }

    notifyListeners();
  }
}
