import 'package:cat_box_exam/models/cat.dart';
import 'package:cat_box_exam/utils/routers.dart';
import 'package:flutter/material.dart';
import 'package:cat_box_exam/services/api.dart';
import 'package:cat_box_exam/ui/cat_details/details_page.dart';
import 'dart:async';

class CatList extends StatefulWidget {
  @override
  _CatListState createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  List<Cat> _catList = [];

  @override
  void initState() {
    super.initState();
    _getCatList();
  }

  _getCatList() async {
    String jsonFile = await DefaultAssetBundle.of(context).loadString("assets/cats.json");
    setState(() {
      _catList = CallApi.catListFromJson(jsonFile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: _getBody(),
    );
  }

  Widget _getListTileUI() {
    return Text(
      'Cats',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32.0),
    );
  }

  Future<Null> refrech() {
    _getCatList();
    return Future<Null>.value();
  }

  _navigatoToCatDetails(Cat cat, Object aTag) {
    Navigator.of(context).push(Routers(
        builder: (context) {
          return CatDetailsPage(
            cat,
            aTag: aTag,
          );
        },
        settings: RouteSettings()));
  }

  Widget _getListView() {
    return Flexible(
      child: RefreshIndicator(
        onRefresh: refrech,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _catList.length,
          itemBuilder: (context, index) {
            Cat _cat = _catList[index];
            return Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      onTap: () => _navigatoToCatDetails(_cat, index),
                      leading: Hero(
                        tag: index,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(_cat.avatarUrl),
                        ),
                      ),
                      title: Text(
                        _cat.name,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                      subtitle: Text(_cat.description),
                      isThreeLine: true,
                      dense: false,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getBody() {
    return new Container(
      margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
      child: Column(
        children: <Widget>[
          _getListTileUI(),
          _getListView(),
        ],
      ),
    );
  }
}
