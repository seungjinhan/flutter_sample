import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:login_exam/pages/home_page.dart';
import 'package:login_exam/pages/login_page.dart';
import 'package:login_exam/pages/splash_page.dart';
import 'package:login_exam/repositories/user_repository.dart';
import 'package:login_exam/util/loading_indicator.dart';
import 'package:login_exam/util/simple_bloc_delegate.dart';
import 'package:login_exam/bloc/authentication_bloc.dart';
import 'package:login_exam/bloc/events/authentication_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_exam/bloc/states/authentication_state.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App(
    userRepository: UserRepository(),
  ));
}

class App extends StatefulWidget {
  final UserRepository userRepository;

  const App({Key key, @required this.userRepository}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationBloc authenticationBloc;
  UserRepository get userRepository => widget.userRepository;

  @override
  void initState() {
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
    authenticationBloc.dispatch(AppStartedEvent());
    super.initState();
  }

  @override
  void dispose() {
    authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: authenticationBloc,
      child: MaterialApp(
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationUninitializedState) {
              return SplashPage();
            }
            if (state is AuthenticationAuthenticatedState) {
              return HomePage();
            }
            if (state is AuthenticationUnauthenticatedState) {
              return LoginPage(userRepository: userRepository);
            }
            if (state is AuthenticationLoadingState) {
              return LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
