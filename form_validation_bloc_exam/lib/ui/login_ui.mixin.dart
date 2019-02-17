import 'package:flutter/material.dart';

import '../mixin/validation_mixin.dart';

class LoginUiMixin extends StatefulWidget {
  _LoginUiMixinState createState() => _LoginUiMixinState();
}

class _LoginUiMixinState extends State<LoginUiMixin> with ValidationMixin {
  final frmKey = GlobalKey<FormState>();

  String email;
  String pw;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: frmKey,
        child: Column(
          children: <Widget>[
            emailField(),
            pwField(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: 'you@mail.com',
      ),
      validator: (v) => validEmail(v),
      onSaved: (v) {
        this.email = v;
      },
    );
  }

  Widget pwField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
      ),
      validator: (v) => validPw(v),
    );
  }

  Widget submitButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        child: Text("Submit!"),
        onPressed: () {
          if (frmKey.currentState.validate()) {
            frmKey.currentState.save();
          }
        },
      ),
    );
  }
}
