import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopApp/providers/orders.dart';

class Orderitem extends StatelessWidget {
  final OrderItem order;

  Orderitem(this.order);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('\$${order.amount}'),
              subtitle: Text(DateFormat('dd MM yyyy').format(order.dateTime)),
              trailing:
                  IconButton(icon: Icon(Icons.expand_more), onPressed: null),
            ),
          ],
        ),
      ),
    );
  }
}