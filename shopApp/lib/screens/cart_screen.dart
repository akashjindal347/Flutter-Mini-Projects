import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/cart.dart';
import 'package:shopApp/widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Chip(
                    label: Text(
                      '\$${cart.totalPrice}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("ORDER NOW"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (ctx, index) => ci.CartItem(
                      cart.items.values.toList()[index].id,
                      cart.items.keys.toList()[index],
                      cart.items.values.toList()[index].title,
                      cart.items.values.toList()[index].price,
                      cart.items.values.toList()[index].quantity,
                    ),
                itemCount: cart.items.length),
          ),
        ],
      ),
    );
  }
}
