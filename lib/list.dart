import 'package:flutter/material.dart';

class Examen extends StatefulWidget {
  @override
  _ExamenState createState() => _ExamenState();
}

class _ExamenState extends State<Examen> {
  String valueChoose;
  List listItem = ["Code", "Conduit"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: Center(
        child: DropdownButton(
            value: valueChoose,
            onChanged: (newValue) {
              setState(() {
                valueChoose = newValue;
              });
            },
            items: listItem.map((valueItem) {
              return DropdownMenuItem(value: valueItem, child: Text(valueItem));
            })),
      ),
    );
  }
}
