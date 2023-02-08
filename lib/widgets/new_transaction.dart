import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = TextEditingController();
  final amountIput = TextEditingController();
  DateTime? _selectedDate;

  void _sumbitData() {
    // print(amountIput.text);
    // print(titleInput.text);

    final _enteredTitle = titleInput.text;
    final _enteredAmount = double.parse(amountIput.text);

    if (_enteredTitle.isEmpty || _enteredAmount <= 0 || _selectedDate == null) {
      //print("enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null");
      return;
    }

    widget.addTx(_enteredTitle, _enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        //print("null null null %%%%%%%%%%%%%%%9023408934032840257807");
        return;
      }

      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom+10,
            left: 10,
            right: 10
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                TextField(
                    decoration:
                        InputDecoration(labelText: "Name of the article, please"),
                    controller: titleInput,
                    keyboardType: TextInputType.text,
                    onSubmitted: (_) => (_sumbitData())),
                TextField(
                  decoration: InputDecoration(labelText: "Amount, please"),
                  // onChanged: (_) {
                  //   print('Insets2: ${MediaQuery.of(context).viewInsets}');
                  // } ,
                  controller: amountIput,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => (_sumbitData()),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(_selectedDate == null
                            ? "No date Chosen!"
                            : DateFormat.yMd().format(_selectedDate!)),
                      ),
                      TextButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color.fromARGB(222, 210, 73, 73))),
                          onPressed: _presentDatePicker,
                          child: Text(
                            "Choose Date",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _sumbitData(),
                  child: Text("Add Product"),
                  // style: ElevatedButton.styleFrom(
                  //     backgroundColor: Theme.of(context).primaryColor)
                ),
              ]),
        ),
      ),
    );
  }
}
