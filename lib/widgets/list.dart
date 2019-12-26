import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
	final List<Transaction> transactions;	
	TransactionList({this.transactions});
	
  	@override
  	Widget build(BuildContext context) {
    	return Flexible(
			fit: FlexFit.tight,
			child: Container(													    	  	
				child: this.transactions.length == 0 ?
				Column(children: <Widget>[
					Text('No transaction found!'),
					Container(
						height: 200,
						child: Image.asset('assets/images/no-image.png', fit: BoxFit.cover)
					)
				])
				: ListView(			
				children: transactions.map((t) {
					return Card(
						elevation: 0,
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
												fontSize: 18, 
												fontWeight: FontWeight.bold
											)
										),
										Container(											
											child: FittedBox(
												fit: BoxFit.cover,										
												child: Text(
													DateFormat('yyyy.MM.dd HH:mm').format(t.date),
													style: TextStyle(
														color: Colors.grey
													),													
												),
											),
										)										
									],
								)
							],
			));
				}).toList(),
			),    	  	
    	  ),
    	);
  	}
}
