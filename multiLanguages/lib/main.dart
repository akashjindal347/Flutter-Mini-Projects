import 'package:flutter/material.dart';
import 'package:multiLanguages/routes/custom_router.dart';
import 'package:multiLanguages/routes/route_names.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: homeRoute,
      onGenerateRoute: CustomRouter.allRoutes,
    );
  }
}
