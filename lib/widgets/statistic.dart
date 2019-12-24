import 'package:flutter/material.dart';

class StatisticWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.red,
      margin: EdgeInsets.all(20),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text('Dart',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Text(
                'Dart — язык программирования, созданный Google. Dart позиционируется в качестве замены/альтернативы JavaScript.',
                style: TextStyle(fontSize: 16, color: Colors.yellow),
              )
            ],
          ),
        ),
        color: Colors.green,
      ),
    );
  }
}
