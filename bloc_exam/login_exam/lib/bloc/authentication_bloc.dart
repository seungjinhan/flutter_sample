import 'package:bloc/bloc.dart';
import 'package:login_exam/bloc/events/authentication_event.dart';
import 'package:login_exam/bloc/states/authentication_state.dart';
import 'package:login_exam/repositories/user_repository.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository}) : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitializedState();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationState currentState, AuthenticationEvent event) async* {
    if (event is AppStartedEvent) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticatedState();
      } else {
        yield AuthenticationUnauthenticatedState();
      }
    }

    if (event is LoggedInEvent) {
      yield AuthenticationLoadingState();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticatedState();
    }

    if (event is LoggedOutEvent) {
      yield AuthenticationLoadingState();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticatedState();
    }
  }
}
