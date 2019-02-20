import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (v, sink) {
    if (v.contains('@')) {
      sink.add(v);
    } else {
      sink.addError('wrong email type');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(handleData: (v, sink) {
    if (v.length > 3) {
      sink.add(v);
    } else {
      sink.addError("3 more word");
    }
  });
}
