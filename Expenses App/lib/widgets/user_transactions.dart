import 'package:flutter/material.dart';
import 'package:testApp/widgets/new_transaction.dart';
import 'package:testApp/widgets/transaction_list.dart';
import '../models/transaction.dart';



class UserTransactions extends StatelessWidget {
  
   final List<Transaction> userTransactions;

   UserTransactions(this.userTransactions);   

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(userTransactions)
      ],
    );
  }
}