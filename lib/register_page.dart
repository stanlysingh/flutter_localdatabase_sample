import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/main.dart';
import 'package:flutter_login/models/user.dart';
//import 'package:validators/validators.dart' as validator;
import 'data/database-helper.dart';
import 'model.dart';
//import 'result.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: TestForm(),
      ),
    );
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  String title = 'DropDownButton';
  String PaymentVal;
  List _Payment = ['PayPay', 'Cash', 'GPay', 'RPay', 'LinePay'];

  String type = 'DropDownButton';
  String BusinessType;
  List _Business = ['a', 'b', 'c', 'd'];

  bool _ispasswordHidden = true;
  bool _iscnfPasswordHidden = true;

  var _fullnameTextController = TextEditingController();
  var _firstnameTextController = TextEditingController();
  var _storenameTextController = TextEditingController();
  var _storeTextController = TextEditingController();
  var _licensenumController = TextEditingController();
  var _addressTextController = TextEditingController();
  var _numberTextController = TextEditingController();
  var _mailTextController = TextEditingController();
  var _passwordTextController = TextEditingController();
  var _confirmpassTextController = TextEditingController();

  void _togglePswdVisibility() {
    setState(() {
      _ispasswordHidden = !_ispasswordHidden;
    });
  }

  void _toggleCnfPswdVisibility() {
    setState(() {
      _iscnfPasswordHidden = !_iscnfPasswordHidden;
    });
  }

  final _formKey = GlobalKey<FormState>();
  Model model = Model();

  @override
  Widget build(BuildContext context) {
    final halfMediaWith = MediaQuery.of(context).size.width / 2.0;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  Padding(padding: EdgeInsets.all(8)),
                  Text(
                    "お店の登録",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black12,
                          backgroundImage: AssetImage('Images/user-solid.png'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 50.0, right: 00.0, left: 60.0, bottom: 0.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('Images/upload-512.png'),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: halfMediaWith,
                        child: buildTextField('氏名 *', _fullnameTextController),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        width: halfMediaWith,
                        child: buildTextField('名字 *', _firstnameTextController),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField("お店名 *", _storenameTextController),
                  SizedBox(
                    height: 5,
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                              child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                                  child: Container(
                                    height: 40,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(color: Colors.grey[200]),
                                        borderRadius: BorderRadius.circular(35)),
                                    child: DropdownButton(
                                      //hint: buildTextField('その他 *',_otherTextController),
                                        hint: Text('その他 *'),
                                        dropdownColor: Colors.grey[200],
                                        elevation: 0,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                        iconEnabledColor: Colors.grey,
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        iconSize: 25.0,
                                        isExpanded: true,
                                        value: BusinessType,
                                        onChanged: (value) {
                                          setState(() {
                                            BusinessType = value;
                                          });
                                        },
                                        items: _Business.map((value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList()),
                                  )))
                        ],
                      )
                    ],
                  ),
                  //buildTextField("その他 *", _otherTextController),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField("自店の業態を入力 *", _storeTextController),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField("営業許可番号", _licensenumController),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField("住所*(例:浦和区高砂4丁目419)", _addressTextController),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField("電話番号 *", _numberTextController),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextField("メールアドレス*", _mailTextController),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextPasswordField("パスワード *", _passwordTextController),
                  SizedBox(
                    height: 5,
                  ),
                  buildTextcnfPaswordField("パスワード(確認) *", _confirmpassTextController),
                  SizedBox(
                    height: 5,
                  ),
                  Column(children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(left: 50)),
                          Text(
                            'お店の支払方法 *',
                            style: TextStyle(color: Colors.grey[500], fontSize: 15),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 60, right: 34),
                              child: Container(
                                height: 35,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    border: Border.all(color: Colors.grey[200]),
                                    borderRadius: BorderRadius.circular(35)),
                                child: DropdownButton(
                                    hint: Text(
                                      '支払いモード',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    dropdownColor: Colors.grey[200],
                                    elevation: 5,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    iconEnabledColor: Colors.grey,
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    iconSize: 25.0,
                                    isExpanded: true,
                                    value: PaymentVal,
                                    onChanged: (value) {
                                      setState(() {
                                        PaymentVal = value;
                                      });
                                    },
                                    items: _Payment.map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList()),
                              ),
                            ),
                          ),
                        ]),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  buildButtonContainer(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "すでにアカウントをお持ちですか ?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35.0),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  buildButtonContaine(),
                ])),
          )),
    );
  }

  Widget buildTextPasswordField(String hintText, fieldController) {
    return Container(
        height: 40,
        child: Padding(
          padding: EdgeInsets.only(right: 30, left: 30, bottom: 0, top: 2),
          child: Center(
            child: TextField(
              controller: fieldController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey[200],
                //prefixIcon: hintText == "Email" //Icon(Icons.email) : Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: _togglePswdVisibility,
                  icon: _ispasswordHidden
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
              obscureText: _ispasswordHidden,
            ),
          ),
        ));
  }
  Widget buildTextcnfPaswordField(String hintText, fieldController) {
    return Container(
        height: 40,
        child: Padding(
          padding: EdgeInsets.only(right: 30, left: 30, bottom: 0, top: 2),
          child: Center(
            child: TextField(
              controller: fieldController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey[200],
                //prefixIcon: hintText == "Email" //Icon(Icons.email) : Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: _toggleCnfPswdVisibility,
                  icon: _iscnfPasswordHidden
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
              obscureText: _iscnfPasswordHidden,
            ),
          ),
        ));
  }
  Widget buildTextField(String hintText, fieldController) {
    return Container(
        height: 40,
        child: Padding(
          padding: EdgeInsets.only(right: 30, left: 30, bottom: 0, top: 2),
          child: Center(
            child: TextField(
              controller: fieldController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey[200],
                //prefixIcon: hintText == "Email" //Icon(Icons.email) : Icon(Icons.lock),
              ),
              obscureText:  false,
            ),
          ),
        ));
  }

  Widget buildButtonContainer() {
    return GestureDetector(
      onTap: ()async {
        if (_fullnameTextController.text.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please enter your Full name",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        if (_firstnameTextController.text.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please enter your First Name",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        if (_storenameTextController.text.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please enter your Store name",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        if (BusinessType.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please enter business type",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        if (_storeTextController.text.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please enter your Store",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        if (_licensenumController.text.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please enter your License Number",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        if (_addressTextController.text.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please enter your Address",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        if (_numberTextController.text.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please enter your Phone Number",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        if (_mailTextController.text.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please enter your MailAddress",
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
              msg: "Please enter your PassWord",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        if (_confirmpassTextController.text.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please enter your Confirm Password",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        if (PaymentVal.isEmpty) {
          Fluttertoast.showToast(
              msg: "Please choose payment type",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        User user=User();
        user.mfullname=_fullnameTextController.text;
        user.mfirstname=_firstnameTextController.text;
       user.mstorename=_storenameTextController.text;
        user.mbusinesstype=BusinessType;
        user.mstore=_storeTextController.text;
        user.mlicensenumber=_licensenumController.text;
        user.maddress=_addressTextController.text;
        user.mnumber=_numberTextController.text;
        user.mmail=_mailTextController.text;
        user.mpassword=_passwordTextController.text;
        user.mconfirmpass=_confirmpassTextController.text;
        user.mpayment=PaymentVal;

        var db = new DatabaseHelper();
        await db.saveUser(user);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          padding: EdgeInsets.only(right: 30, left: 30, bottom: 0, top: 0),
          height: 40.0,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: [Color(0xFFEE5623), Color(0xFFEE5623)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft),
          ),
          child: Center(
            child: Text(
              " 登録完了",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonContaine() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 40.0,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: [Color(0xFF000000), Color(0xFF000000)],
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
      ),
    );
  }
}

/* Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWith,
                  child: MyTextFormField(
                    hintText: '氏名 *',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your Full name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.FullName = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWith,
                  child: MyTextFormField(
                    hintText: '名字 *',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your First name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.FirstName = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            MyTextFormField(
              hintText: 'お店名 *',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your Store name';
                }
                return null;
              },
              onSaved: (String value) {
                model.Storename = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            MyTextFormField(
              hintText: 'その他 *',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your Business Type';
                }
                return null;
              },
              onSaved: (String value) {
                model.Other = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            MyTextFormField(
              hintText: '自店の業態を入力 *',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your Enter the Format of your store';
                }
                return null;
              },
              onSaved: (String value) {
                model.EntertheFormatofyourstore = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            MyTextFormField(
              hintText: '営業許可番号 ',
              onSaved: (String value) {
                model.businesslicencenumber = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            MyTextFormField(
              hintText: '住所*(例:浦和区高砂4丁目419)',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your Address';
                }
                return null;
              },
              onSaved: (String value) {
                model.Address = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            MyTextFormField(
              hintText: '電話番号 *',
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Enter your PhoneNumber';
                }
                return null;
              },
              onSaved: (String value) {
                model.PhoneNumber = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            MyTextFormField(
              hintText: 'メールアドレス*',
              isEmail: true,
              validator: (String value) {
                if (!validator.isEmail(value)) {
                  return 'Please enter a value email';
                }
                return null;
              },
              onSaved: (String value) {
                model.MailAddress = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            MyTextFormField(
              hintText: 'パスワード *',
              isPassward: true,
              validator: (String value) {
                if (value.length < 8) {
                  return 'Password should be minimum 8 characters';
                }
                _formKey.currentState.save();
                return null;
              },
              onSaved: (String value) {
                model.Password = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            MyTextFormField(
              hintText: 'パスワード(確認) *',
              isPassward: true,
              /*validator: (String value) {
                if (value.length < 8) {
                  return 'Password should be minimum 8 characters';
                } else if (model.Password != null && value != model.Password) {
                  return 'Password not matched';
                }
                return null;
              },*/
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('お店の支払方法 *'),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            height: 40,
                            padding: EdgeInsets.only(left: 16, right: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[100]),
                                borderRadius: BorderRadius.circular(35)),
                            child: DropdownButton(
                                hint: Text('支払いモード'),
                                dropdownColor: Colors.grey[200],
                                elevation: 5,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 25.0,
                                value: PaymentVal,
                                onChanged: (value) {
                                  setState(() {
                                    PaymentVal = value;
                                  });
                                },
                                items: _Payment.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList()),
                          ),
                        ),
                        /*Container(
                      alignment: Alignment.topCenter,
                      width: halfMediaWith,
                      child: MyTextFormField(
                        hintText: 'PayPay',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Enter your Payment mode';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          model.Paypay = value;
                        },
                      ),
                    )*/
                      ),
                    ])
              ],
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    }
                  },
                  child: Center(
                    child: Text(
                      "新規登録",
                      style: TextStyle(color: Colors.white, fontSize: 17.0),
                    ),
                  ),
                  color: Colors.deepOrange,
                ),
              ),
            ),
            // buildButtonContainer(),
            SizedBox(
              height: 5,
            ),
            Text("すでにアカウントをお持ちですか ?"),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35.0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  child: Center(
                    child: Text(
                      "ログイン",
                      style: TextStyle(color: Colors.white, fontSize: 17.0),
                    ),
                  ),
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            // buildButtonContaine(),
          ],
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassward;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassward = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: Padding(
        padding: EdgeInsets.only(right: 30, left: 30, bottom: 2, top: 0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontFamily: "WorkSend"),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: (hintText == 'パスワード *' || hintText == 'パスワード(確認) *')
                ? IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: Icon(Icons.visibility_off),
                  )
                : null,
            //border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
          ),
          obscureText: isPassward ? true : false,
          validator: validator,
          onSaved: onSaved,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
        ),
      ),
    );
  }
}*/

/*Widget buildButtonContainer() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
      height: 48.0,
      // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
            colors: [Color(0xFFEE5623), Color(0xFFEE5623)],
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

Widget buildButtonContaine() {
  return GestureDetector(
    /* onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DashBoard();
      }));*/

    child: Container(
      height: 48.0,
      // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF000000)],
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
*/
/*Scaffold(
      body: Center(
        child: Container(
          width: 1000,
          padding: EdgeInsets.all(18.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
              ),
              Text(
                "Register",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.black12,
                      backgroundImage: AssetImage('images/user-solid.png'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 50.0, right: 00.0, left: 70.0, bottom: 0.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/upload-512.png'),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
