import 'package:expense_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/models/expense_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(
          expenses[index],
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
      itemCount: expenses.length,
    );
  }
}
