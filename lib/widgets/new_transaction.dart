import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

    NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = TextEditingController();

  final amountIput = TextEditingController();

  void sumbitData() {
    print(amountIput.text);
    print(titleInput.text);

    final enteredTitle = titleInput.text;
    final enteredAmount = double.parse(amountIput.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      print("enteredTitle.isEmpty || enteredAmount <= 0");
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              TextField(
                  decoration:
                      InputDecoration(labelText: "Name of the article, please"),
                  controller: titleInput,
                  keyboardType: TextInputType.text,
                  onSubmitted: (_) => (sumbitData())),
              TextField(
                decoration: InputDecoration(labelText: "Amount, please"),
                //onChanged: (value) => print(value),
                controller: amountIput,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => (sumbitData()),
              ),
              ElevatedButton(
                  onPressed: (() => sumbitData()),
                  child: Text("Add Product"),
                   style: ElevatedButton.styleFrom(
                    
                      backgroundColor: Theme.of(context).primaryColor
                      
                      )
                      ),
            ]),
      ),
    );
  }
}
