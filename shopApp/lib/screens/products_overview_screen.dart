import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/cart.dart';
import 'package:shopApp/screens/cart_screen.dart';
import 'package:shopApp/widgets/appDrawer.dart';
import 'package:shopApp/widgets/badge.dart';
import 'package:shopApp/widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: appDrawer(),
      appBar: AppBar(
        title: Text("Products"),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, __) => Badge(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
              value: cart.itemCount.toString(),
            ),
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
