import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
	final List<Transaction> transactions;	
	TransactionList({this.transactions});
	
  	@override
  	Widget build(BuildContext context) {
    	return Container(						
			height: 300,					    	  	
			child: ListView(			
				children: transactions.map((t) {
					return Card(
						child: Row(
						children: <Widget>[
							Container(
								margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
								padding: EdgeInsets.all(5),
								child: Text(
									t.amount.runtimeType == double ? '\$' + t.amount.toStringAsFixed(2) : 0,
									style: TextStyle(
										fontSize: 20,
										fontWeight: FontWeight.bold,
										color: Theme.of(context).primaryColor),
								),
								decoration: BoxDecoration(
									border: Border.all(
										width: 1, 
										color: Theme.of(context).primaryColor
									)
								)
							),
							Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: <Widget>[
								Text(
									t.title,
									style: TextStyle(
										fontSize: 18, fontWeight: FontWeight.bold),
								),
								Text(
									DateFormat().format(t.date),
									style: TextStyle(
										color: Colors.grey
									),
								)
								],
							)
						],
			));
				}).toList(),
			),    	  	
    	);
  	}
}
