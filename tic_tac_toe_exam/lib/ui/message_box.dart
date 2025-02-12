import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText;

  const MessageBox(this.title, this.content, this.callback, [this.actionText = 'Reset']);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text(title), content: Text(content), actions: <Widget>[
      FlatButton(
        onPressed: callback,
        color: Colors.white,
        child: Text(actionText),
      )
    ]);
  }
}
