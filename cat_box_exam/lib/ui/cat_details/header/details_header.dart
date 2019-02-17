import 'package:cat_box_exam/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CatDetailsHeader extends StatefulWidget {
  final Cat _cat;
  final Object aTag;

  CatDetailsHeader(this._cat, {@required this.aTag});

  @override
  _CatDetailsHeaderState createState() => _CatDetailsHeaderState();
}

class _CatDetailsHeaderState extends State<CatDetailsHeader> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    var avatar = Hero(
      child: CircleAvatar(
        backgroundImage: NetworkImage(widget._cat.avatarUrl),
        radius: 75.0,
      ),
      tag: widget.aTag,
    );

    var likeInfo = Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.thumb_up,
            size: 16.0,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Text(
              widget._cat.likeCounter.toString(),
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );

    var actionButton = Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: MaterialButton(
              minWidth: 140.0,
              color: theme.accentColor,
              textColor: Colors.white,
              onPressed: () async {},
              child: Text("Adopt Me"),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: RaisedButton(
              color: Colors.lightGreen,
              disabledColor: Colors.grey,
              textColor: Colors.white,
              onPressed: () async {},
              child: Text("LIKE"),
            ),
          )
        ],
      ),
    );
    return Stack(
      children: <Widget>[
        Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.4,
          child: Column(
            children: <Widget>[
              avatar,
              likeInfo,
              actionButton,
            ],
          ),
        ),
        Positioned(
          top: 26.0,
          left: 4.0,
          child: BackButton(
            color: Colors.yellowAccent,
          ),
        )
      ],
    );
  }
}
