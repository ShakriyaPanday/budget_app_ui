import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;

  const BarChart({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    for (var price in expenses) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    }
    return Column(
      children: [
        const Text(
          "Weekly Spending",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: (() {}),
              icon: const Icon(Icons.arrow_back),
              iconSize: 30.0,
            ),
            const Text(
              "Nov 24 2022 - Nov 30 2022",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: (() {}),
              icon: const Icon(Icons.arrow_forward),
              iconSize: 30.0,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Bar(
              label: 'Sun',
              amountSpent: expenses[0],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Mon',
              amountSpent: expenses[1],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Tue',
              amountSpent: expenses[2],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Wed',
              amountSpent: expenses[3],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Thu',
              amountSpent: expenses[4],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Fri',
              amountSpent: expenses[5],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Sat',
              amountSpent: expenses[6],
              mostExpensive: mostExpensive,
            ),
          ],
        )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;
  final double _maxbarHeight = 150;

  const Bar(
      {super.key,
      required this.label,
      required this.amountSpent,
      required this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxbarHeight;
    return Column(
      children: [
        Text(
          "\$${amountSpent.toStringAsFixed(2)}",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
