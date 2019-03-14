import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStartedEvent extends AuthenticationEvent {
  @override
  String toString() {
    return "AppStartedEvent";
  }
}

class LoggedInEvent extends AuthenticationEvent {
  final String token;

  LoggedInEvent({@required this.token}) : super([token]);

  @override
  String toString() {
    return "LoggedInEvent";
  }
}

class LoggedOutEvent extends AuthenticationEvent {
  @override
  String toString() {
    return "LoggedOutEvent";
  }
}
