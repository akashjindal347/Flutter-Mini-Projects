import 'package:flutter/material.dart';
import 'package:testApp/widgets/new_transaction.dart';
import 'package:testApp/widgets/transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

   final List<Transaction> userTransactions = [
    Transaction(
        id: 't1', title: "New shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: "New shirt", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't3', title: "New jeans", amount: 69.99, date: DateTime.now()),
  ];

  void addTransaction(String txtitle,String txamount)
  {
    final amount = double.parse(txamount); 
    final newTx = Transaction(id: DateTime.now().toString(), title: txtitle, amount: amount, date: DateTime.now());

    setState(() {
      userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addTransaction),
        TransactionList(userTransactions)
      ],
    );
  }
}