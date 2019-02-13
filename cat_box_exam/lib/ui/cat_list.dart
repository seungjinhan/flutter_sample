import 'package:cat_box_exam/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:cat_box_exam/services/api.dart';

class CatList extends StatefulWidget {
  @override
  _CatListState createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  List<Cat> _catList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCatList();
  }

  _getCatList() async {
    String jsonFile = await DefaultAssetBundle.of(context).loadString("assets/cats.json");
    for (Cat _cat in CallApi.catListFromJson(jsonFile)) {
      _catList.add(_cat);
    }

    print(_catList.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: _getListTileUI(),
    );
  }

  Widget _getListTileUI() {
    return Text(
      'Cats',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32.0),
    );
  }
}
