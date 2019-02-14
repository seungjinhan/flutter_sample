import 'package:cat_box_exam/models/cat.dart';
import 'package:cat_box_exam/ui/cat_details/footer/showcase_cattributes.dart';
import 'package:cat_box_exam/ui/cat_details/footer/showcase_details.dart';
import 'package:cat_box_exam/ui/cat_details/footer/showcase_pictures.dart';
import 'package:flutter/material.dart';

class CatShowcase extends StatefulWidget {
  final Cat _cat;

  CatShowcase(this._cat);
  @override
  _CatShowcaseState createState() => _CatShowcaseState();
}

class _CatShowcaseState extends State<CatShowcase> with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _tController;

  @override
  void initState() {
    super.initState();
    _tabs = [
      Tab(text: 'Picture'),
      Tab(text: 'Detail'),
      Tab(text: 'Cattributes'),
    ];

    _pages = [
      PicturesShowcase(widget._cat),
      DetailsShowcase(widget._cat),
      CattributesShowcase(widget._cat),
    ];

    _tController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _tController,
            tabs: _tabs,
            indicatorColor: Colors.white,
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: TabBarView(
              controller: _tController,
              children: _pages,
            ),
          )
        ],
      ),
    );
  }
}
