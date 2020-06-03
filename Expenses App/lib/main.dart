import 'package:flutter/material.dart';
import 'package:testApp/widgets/new_transaction.dart';
import 'package:testApp/widgets/transaction_list.dart';
import 'package:testApp/widgets/user_transactions.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expenses App"),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
                  child: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Card(
                  child: Container(child: Text("Chart")),
                  elevation: 5,
                ),
                UserTransactions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
