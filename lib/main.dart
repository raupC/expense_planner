// ignore_for_file: sort_child_properties_last, prefer_const_constructors, deprecated_member_use, duplicate_ignore

import 'package:expense_planner/widgets/transaction_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/transaccion.dart';
import 'package:intl/intl.dart';
import 'widgets/new_transaction.dart';
import 'widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //  SystemChrome.setPreferredOrientations(
  //      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
      title: 'NOORA',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Color.fromARGB(255, 106, 205, 68),
        fontFamily: 'Quicksand',
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber)),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(title: 'Explan '),
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
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  final List<Transaction> _userTransaction = [
    //  Transaction(
    //      id: 't1', title: 'New shoes', amount: 69.9, date: DateTime.now()),
    //  Transaction(
    //      id: 't2', title: 'Buy short', amount: 6.9, date: DateTime.now()),
    //  Transaction(
    // id: 't3', title: 'Buy blanket', amount: 9.9, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  bool _showChart = false;
  // List<Transaction> get _recentTransactions {
  //   return _userTransaction.where((tx) {
  //     return tx.date.isAfter(
  //       DateTime.now().subtract(
  //         Duration(days: 7),
  //       ),
  //     );
  //   }).toList();
  // }

  void _addNewTransaction(String title, double amoun, DateTime datechoosen) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amoun,
        date: datechoosen);
    setState(() {
      _userTransaction.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    //print("isLandscape: $isLandscape");
    final appBar = AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
            onPressed: (() => _startAddNewTransaction(context)),
            icon: Icon(Icons.add))
      ],
    );
    final txTransaction = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.7,
        child: TransactionList(_userTransaction, _deleteTransaction));
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Show Chart"),
                  Switch(
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    },
                  )
                ],
              ),

            if (!isLandscape)
              Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.3,
                  child: Chart(_userTransaction)),
            if (!isLandscape) txTransaction,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: Chart(_userTransaction))
                  : txTransaction
            //NewTransaction(_addNewTransaction),
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
