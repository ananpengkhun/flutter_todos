import 'dart:async';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';

import './../../manager/HomeAPi.dart';
import './../model/user.dart';

class HomeViewModel extends Model {
  final HomeAPi homeAPi;

  Future<List<User>> _user;
  Future<List<User>> get user => _user;
  set user(Future<List<User>> user) {
    _user = user;
    notifyListeners();
  }

  HomeViewModel({@required this.homeAPi});

  Future<bool> setUser() async {
    user = homeAPi?.getHome();
    return user != null;
  }
}
