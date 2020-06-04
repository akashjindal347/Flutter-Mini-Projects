import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({Key key}) : super(key: key);

  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleEditingController = TextEditingController();

  final amountEditingController = TextEditingController();

  void submitData(){

    final _title = titleEditingController.text;
    final _amount = double.parse(amountEditingController.text);

    if(_title.isEmpty || _amount <0)
    {
      return;
    }

    widget.addTransaction(_title,_amount.toString());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: titleEditingController,
              onSubmitted:(_)=>submitData,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountEditingController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted:(_)=>submitData,
            ),
            FlatButton(
              onPressed: submitData,
              child: Text("Add Transaction"),
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
