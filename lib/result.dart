import 'package:flutter/material.dart';
import 'model.dart';

class Result extends StatelessWidget {
  Model model;

  Result({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Successful'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.FullName,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.FirstName,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.Storename,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.Businesstype,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.EntertheFormatofyourstore,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.businesslicencenumber,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.Address,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.PhoneNumber,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.MailAddress,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.Password,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.ConfirmPassword,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.Paypay,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
