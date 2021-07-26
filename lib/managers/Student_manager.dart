import 'dart:convert';

import 'package:attendance/helper/httpexception.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Student_manager extends ChangeNotifier {

   
  String? _token;
  int? _userId;
  String? _userEmail;
  String? _userPhone;
  String? _userName;
  String? _userPassword;
  String? _userPasswordConfirmation;
  String? _userSchool;
  int? _userSubjectId;
  String? _userGroups;
  // String? groups;
  String? _userCityId;
  String? _userParent;
  String? _userRelationType;
  String? _userParentPhone;
  String? _phonparentWhatsapp;
  String? _userGender;
  String? _userStudyType;
  String? _userDiscount;
  String? _userCode;
  String? _userSecondLanguage;


  Future<void> add_student( String name, 
  // String phone,String email,
  //  String password,String password_confirmation, ,int subject_id
   String school , String groups,String city_id, String parent,String relation_type, String parent_phone , String parent_whatsapp ,String gender , String study_type ,String discount , String code ,String second_language ) async {
    var url = Uri.https('development.mrsaidmostafa.com', '/api/students');
    try {
      var response = await http.post(
        url,
        body: {
          'name' : name,
          // 'phone': phone,
          // 'email': email,
          // 'password': password,
          // 'password_confirmation' : password_confirmation,
          'school' : school ,
          // 'subject_id' : subject_id ,
          'groups' : groups ,
          'city_id' : city_id,
          'parent' : parent ,
          'relation_type' :  relation_type,
          'parent_phone' : parent_phone,
          'parent_whatsapp' : parent_whatsapp,
          'gender' : gender ,
          'study_type' : study_type ,
          'discount' : discount,
          'code' : code,
          'second_language' : second_language,
          },
        headers: {'Accept': 'application/json'},
      );
      final responseData = json.decode(response.body);

      if (responseData['errors'] != null) {
        throw HttpException('Failed to Add Student');
      }
      // _token = responseData['token'];
      // _userId = responseData['data']['id'];
      _userName = responseData['data']['name'];
      // _userEmail = responseData['data']['email'];
      // _userPhone = responseData['data']['phone'];
      // _userPassword = responseData['data']['password'];
      // _userPasswordConfirmation = responseData['data']['password_confirmation'];
      _userCode = responseData['data']['code'];
      _userSchool = responseData['data']['school'];
      // _userSubjectId = responseData['data']['subject_id'];
      _userStudyType = responseData['data']['study_type'];
      _userGroups = responseData['data']['groups'];
      _userCityId = responseData['data']['city_id'];
      _userParent = responseData['data']['parent'];
      _userRelationType = responseData['data']['relation_type'];
      _userParentPhone = responseData['data']['parent_phone'];
      _phonparentWhatsapp = responseData['data']['parent_whatsapp'];
      _userDiscount = responseData['data']['discount'];
      _userSecondLanguage = responseData['data']['second_language'];
      
      

    } catch (error) {
      throw (error);
    }

    notifyListeners();
  }
}
