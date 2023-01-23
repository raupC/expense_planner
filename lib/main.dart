// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:expense_planner/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaccion.dart';
import 'package:intl/intl.dart';
import 'widgets/new_transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpPlan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Expense Planner'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  final amountIput = TextEditingController();
  final titleInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            //width: double.infinity,
            child: Card(
                color: Colors.blue,
                // ignore: sized_box_for_whitespace
                child: Text(
                  "CHART",
                  textAlign: TextAlign.center,
                )),
          ),
          UserTransaction(),
          
        ],
      ),
    );
  }
}
