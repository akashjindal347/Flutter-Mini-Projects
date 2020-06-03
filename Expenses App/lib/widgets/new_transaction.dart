import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const NewTransaction({Key key}) : super(key: key);

  final titleEditingController = TextEditingController();
  final amountEditingController = TextEditingController();
  final Function addTransaction;
  NewTransaction(this.addTransaction);

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
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountEditingController,
            ),
            FlatButton(
              onPressed: ()=>{addTransaction(titleEditingController.text,amountEditingController.text)},
              child: Text("Add Transaction"),
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
