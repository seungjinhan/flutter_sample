import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:web_json_viewing_exam/models/photo_model.dart';
import 'dart:convert';

import 'package:web_json_viewing_exam/ui/photo_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 1;

  List<PhotoModel> pList = [];

  void fetchImage() async {
    var res = await get('http://jsonplaceholder.typicode.com/photos/$counter');
    var pm = PhotoModel.fromJson(json.decode(res.body));
    counter++;

    setState(() {
      pList.add(pm);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PhotoList(pList),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
