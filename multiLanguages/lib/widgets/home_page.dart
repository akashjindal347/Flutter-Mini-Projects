import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multiLanguages/models/language.dart';
import 'package:multiLanguages/widgets/AppDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _changeLanguage(Language language) {
    print(language.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.languagesList()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          children: <Widget>[
                            Text(lang.flag),
                            SizedBox(
                              width: 5,
                            ),
                            Text(lang.name),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (language) {
                _changeLanguage(language);
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Text('English Hindi'),
      ),
    );
  }
}
