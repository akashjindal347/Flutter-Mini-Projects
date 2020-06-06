import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testApp/widgets/chart.dart';
import 'package:testApp/widgets/new_transaction.dart';
import 'package:testApp/widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);
  runApp(HomePage());
}
class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Quicksand',
      ),
      home: MyApp(),

    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> userTransactions = [
    // Transaction(
    //     id: 't1', title: "New shoes", amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: "New shirt", amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: 't3', title: "New jeans", amount: 69.99, date: DateTime.now()),
  ];

  List<Transaction> get recentTransactions {
    return userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addTransaction(String txtitle, String txamount, DateTime date) {
    final amount = double.parse(txamount);
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: amount,
        date: date);

    setState(() {
      userTransactions.add(newTx);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPotrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final appBar = AppBar(
      title: Text(
        "Expenses App",
        style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
      ),
      // backgroundColor: Colors.red,
      actions: <Widget>[
        Builder(builder: (context) {
          return IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddTransaction(context));
        })
      ],
    );
    return  Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Builder(builder: (context) {
            return Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                isPotrait ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.25,
                      child: Chart(recentTransactions)):Container(),
                  Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.65,
                      child:
                          TransactionList(userTransactions, deleteTransaction)),
                ],
              ),
            );
          }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () => _startAddTransaction(context),
            child: Icon(Icons.add),
          );
        }),
      
    );
  }
}


