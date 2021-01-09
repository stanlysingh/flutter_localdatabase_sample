import 'package:flutter/cupertino.dart';

import 'data/rest-data.dart';
import 'models/user.dart';

abstract class LoginPageContract {
  void onLoginSuccess(var user);
  void onLoginError(String error);
}

class LoginPagePresenter {
  LoginPageContract _view;
  RestData api = new RestData();
  LoginPagePresenter(this._view);

//Simulator login
  doLogin(User loginUser) {
    api
        .login(loginUser)
        .then((user) => _view.onLoginSuccess(user))
        .catchError((onError) => _view.onLoginError(onError));
  }
}
