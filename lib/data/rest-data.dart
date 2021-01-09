import 'dart:async';

import 'package:flutter_login/models/user.dart';

import 'database-helper.dart';

class RestData {
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(User loginUser) async {
    String flagLogged = "logged";
    //simulate internet connection by selecting the local database to check if user has already been registered
    var db = new DatabaseHelper();
    var userRetorno = new User(); //(null, null, null, null);
    userRetorno = await db.selectUser(loginUser);
    if (userRetorno != null) {
      flagLogged = "logged";
      return new Future.value(
          userRetorno); //(null, username, password, flagLogged));
    } else {
      flagLogged = "not";
      return new Future.value(
          null); //(null, username, password, flagLogged));
    }
  }
}
