import 'package:cat_box_exam/models/cat.dart';
import 'package:cat_box_exam/ui/cat_details/details_body.dart';
import 'package:cat_box_exam/ui/cat_details/footer/details_footer.dart';
import 'package:cat_box_exam/ui/cat_details/header/details_header.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CatDetailsPage extends StatefulWidget {
  final Cat _cat;
  final Object aTag;

  CatDetailsPage(this._cat, {@required this.aTag});

  @override
  _CatDetailsPageState createState() => _CatDetailsPageState();
}

class _CatDetailsPageState extends State<CatDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = BoxDecoration(
      gradient: LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: [
          Colors.deepPurpleAccent,
          Colors.deepOrangeAccent,
        ],
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: linearGradient,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CatDetailsHeader(
                widget._cat,
                aTag: widget.aTag,
              ),
              Padding(
                  padding: const EdgeInsets.all(
                    24.0,
                  ),
                  child: CatDetailsBody(widget._cat)),
              CatShowcase(widget._cat)
            ],
          ),
        ),
      ),
    );
  }
}
