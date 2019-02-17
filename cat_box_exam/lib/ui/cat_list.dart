import 'package:cat_box_exam/models/cat.dart';
import 'package:cat_box_exam/utils/routers.dart';
import 'package:flutter/material.dart';
import 'package:cat_box_exam/services/api.dart';
import 'package:cat_box_exam/ui/cat_details/details_page.dart';
import 'dart:async';

class CatList extends StatefulWidget {
  @override
  _CatListState createState() => new _CatListState();
}

class _CatListState extends State<CatList> {
  List<Cat> _cats = [];
  CatApi _api;
  NetworkImage _profileImage;

  CallApi _api;
  NetworkImage _profileImage;

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    _getCatList();
    _loadFromFirebase();
  }

  _loadFromFirebase() async {
    final api = await CallApi.signInWithGoogle();
    setState(() {
      _api = api;
      _profileImage = NetworkImage(api.firebase_user.photoUrl);
    });
  }

  _getCatList() async {
    String jsonFile = await DefaultAssetBundle.of(context).loadString("assets/cats.json");
    print(jsonFile);
=======
    _loadCats();
    _loadFromFirebase();
  }

  _loadFromFirebase() async {
    final api = await CatApi.signInWithGoogle();
>>>>>>> 0f24d80b013ff77c2881b8b948d5c0fb9d15c8ce
    setState(() {
      _api = api;
      _profileImage = new NetworkImage(api.firebaseUser.photoUrl);
    });
  }

<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: _getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: _api != null ? 'Signed-in' + _api.firebase_user.displayName : 'Not signed in',
        backgroundColor: Colors.blue,
        child: CircleAvatar(
          backgroundImage: _profileImage,
          radius: 50.0,
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
=======
  _loadCats() async {
    String fileData = await DefaultAssetBundle.of(context).loadString("assets/cats.json");
    setState(() {
      _cats = CatApi.allCatsFromJson(fileData);
    });
>>>>>>> 0f24d80b013ff77c2881b8b948d5c0fb9d15c8ce
  }

  Widget _buildCatItem(BuildContext context, int index) {
    Cat cat = _cats[index];

<<<<<<< HEAD
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
=======
    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              onTap: () => _navigateToCatDetails(cat, index),
              leading: new Hero(
                tag: index,
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(cat.avatarUrl),
                ),
              ),
              title: new Text(
                cat.name,
                style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              subtitle: new Text(cat.description),
              isThreeLine: true, // Less Cramped Tile
              dense: false, // Less Cramped Tile
            ),
          ],
        ),
      ),
    );
  }

  _navigateToCatDetails(Cat cat, Object avatarTag) {
    Navigator.of(context).push(
      new FadePageRoute(
        builder: (c) {
          return new CatDetailsPage(cat, avatarTag: avatarTag);
        },
        settings: new RouteSettings(),
      ),
    );
  }

  Widget _getAppTitleWidget() {
    return new Text(
      'Cats',
      style: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
>>>>>>> 0f24d80b013ff77c2881b8b948d5c0fb9d15c8ce
      ),
    );
  }

<<<<<<< HEAD
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
=======
  Widget _buildBody() {
    return new Container(
      margin: const EdgeInsets.fromLTRB(
          8.0, // A left margin of 8.0
          56.0, // A top margin of 56.0
          8.0, // A right margin of 8.0
          0.0 // A bottom margin of 0.0
          ),
      child: new Column(
        // A column widget can have several
        // widgets that are placed in a top down fashion
        children: <Widget>[_getAppTitleWidget(), _getListViewWidget()],
      ),
    );
  }

  Future<Null> refresh() {
    _loadCats();
    return new Future<Null>.value();
  }

  Widget _getListViewWidget() {
    return new Flexible(
        child: new RefreshIndicator(onRefresh: refresh, child: new ListView.builder(physics: const AlwaysScrollableScrollPhysics(), itemCount: _cats.length, itemBuilder: _buildCatItem)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: _buildBody(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          // Do something when FAB is pressed
        },
        tooltip: _api != null ? 'Signed-in: ' + _api.firebaseUser.displayName : 'Not Signed-in',
        backgroundColor: Colors.blue,
        child: new CircleAvatar(
          backgroundImage: _profileImage,
          radius: 50.0,
        ),
      ),
    );
>>>>>>> 0f24d80b013ff77c2881b8b948d5c0fb9d15c8ce
  }
}
