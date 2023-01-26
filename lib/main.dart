// ignore_for_file: sort_child_properties_last, prefer_const_constructors, deprecated_member_use, duplicate_ignore

import 'package:expense_planner/widgets/transaction_list.dart';

import 'package:flutter/material.dart';
import 'models/transaccion.dart';
import 'package:intl/intl.dart';
import 'widgets/new_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final titleStyle = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 20,
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpPlan',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,   
                  ),

                  )
          
          ),
      home: MyHomePage(title: 'Personal Expenses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child:  NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  final List<Transaction> _userTransaction = [
    
    // Transaction(
    //     id: 't1', title: 'New shoes', amount: 69.9, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'Buy short', amount: 6.9, date: DateTime.now()),
    // Transaction(
    //     id: 't3', title: 'Buy blanket', amount: 9.9, date: DateTime.now()),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              onPressed: (() => _startAddNewTransaction(context)),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              //width: double.infinity,
              child: Card(
                  color: Theme.of(context).primaryColor,
                  // ignore: sized_box_for_whitespace
                  child: Text(
                    "CHART",
                    textAlign: TextAlign.center,
                  )),
            ),
            //NewTransaction(_addNewTransaction),
            TransactionList(_userTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (() {
          _startAddNewTransaction(context);
        }),
      ),
    );
  }
}
