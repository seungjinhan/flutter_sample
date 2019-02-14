import 'package:cat_box_exam/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final dynamic cattributeLookup = {
  "children": {"name": "han sj", "icon": FontAwesomeIcons.child},
  "desexed": {"name": "kim sj", "icon": FontAwesomeIcons.cut},
  "vaccinated": {"name": "chang sj", "icon": FontAwesomeIcons.eyeDropper},
  "microchipped": {"name": "tan sj", "icon": FontAwesomeIcons.microchip},
};

class CattributesShowcase extends StatelessWidget {
  final Cat _cat;
  CattributesShowcase(this._cat);
  @override
  Widget build(BuildContext context) {
    var items = <Widget>[];
    for (var i = 0; i < _cat.cattributes.length; i++) {
      var badge = _createCircleBadge(
        cattributeLookup[_cat.cattributes[i]]["icon"],
        Colors.white12,
        Colors.white,
        cattributeLookup[_cat.cattributes[i]]['name'],
      );
      items.add(badge);
    }

    var delegate = SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0);
    return GridView(
      padding: const EdgeInsets.only(top: 16.0),
      gridDelegate: delegate,
      children: items,
    );
  }

  _createCircleBadge(IconData iconData, Color c1, Color c2, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: c1,
            child: Icon(
              iconData,
              color: c2,
              size: 36.0,
            ),
            radius: 36.0,
          ),
          Positioned(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
                color: c2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
