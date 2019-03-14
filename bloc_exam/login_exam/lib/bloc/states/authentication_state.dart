import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationUninitializedState extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationUninitializedState";
  }
}

class AuthenticationAuthenticatedState extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationAuthenticatedState";
  }
}

class AuthenticationUnauthenticatedState extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationUnauthenticatedState ";
  }
}

class AuthenticationLoadingState extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationLoadingState ";
  }
}
