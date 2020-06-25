import 'package:flutter/material.dart';
import 'package:multiLanguages/routes/route_names.dart';
import 'package:multiLanguages/widgets/about_page.dart';
import 'package:multiLanguages/widgets/home_page.dart';
import 'package:multiLanguages/widgets/not_found_page.dart';
import 'package:multiLanguages/widgets/settings_page.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
