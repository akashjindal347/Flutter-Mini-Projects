import 'package:flutter/material.dart';
import 'package:testApp/widgets/user_transactions.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
 
  List<Transaction> userTransactions;
 
 TransactionList(this.userTransactions);
//  print(userTransactions);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 400,
      child: ListView.builder(
            itemBuilder: (ctx,index){
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text(
                        ' \$${userTransactions[index].amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2)),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            userTransactions[index].title,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                          Text(
                            DateFormat.yMMMMd("en_US").format(userTransactions[index].date),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: userTransactions.length,
          ),
    );
  }
}
