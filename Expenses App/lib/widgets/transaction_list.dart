import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList(this.userTransactions, this.deleteTransaction);
//  print(userTransactions);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? Container(
          margin: EdgeInsets.symmetric(vertical:10),
          child: Center(
              
              child: Text(
                "No Transactions",
                // textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight:FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
        )
        : Container(
            height: 550,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child:
                                  Text('\$${userTransactions[index].amount}'))),
                    ),
                    title: Text(
                      userTransactions[index].title,
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      DateFormat.yMd().format(userTransactions[index].date),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            {deleteTransaction(userTransactions[index].id)}),
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
          );
  }
}
