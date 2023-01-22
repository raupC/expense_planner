// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'transaccion.dart';

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

  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'Buy soes', amount: 69.9, date: DateTime.now()),
    Transaction(id: 't2', title: 'Buy short', amount: 6.9, date: DateTime.now()),
    Transaction(id: 't3', title: 'Buy blanket', amount: 9.9, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'Buy chess', amount: 63.9, date: DateTime.now()),
    Transaction(
        id: 't5', title: 'Buy table', amount: 34.9, date: DateTime.now()),
    Transaction(id: 't6', title: 'Buy noora', amount: 66.9, date: DateTime.now())
  ];

  final String title;

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
            width: double.infinity,
            child: Card(
                color: Colors.blue,
                // ignore: sized_box_for_whitespace
                child: Text(
                  "CHART---------",
                  textAlign: TextAlign.center,
                )),
          ),
          Column( 
              children: transactions.map(((tx) {
            return Card(
              child: Row(
                children: <Widget>[
                 
                    Expanded(child:  Container(
                    child: Text(tx.getString(), softWrap: true,),
                    
                    ),)
                ],
                
              ),
              
            );
          })).toList()),
        ],
      ),
    );
  }
}
