import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';

class Chart extends StatelessWidget {
	final List<Transaction> transactions;

	Chart(this.transactions);

	@override
  	Widget build(BuildContext context) {
		return Card(
			elevation: 5,
			margin: EdgeInsets.all(10),
			child: Text('Content'),
		);
  	}
}
