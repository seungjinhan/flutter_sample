import 'package:flutter/material.dart';
import 'package:login_bloc_exam/blocs/provider.dart';
import 'package:login_bloc_exam/screens/login_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Login',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
