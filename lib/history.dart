import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

class HomeHistory extends StatefulWidget {
  History createState() => History();
}

class History extends State<HomeHistory> {
  final formKey = GlobalKey<FormState>();
  static List<String> opiniones = ['prueba', 'prueba1'];

  List<String> getOpiniones() {
    return opiniones;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    formKey.currentState.save();
                  });
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    text: "Se agreego",
                  );
                  Navigator.pushNamed(context, '/HomeAppPage');
                },
                child: Text(
                  'SAVE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            title: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/HomeAppPage');
              },
              child: Text(
                '←',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
          ),
          body: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                opinionFields(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget opinionFields() {
    return TextFormField(
      style: TextStyle(color: Colors.black.withOpacity(0.6)),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(hintText: 'Write Your Experience'),
      onSaved: (value) {
        opiniones.add(value);
        AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Listo'),
                Text('Se agrego de manera satisfactoria'),
              ],
            ),
          ),
        );
      },
    );
  }
}
