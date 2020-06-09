import 'package:flutter/material.dart';
import 'package:shopApp/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  ProductDetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Center(
        child: Text("Detail"),
      ),
    );
  }
}
