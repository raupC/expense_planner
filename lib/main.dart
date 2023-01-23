// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'models/transaccion.dart';
import 'package:intl/intl.dart';

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
    Transaction(
        id: 't2', title: 'Buy short', amount: 6.9, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Buy blanket', amount: 9.9, date: DateTime.now()),
  ];

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
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    TextField(
                        decoration: InputDecoration(
                            labelText: "Name of the article, please"),
                        controller: titleInput),
                    TextField(
                      decoration: InputDecoration(labelText: "Amount, please"),
                      //onChanged: (value) => print(value),
                      controller: amountIput,
                    ),
                    ElevatedButton(
                        onPressed: (() {
                          print(amountIput.text);
                          print(titleInput.text);
                        }),
                        child: Text("Add Product"),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 4, 3, 3),
                            backgroundColor:
                                Color.fromARGB(255, 38, 176, 186))),
                  ]),
            ),
          ),
          
        ],
      ),
    );
  }
}
