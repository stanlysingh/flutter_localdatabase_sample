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

import 'login_presenter.dart';

class DashBoardPage extends StatefulWidget {
  DashBoardPage(this.userDetails);
  User userDetails;
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

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
                    'Welcome',
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

                          Center(
                            child: Text(widget.userDetails.mfirstname,style: TextStyle(fontSize: 22),),
                          )

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


}
