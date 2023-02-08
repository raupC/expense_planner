import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // const MyWidget({super.key});
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        // print('MaxHeight: ${constraint.maxHeight}');
        // print('viewInsets: ${MediaQuery.of(context).viewInsets.bottom}');

        return Column(
          children: <Widget>[
            Container(
                height: constraint.maxHeight * 0.15,
                child: FittedBox(
                    child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
            SizedBox(
              height: constraint.maxHeight * 0.05,
              //width: 10,
            ),
            Container(
              height: constraint.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 37, 52, 146),
                            width: 1.0),
                        color: Color.fromRGBO(222, 333, 111, 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            Container(
                height: constraint.maxHeight * 0.15,
                child: FittedBox(child: Text(label)))
          ],
        );
      },
    );
  }
}
