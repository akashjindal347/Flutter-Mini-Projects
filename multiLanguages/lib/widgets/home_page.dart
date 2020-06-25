import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multiLanguages/localization/demo_localization.dart';
import 'package:multiLanguages/main.dart';
import 'package:multiLanguages/models/language.dart';
import 'package:multiLanguages/widgets/AppDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _changeLanguage(Language language) {
    Locale _temp;
    switch (language.languageCode) {
      case "en":
        _temp = Locale(language.languageCode, "US");
        break;
      case "hi":
        _temp = Locale(language.languageCode, "IN");
        break;
      case "fa":
        _temp = Locale(language.languageCode, "IR");
        break;
      case "ar":
        _temp = Locale(language.languageCode, "SA");
        break;
      default:
        _temp = Locale(language.languageCode, "US");
    }
    MyApp.setLocale(context, _temp);
    print(language.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title:
            Text(DemoLocalization.of(context).getTranslatedValues('home_page')),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DemoLocalization.of(context)
                  .getTranslatedValues('personal_information'),
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Text('English Hindi Arabic Persian'),
          ],
        ),
      ),
    );
  }
}
