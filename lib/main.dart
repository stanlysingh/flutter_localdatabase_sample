import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/register_page.dart';
import 'package:flutter_login/models/user.dart';
//import 'package:flutter_login/logexample.dart';
//import 'package:flutter_login/result.dart';
import 'package:validators/validators.dart' as validator;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_login/login_presenter.dart';

import 'dashboard_view.dart';
import 'login_presenter.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isHidden = true;
  bool _isLoading = false;
  var _usernameTextController = TextEditingController();
  var _passwordTextController = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  String _email, _password;

  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }


  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.deepOrangeAccent,
      /*Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage())),*/
      body: Form(
        key: formkey,
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0, bottom: 40, top: 20),
          child: Center(
            child: Container(
              height: 600,
              padding: EdgeInsets.only(
                  top: 10.0, right: 0.0, left: 0.0, bottom: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'テイクGo',
                    style:
                    TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            "ログイン",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 0,
                            ),
                            child: buildTextField(
                                "メールアドレス*", _usernameTextController),
                          ),
                          //buildTextField("メールアドレス*"),
                          SizedBox(height: 10.0),
                          buildTextField("パスワード*", _passwordTextController),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                    padding:
                                    EdgeInsets.only(left: 0, right: 0)),
                                InkWell(
                                  onTap: () {},
                                  child: new Text(
                                    "パスワードを忘れた方はこちら?",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          buildButtonLoginContainer(),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "新規の方は? ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          buildButtonSignupContainer(),
                        ],
                      ),
                    ),
                  ),

                  /*(Container(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [buildButtonContaine(), Text(" 新規登録")],
                        ),
                      ),
                    ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget buildTextField(String hintText, fieldController) {
    return Container(
      height: 50,
      child: TextField(
        controller: fieldController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35.0),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.grey[200],
          //prefixIcon: hintText == "Email" //Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == "パスワード*"
              ? IconButton(
            onPressed: _toggleVisibility,
            icon: _isHidden
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
          )
              : null,
        ),
        obscureText: hintText == "パスワード*" ? _isHidden : false,
      ),
    );
  }

  Widget buildButtonLoginContainer() {
    return GestureDetector(
      onTap: () {
        if (_usernameTextController.text.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please enter your Mail Address",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        if (_passwordTextController.text.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please enter your Password",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        User user = User();/*
        user.mmail = _usernameTextController.text;
        user.mpassword = _passwordTextController.text;*/


        user.mmail = _usernameTextController.text;
        user.mpassword = _passwordTextController.text;

        _presenter.doLogin(user);


        /*Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ();
        }));*/
      },
      child: Container(
        height: 50.0,
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          gradient: LinearGradient(
              colors: [Color(0xFFEE5623), Color(0xFFEE5623)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
        ),
        child: Center(
          child: Text(
            " ログイン",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }

  Widget buildButtonSignupContainer() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RegisterView();
        }));
      },
      child: Container(
        height: 50.0,
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
              colors: [Color(0xFF000000), Color(0xFF000000)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
        ),
        child: Center(
          child: Text(
            " 新規登録",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
      Fluttertoast.showToast(
          msg: error ?? "Something went wrong",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);

  }

  @override
  void onLoginSuccess(var user) {

    if(user!=null){

      Fluttertoast.showToast(
          msg: "Login success",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DashBoardPage(user);
      }));
    }else{

      Fluttertoast.showToast(
          msg: "Login failure",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);

    }





  }


}
