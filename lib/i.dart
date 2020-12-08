import 'package:flutter/material.dart';
import 'package:travelapp/history.dart';

class I extends StatelessWidget {
  History hh = History();
  @override
  Widget build(BuildContext context) {
    List<String> opiniones = hh.getOpiniones();
    int cantidad = opiniones.length;
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Text(opiniones[0]),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cantidad,
                itemBuilder: (context, index) {
                  return Text(opiniones[index]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
