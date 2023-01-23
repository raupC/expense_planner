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
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: this.transactions.map(((tx) {
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
                      tx.amount.toString(),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.title,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(DateFormat().format(tx.date)),
                    ],
                  ),
                ],
              ),
            );
          })).toList()),
    );
  }
}
