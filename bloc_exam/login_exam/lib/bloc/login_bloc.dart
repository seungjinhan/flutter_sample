import 'dart:async';
import 'package:login_exam/bloc/events/authentication_event.dart';
import 'package:login_exam/bloc/events/login_event.dart';
import 'package:login_exam/bloc/states/login_state.dart';
import 'package:meta/meta.dart';
import 'package:login_exam/bloc/authentication_bloc.dart';
import 'package:login_exam/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({@required this.userRepository, @required this.authenticationBloc})
      : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginState currentState, LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      yield LoginLoadingState();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );
        authenticationBloc.dispatch(LoggedInEvent(token: token));

        yield LoginInitialState();
      } catch (e) {
        yield LoginFailureState(error: e.toString());
      }
    }
  }
}
