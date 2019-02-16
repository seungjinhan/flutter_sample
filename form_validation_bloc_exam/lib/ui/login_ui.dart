import 'package:flutter/material.dart';

class LoginUi extends StatefulWidget {
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
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
      validator: (v) {
        if (!v.contains('@')) {
          return 'wrong email type';
        } else {
          return null;
        }
      },
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
      validator: (v) {
        if (v.length < 4) {
          return 'over 4 char';
        } else {
          return null;
        }
      },
      onSaved: (v) {
        this.pw = v;
      },
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
