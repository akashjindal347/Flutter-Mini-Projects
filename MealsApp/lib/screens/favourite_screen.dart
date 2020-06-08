import 'package:MealsApp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {

  static final routeName = '/favourites';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: MainDrawer(),
      body: Center(child: Text("favourites"),));
  }
}