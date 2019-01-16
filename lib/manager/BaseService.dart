import 'package:flutter_init/home/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import './HomeAPi.dart';
import './../home/model/user.dart';

class BaseService extends HomeAPi {
  var baseUrl = "https://api.github.com/users";
  http.Client _client = http.Client();

  set client(http.Client value) => _client = value;

  static final BaseService _internal = BaseService.internal();
  factory BaseService() => _internal;
  BaseService.internal();

  Future<List<User>> getHome() async {
    var response = await _client.get('$baseUrl');

    if (response.statusCode == 200) {
      List data = json.decode(response.body.toString());
      return data.map((f) => User.fromMap(f)).toList();
    } else {
      throw Exception('Failed to get data');
    }
  }
}
