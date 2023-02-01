import 'package:flutter/material.dart';
import '../models/transaccion.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>>? get groupedTransactionValues {
    return List.generate(1000, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      print({index.toString()});
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      print(weekDay);
      print(DateFormat.E().format(weekDay));
      print('total: $totalSum');

/**
 * Suvstring devulve el intervalo de caracteres indicado
 */
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues!.fold(0.0, (sum, item) {
      //print('$totalSpending totalasdasdaskljdasiljdioasdhauiosdhui');
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Total groupedTransactionValues: $groupedTransactionValues');
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues!.map((data) {
          return Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: ChartBar(
                data['day'] as String,
                data['amount'] as double,
                totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending),
          );
        }).toList()),
      ),
    );
  }
}
