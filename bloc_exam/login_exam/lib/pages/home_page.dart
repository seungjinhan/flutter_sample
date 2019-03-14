import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_exam/bloc/authentication_bloc.dart';
import 'package:login_exam/bloc/events/authentication_event.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('logout'),
            onPressed: () {
              authenticationBloc.dispatch(LoggedOutEvent());
            },
          ),
        ),
      ),
    );
  }
}
