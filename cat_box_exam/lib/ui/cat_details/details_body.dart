import 'package:cat_box_exam/models/cat.dart';
import 'package:flutter/material.dart';

class CatDetailsBody extends StatelessWidget {
  final Cat _cat;

  const CatDetailsBody(this._cat);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var locationInfo = Row(
      children: <Widget>[
        Icon(
          Icons.place,
          color: Colors.white,
          size: 16.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            _cat.location,
            style: textTheme.subhead.copyWith(color: Colors.white),
          ),
        )
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _cat.name,
          style: textTheme.headline.copyWith(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: locationInfo,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            _cat.description,
            style: textTheme.body1.copyWith(color: Colors.white70, fontSize: 16.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: <Widget>[
              _createCircleBadge(Icons.share, Colors.orange),
              _createCircleBadge(Icons.phone, Colors.white12),
              _createCircleBadge(Icons.email, Colors.white12),
            ],
          ),
        ),
      ],
    );
  }

  _createCircleBadge(IconData iconData, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: CircleAvatar(
        backgroundColor: color,
        child: Icon(
          iconData,
          color: Colors.white,
          size: 16.0,
        ),
        radius: 16.0,
      ),
    );
  }
}
