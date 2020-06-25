import 'package:flutter/material.dart';
import 'package:multiLanguages/localization/demo_localization.dart';
import 'package:multiLanguages/routes/custom_router.dart';
import 'package:multiLanguages/routes/route_names.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amberAccent,
        accentColor: Colors.black87,
      ),
      locale: _locale,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {
            return locale;
          }
        }
        return supportedLocales.first;
      },
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fa', 'IR'),
        Locale('ar', 'SA'),
        Locale('hi', 'IN'),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: homeRoute,
      onGenerateRoute: CustomRouter.allRoutes,
    );
  }
}
