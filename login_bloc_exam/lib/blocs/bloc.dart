import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  //final _email = StreamController<String>.broadcast();
  //final _password = StreamController<String>.broadcast();

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  submit() {
    final validEmail = _email.value;
    final vaildPassword = _password.value;

    print('Email is $validEmail');
    print('Passwor dis $vaildPassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
