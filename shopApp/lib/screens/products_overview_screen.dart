import 'package:flutter/material.dart';
import 'package:shopApp/widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: ProductGrid(),
    );
  }
}
