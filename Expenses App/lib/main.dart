import 'package:flutter/material.dart';
import 'package:testApp/widgets/new_transaction.dart';
import 'package:testApp/widgets/transaction_list.dart';
import 'package:testApp/widgets/user_transactions.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  void _startAddTransaction(BuildContext ctx)
  {
    showModalBottomSheet(context: ctx, 
    builder: (_) {
      return NewTransaction(addTransaction);

    },);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Quicksand',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expenses App", style: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold),),
          // backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add), onPressed: ()=>_startAddTransaction(context))
          ],
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
                TransactionList(userTransactions),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(builder: (context){ 
          return FloatingActionButton(onPressed: ()=>_startAddTransaction(context), child: Icon(Icons.add),);
        }
        ),
      ),
    );
  }
}
