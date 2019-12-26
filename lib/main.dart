import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import './widgets/statistic.dart';
import './widgets/add.dart';
import './widgets/list.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  	@override
  	Widget build(BuildContext context) {
	    return MaterialApp(
			title: 'Personal expenses app', 
			home: HomePage(),
			theme: ThemeData(
				primarySwatch: Colors.green,
				fontFamily: 'OpenSans',
				textTheme: TextTheme(
					body1: TextStyle(fontSize: 18)
				)
			),						
		);
  	}
}

class HomePage extends StatefulWidget {
	@override
  	State<StatefulWidget> createState() {
		return  HomePageState();
  	}	
}

class HomePageState extends State{
	final List<Transaction> transactions = [
		new Transaction(
			id: '1', title: 'Lanch', amount: 400, date: DateTime.now()),
		new Transaction(
			id: '2', title: 'Transport', amount: 700, date: DateTime.now()),
		new Transaction(
			id: '3', title: 'Transport', amount: 700, date: DateTime.now()),
		new Transaction(
			id: '4', title: 'Transport', amount: 700, date: DateTime.now()),
		new Transaction(
			id: '5', title: 'Transport', amount: 700, date: DateTime.now()),
		new Transaction(
			id: '6', title: 'Transport', amount: 700, date: DateTime.now()),
		new Transaction(
			id: '3', title: 'Transport', amount: 700, date: DateTime.now()),
		new Transaction(
			id: '4', title: 'Transport', amount: 700, date: DateTime.now()),
		new Transaction(
			id: '5', title: 'Transport', amount: 700, date: DateTime.now()),
		new Transaction(
			id: '6', title: 'Transport', amount: 700, date: DateTime.now())
	];

	addTransaction(String title, double amount, DateTime dt){
		
		Transaction nt = Transaction(
			id: DateTime.now().toString(), 
			title: title, 
			date: dt,
			amount: amount
		);

		setState(() {			
			transactions.add(nt);		  	
		});
	}

	void showModal(BuildContext ctx){
		showModalBottomSheet(context: ctx, builder: (bCtx){
			return GestureDetector(
				child: TransactionAdd(addTransaction),
				behavior: HitTestBehavior.opaque,
				onTap: (){},
			);
		});
	}	

  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
      		appBar: AppBar(				  
				  title: Text('Personal expenses app'),
				  actions: <Widget>[
					  IconButton(icon: Icon(Icons.add), onPressed: () => showModal(context))
				  ],
			),
      		body: Container(				
      		  	child: Column(				  
					mainAxisSize: MainAxisSize.min,  				
					crossAxisAlignment: CrossAxisAlignment.stretch,
        			children: <Widget>[						
						// StatisticWidget(), 
						// TransactionAdd(this.addTransaction),
						TransactionList(transactions: this.transactions)
					],
      		  	),
      		),
			floatingActionButton: FloatingActionButton(				
				child: Icon(Icons.add), 
				onPressed: ()=>showModal(context),
			),
			floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    	);
  	}
}
