import 'dart:ui';

import 'package:flutter/material.dart';

class GButton {
  final id;
  String text;
  Color bg;
  bool enabled;

  GButton({this.id, this.text = "", this.bg = Colors.green, this.enabled = true});
}
