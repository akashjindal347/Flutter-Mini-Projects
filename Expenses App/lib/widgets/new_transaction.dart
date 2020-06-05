import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  DateTime _selectedDate;

  void submitData() {
    final _title = titleEditingController.text;
    final _amount = double.parse(amountEditingController.text);

    if (_title.isEmpty || _amount < 0 || _selectedDate == null) {
      return;
    }

    widget.addTransaction(_title, _amount.toString(),_selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountEditingController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                  ),
                ),
                FlatButton(
                  onPressed: _presentDate,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
            RaisedButton(
              onPressed: submitData,
              child: Text("Add Transaction"),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
