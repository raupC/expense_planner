import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaccion.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraint) {
          return Column(
            children: <Widget>[
              Text(
                "No transactions added yet!",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Container(
                height: constraint.maxHeight * 0.6,
                child: Image.asset(
                  'assets/image/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          );
        },) 
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Color.fromARGB(255, 47, 150, 57),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '${transactions[index].amount.toString()}€',
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transactions[index].title,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(DateFormat()
                            .add_yMd()
                            .format(transactions[index].date)),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () => deleteTx(transactions[index].id),
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                    )
                  ],
                ),
              );
              ;
            },
            itemCount: transactions
                .length, //limite de elementos que queremos rederizar, sino sale error ya que hay elementos infinitos
          );
  }
}
