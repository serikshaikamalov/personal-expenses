import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionAdd extends StatefulWidget {
	Function addTransaction;
	TransactionAdd(this.addTransaction);

	@override
	_TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
	final titleController = new TextEditingController();
	final amountController = new TextEditingController();
	DateTime selectedDate;

  	openDatePicker() {
		return showDatePicker(
			context: context,
			initialDate: DateTime.now(),
			firstDate: DateTime(2019),
			lastDate: DateTime.now()
		).then((val) {
			if (val != null) {	
				print('Value: ' + val.toString());			  
				setState(() {
					selectedDate = val;
				});
			}
		});
	}

  	onSubmit() {
		if (this.titleController.text.isEmpty || this.amountController.text.isEmpty || this.selectedDate == null) {
			return;
		}

		this.widget.addTransaction(
			this.titleController.text, 
			double.parse(this.amountController.text),
			this.selectedDate
		);

		// Close Modal window
		Navigator.of(context).pop();
  	}

  	@override
  	Widget build(BuildContext context) {
		print('Add build');

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
						onSubmitted: (_) => onSubmit()),
					Container(
						child: Row(
							children: <Widget>[
								Text(
									this.selectedDate.runtimeType == DateTime ? DateFormat.yMd().format(this.selectedDate) : 'Selected date',
									style: TextStyle(fontSize: 16)
								),
								Container(
									margin: EdgeInsets.symmetric(horizontal: 10),
									child: RaisedButton(
										child: Text('Select Date'),
										onPressed: () => openDatePicker(),
									),
								)
							],
						),
					),
					Container(
						alignment: Alignment.topRight,
						child:
							FlatButton(
								child: Text('Add'), 
								onPressed: () => this.onSubmit()
							)
					)
				]
			)
		);
	}
}
