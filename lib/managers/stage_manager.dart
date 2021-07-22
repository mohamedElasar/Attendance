import 'dart:convert';
import 'dart:io';

import 'package:attendance/managers/Auth_manager.dart';
import 'package:attendance/models/stage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:attendance/models/year.dart';

class StageManager extends ChangeNotifier {
  void receiveToken(Auth_manager auth, List<Stage> stages) {
    authToken = auth.token;
    _stages = stages;
  }

  String? authToken;
  List<Stage>? _stages = [];
  List<Stage>? get stages => _stages;

  Future<void> get_stages() async {
    var url = Uri.https('development.mrsaidmostafa.com', '/api/stages');
    try {
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $authToken'
        },
      );
      final responseData = json.decode(response.body);

      List<dynamic> stagesList = responseData['data'];
      var list = stagesList.map((data) => Stage.fromJson(data)).toList();
      _stages = list;

      // add exception

    } catch (error) {
      print(error);
    }

    notifyListeners();
  }

  // String getStageId(Stage mystage){

  // }
}
