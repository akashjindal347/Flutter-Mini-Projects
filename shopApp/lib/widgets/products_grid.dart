import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/product_provider.dart';
import 'package:shopApp/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, index) {
        return ProductItem(products[index]);
      },
      itemCount: products.length,
    );
  }
}
