import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransaction;

  TransactionList(this._userTransactions, this._deleteTransaction);
//  print(userTransactions);

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
                "No Transactions",
                // textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              
            ),
          )
        :  ListView.builder(
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                                child: Text(
                                    '\$${_userTransactions[index].amount}'))),
                      ),
                      title: Text(
                        _userTransactions[index].title,
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        DateFormat.yMd().format(_userTransactions[index].date),
                      ),
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () =>
                              {_deleteTransaction(_userTransactions[index].id)}),
                    ),
                  ),
                );
              },
              itemCount: _userTransactions.length,
            
          );
  }
}
