import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

class LoginInitialState extends LoginState {
  @override
  String toString() {
    return "LoginInitialState";
  }
}

class LoginLoadingState extends LoginState {
  @override
  String toString() {
    return "LoginLoadingState";
  }
}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({@required this.error}) : super([error]);

  @override
  String toString() {
    return "LoginFailureState";
  }
}
