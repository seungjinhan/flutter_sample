import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_exam/repositories/user_repository.dart';
import 'package:login_exam/bloc/authentication_bloc.dart';
import 'package:login_exam/bloc/login_bloc.dart';
import 'package:login_exam/pages/splash_page.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);
    print(transition);
  }
}


