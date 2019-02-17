import 'package:flutter/material.dart';
import 'package:form_validation_bloc_exam/ui/login_ui.dart';
import 'package:form_validation_bloc_exam/ui/login_ui.mixin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(body: LoginUiMixin()),
    );
  }
}
