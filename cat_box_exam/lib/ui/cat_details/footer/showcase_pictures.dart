import 'package:cat_box_exam/models/cat.dart';
import 'package:flutter/material.dart';

class PicturesShowcase extends StatelessWidget {
  final Cat _cat;
  PicturesShowcase(this._cat);

  @override
  Widget build(BuildContext context) {
    var items = <Widget>[];
    for (var i = 0; i < _cat.pictures.length; i++) {
      var img = Image.network(_cat.pictures[i], width: 200.0, height: 200.0);
      items.add(img);
    }

    var delegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    );

    return GridView(
      padding: const EdgeInsets.only(top: 16.0),
      gridDelegate: delegate,
      children: items,
    );
  }
}
