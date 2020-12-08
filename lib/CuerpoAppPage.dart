import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

class CuerpoAppPage extends StatefulWidget {
  _CuerpoApp createState() => _CuerpoApp();
}

class _CuerpoApp extends State<CuerpoAppPage> {
  final formKey = GlobalKey<FormState>();
  String usuario = '';
  String clave = '';
  int campos = 0;

  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.symmetric(vertical: 64.0)),
              userFields(),
              claveFields(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: sumitButton(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget userFields() {
    return TextFormField(
      style: TextStyle(color: Colors.black.withOpacity(0.6)),
      keyboardType: TextInputType.text,
      validator: validateEmail,
      decoration: InputDecoration(hintText: 'user@email.com'),
      onSaved: (value) {
        usuario = value;
      },
    );
  }

  Widget claveFields() {
    return TextFormField(
      style: TextStyle(color: Colors.black.withOpacity(0.6)),
      keyboardType: TextInputType.text,
      validator: validateEmail,
      obscureText: true,
      decoration: InputDecoration(hintText: 'Your Password'),
      onSaved: (value) {
        clave = value;
      },
    );
  }

  Widget sumitButton() {
    return FlatButton(
      color: Colors.blue[900],
      child: Text(
        'Log in',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          setState(() {
            formKey.currentState.save();
          });
          print('The email is $usuario and the password is $clave');
        }
        if (campos == 2) {
          Navigator.pushNamed(context, '/HomeAppPage');
          campos = 0;
        } else {
          AlertDialog(
            title: Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Error'),
                  Text('Debes llenar los campos'),
                ],
              ),
            ),
          );
          campos = 0;
        }
      },
    );
  }

  String validateEmail(value) {
    if (value == '' || value == null) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "Please enter a valid Email and Password",
      );
    } else {
      campos = campos + 1;
    }
  }

  String validatePassword(value) {
    if (value == '' || value == null) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "Please enter a valid Email and Password",
      );
    } else {
      campos = campos + 1;
    }
  }
}
