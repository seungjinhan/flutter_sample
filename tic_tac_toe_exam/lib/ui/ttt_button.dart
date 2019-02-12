import 'dart:ui';

import 'package:flutter/material.dart';

class TTTBtn {
  final int id;
  String text;
  Color bg;
  bool enabled;

  TTTBtn({this.id, this.text = "", this.bg = Colors.lightBlue, this.enabled = true});
}
