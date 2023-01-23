import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaccion.dart';
import 'new_transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.green,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    transactions[index].toString(),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(DateFormat().format(transactions[index].date)),
                  ],
                ),
              ],
            ),
          );
          ;
        },
        itemCount: transactions.length, //limite de elementos que queremos rederizar, sino sale error ya que hay elementos infinitos
      ),
    );
  }
}
