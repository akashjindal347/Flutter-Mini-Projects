import 'package:flutter/material.dart';
import 'package:multiLanguages/widgets/AppDrawer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('About Page'),
      ),
    );
  }
}
