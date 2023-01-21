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
      home:  MyHomePage(title: 'Expense Planner'),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key, required this.title});
  
  final List<Transaction> trasacctions = [];

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
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.red,
              child: Text("List of TX: "),
              elevation: 5,
            ),
          )
        ],
      ),
    );
  }
}
