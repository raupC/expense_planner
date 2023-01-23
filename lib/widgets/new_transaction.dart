import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';



class NewTransaction extends StatelessWidget {
  final titleInput = TextEditingController();
  final amountIput = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Card(
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
          );
  }
}