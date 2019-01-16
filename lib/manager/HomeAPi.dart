import 'dart:async';
import './../home/model/user.dart';

abstract class HomeAPi {
  Future<List<User>> getHome();
}
