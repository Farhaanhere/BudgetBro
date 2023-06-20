import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  final void Function(double) onTransactionAdded;

  const AddTransactionPage({Key? key, required this.onTransactionAdded})
      : super(key: key);

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  double transactionAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
        backgroundColor: Color.fromARGB(255, 47, 125, 121),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  transactionAmount = double.tryParse(value) ?? 0.0;
                });
              },
              decoration: InputDecoration(labelText: 'Transaction Amount'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.onTransactionAdded(transactionAmount);
                Navigator.pop(context); // Return to the previous screen
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 47, 125, 121),
              ),
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
