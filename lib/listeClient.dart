import 'dart:convert';

import 'package:autoecole/api-projet/clientCalls.dart';
import 'package:autoecole/utils.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:http/http.dart' as http;

class Liste extends StatefulWidget {
  @override
  _ListeState createState() => _ListeState();
}

class _ListeState extends State<Liste> {
  Future<List<dynamic>> getAllUsers() async {
    var token = await Utils.getToken();
    var data = await http.get(
      "http://10.0.2.2:3000/user/allMointeur",
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(data.body);
    return jsonDecode(data.body);
  }

  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list"),
      ),
      body: _getBodyWidget(),
    );
  }

  Widget _getBodyWidget() {
    return Container(
        child: Container(
      child: FutureBuilder(
        future: getAllUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 26,
                dataRowColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected))
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.08);
                  return null; // Use the default value.
                }),
                columns: [
                  DataColumn(label: Text('First Name')),
                  DataColumn(label: Text('Last Name')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Age'), numeric: true),
                  DataColumn(label: Text('*')),
                ],
                rows: List.generate(snapshot.data.length, (index) {
                  final String firstName = snapshot.data[index]['firstname'];
                  final String lastName = snapshot.data[index]['lastname'];
                  final String Email = snapshot.data[index]['email'];
                  final int age = snapshot.data[index]['age'];

                  return DataRow(cells: [
                    DataCell(Container(
                      width: 100,
                      child: Text(firstName),
                    )),
                    DataCell(Container(
                      child: Text(lastName),
                    )),
                    DataCell(Container(
                      child: Text(Email),
                    )),
                    DataCell(Container(
                      child: Text(age.toString()),
                    )),
                    DataCell(Container(
                        child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () =>
                          confirtDelete(snapshot.data[index]["_id"]),
                    ))),
                  ]);
                }),
              ),
            ));
          }
          return Container(
            child: Center(child: Text("Loading...")),
          );
        },
      ),
    ));
  }

  confirtDelete(String id) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("delete"),
              content: Text("are you sure"),
              actions: [
                FloatingActionButton(
                  child: Text('yes'),
                  onPressed: () {
                    print(id);
                    ClientCalls.deletUsers(id).then((value) {
                      if (value.statusCode == 200) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Liste()));
                      }
                    });
                  },
                ),
                FloatingActionButton(
                  child: Text('no'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
  }
}
