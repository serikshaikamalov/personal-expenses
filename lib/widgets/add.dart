import 'package:flutter/material.dart';

class TransactionAdd extends StatefulWidget {
	Function addTransaction;

	TransactionAdd(this.addTransaction);

  @override
  _TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
  	final titleController = new TextEditingController();

	final amountController = new TextEditingController();

	onSubmit(){		
		if(this.titleController.text.isEmpty || this.amountController.text.isEmpty){
			return;
		}

		this.widget.addTransaction(
			this.titleController.text, 
			double.parse(this.amountController.text)
		);

		// Close Modal window
		Navigator.of(context).pop();
	}

	@override
  	Widget build(BuildContext context) {
	    return Card(
			child: Column(
				children: <Widget>[
					TextField(
						controller: titleController, 
						decoration: InputDecoration(hintText: 'Enter title'),
						keyboardType: TextInputType.text),
					TextField(
						controller: amountController, 
						decoration: InputDecoration(hintText: 'Enter amount'),
						keyboardType: TextInputType.number,
						onSubmitted: (_) => onSubmit()
						),						
					Container(
						child: FlatButton(						
							child: Text('Add'),							
							onPressed: ()=>this.onSubmit()
						),					
						alignment: Alignment.topRight
					),					
				]
			)
		);
  	}
}
