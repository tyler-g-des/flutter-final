import 'package:flutter/material.dart';
import 'package:travelapp/history.dart';
import 'package:travelapp/home.dart';
import 'CuerpoAppPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/HomeAppPage': (context) => HomeAppPage(),
        '/HomeHistory': (context) => HomeHistory(),
      },
      home: SafeArea(
        top: true,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Travel App'),
          ),
          body: CuerpoAppPage(),
        ),
      ),
    );
  }
}
