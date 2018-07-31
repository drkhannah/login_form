import 'package:flutter/material.dart';
import 'package:login_form/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String emailFieldValue = '';
  String passwordFieldValue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.00),
      child: Form(
        // Form is a StatefulWidget
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.00)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      onSaved: (String value) => this.emailFieldValue = value,
      validator: validateEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (String value) => this.passwordFieldValue = value,
      validator: validatePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter Password',
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.greenAccent,
      child: Text('Login'),
      onPressed: () => submitForm(),
    );
  }

  void submitForm() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(
          'Ready to pass Email:${this.emailFieldValue} and Password:${this.passwordFieldValue} to an api');
    }
  }
}
