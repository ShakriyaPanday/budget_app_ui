import 'package:budget_app_ui/helpers/color_helper.dart';
import 'package:budget_app_ui/models/category_model.dart';
import 'package:budget_app_ui/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  _buildExpense() {
    List<Widget> expenseList = [];
    for (var expense in widget.category.expenses) {
      expenseList.add(Container(
        alignment: Alignment.center,
        height: 80.0,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              )
            ]),
        child: ListTile(
          leading: Text(
            expense.name,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            "-\$${expense.cost.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
        ),
      ));
    }
    return Column(
      children: expenseList,
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    widget.category.expenses.forEach(((Expense expense) {
      totalAmountSpent += expense.cost;
    }));
    final double totalAmountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = totalAmountLeft / widget.category.maxAmount;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.category.name),
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(
              Icons.add,
              size: 30.0,
              shadows: [BoxShadow()],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(20.0),
                height: 250.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      )
                    ]),
                child: CircularPercentIndicator(
                  animation: true,
                  animationDuration: 500,
                  radius: 100.0,
                  lineWidth: 15.0,
                  percent: percent,
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.grey[200]!,
                  progressColor: getColor(context, percent),
                  center: Text(
                    "\$${totalAmountLeft.toStringAsFixed(2)}/\$${widget.category.maxAmount.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              _buildExpense()
            ],
          )),
    );
  }
}
