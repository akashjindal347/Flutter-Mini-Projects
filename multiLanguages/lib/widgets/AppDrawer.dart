import 'package:flutter/material.dart';
import 'package:multiLanguages/routes/route_names.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(title: Text('Multi Languages App')),
        body: Container(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(homeRoute);
                },
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text('About'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(aboutRoute);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(settingsRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
