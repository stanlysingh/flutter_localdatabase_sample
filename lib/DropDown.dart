import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: DropDown(),
    ));

class DropDown extends StatefulWidget {
  DropDown({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String valueChoose;
  List listItem = [
    "Item1",
    "Item2",
    "Item3",
    "Item4",
    "Item5",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButton(
                hint: Text("Others: "),
                dropdownColor: Colors.grey,
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 36,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
                value: valueChoose,
                onChanged: (newValue) {
                  setState(() {
                    valueChoose = newValue;
                  });
                },
                items: listItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList()),
          ),
        ),
      ),
    );
  }
}
