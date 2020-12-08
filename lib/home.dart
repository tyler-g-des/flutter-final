import 'package:flutter/material.dart';
import 'package:travelapp/map.dart';
import 'i.dart';

class HomeAppPage extends StatefulWidget {
  _Home createState() => _Home();
}

class _Home extends State<HomeAppPage> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/HomeHistory');
                },
                child: Text(
                  'ADD',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.flash_on),
                  text: 'HISTORY',
                ),
                Tab(
                  icon: Icon(Icons.sync),
                  text: 'MAP',
                ),
                Tab(
                  icon: Icon(Icons.storage),
                  text: 'PROFILE',
                ),
              ],
            ),
            title: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                '←',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
          ),
          body: TabBarView(
            children: [I(), MapAppPage(), MapAppPage()],
          ),
        ),
      ),
    );
  }
}
