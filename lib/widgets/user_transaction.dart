import 'package:flutter/material.dart';

import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import '../models/transaccion.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'Buy soes', amount: 69.9, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Buy short', amount: 6.9, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Buy blanket', amount: 9.9, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amoun) {
    setState(() {
      final newTransaction = new Transaction(
          id: "asd", title: title, amount: amoun, date: DateTime.now());

          _userTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(_addNewTransaction), TransactionList(_userTransaction)],
    );
  }
}
