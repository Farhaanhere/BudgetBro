import 'package:flutter/material.dart';
import 'package:managment/Screens/addtransactionpage.dart';
import 'package:managment/Screens/budget_box.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  late double budgetLimit;
  late double remainingBudget;
  late Color remainingBudgetColor;

  @override
  void initState() {
    super.initState();
    _loadBudgetData();
  }

  Future<void> _loadBudgetData() async {
    await BudgetBox.init();
    setState(() {
      budgetLimit = BudgetBox.getBudgetLimit();
      remainingBudget = BudgetBox.getRemainingBudget();
      remainingBudgetColor = remainingBudget >= 0
          ? Colors.green
          : Colors.red; // Set the initial color based on the remaining budget
    });
  }

  void updateBudget(double amount) {
    setState(() {
      remainingBudget -= amount;
      BudgetBox.setRemainingBudget(remainingBudget);
      remainingBudgetColor = remainingBudget >= 0
          ? Colors.green
          : Colors.red; // Update the color based on the remaining budget
    });
  }

  void _setBudgetLimit() async {
    double newBudgetLimit = BudgetBox.getBudgetLimit();

    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Set Budget Limit'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              newBudgetLimit = double.tryParse(value) ?? newBudgetLimit;
            },
            decoration: InputDecoration(labelText: 'Budget Limit'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                await BudgetBox.setBudgetLimit(newBudgetLimit);
                await BudgetBox.setRemainingBudget(
                    newBudgetLimit); // Set remaining budget to the new budget limit
                setState(() {
                  budgetLimit = newBudgetLimit;
                  remainingBudget =
                      newBudgetLimit; // Update the remaining budget value
                  remainingBudgetColor = remainingBudget >= 0
                      ? Colors.green
                      : Colors
                          .red; // Update the color based on the remaining budget
                });
                Navigator.pop(context); // Dismiss the dialog
              },
              child: Text('Set'),
            ),
          ],
        );
      },
    );

    if (result == null) {
      // Dialog was dismissed without setting the budget limit
      newBudgetLimit = BudgetBox.getBudgetLimit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
        backgroundColor: Color.fromARGB(255, 47, 125, 121),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Budget Limit: \$${budgetLimit.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Remaining Budget: \$${remainingBudget.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                color:
                    remainingBudgetColor, // Apply the color based on the remaining budget
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTransactionPage(
                          onTransactionAdded: updateBudget,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 47, 125, 121),
                  ),
                  child: Text('Add Transaction'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _setBudgetLimit,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 47, 125, 121),
                  ),
                  child: Text('Set Budget Limit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
