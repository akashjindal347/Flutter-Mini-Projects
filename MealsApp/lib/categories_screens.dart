import 'package:MealsApp/category_item.dart';
import 'package:MealsApp/dummy-data.dart';
import 'package:flutter/material.dart';

class CategoryScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Meals App"),),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: <Widget>[
          ...DUMMY_CATEGORIES
              .map((catData) => CategoryItem(catData.id,catData.title, catData.color))
              .toList(),
        ],
      ),
    );
  }
}
