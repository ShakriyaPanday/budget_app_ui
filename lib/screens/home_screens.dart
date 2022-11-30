import 'package:budget_app_ui/data/data.dart';
import 'package:budget_app_ui/helpers/color_helper.dart';
import 'package:budget_app_ui/models/category_model.dart';
import 'package:budget_app_ui/screens/catergory_screen.dart';
import 'package:budget_app_ui/widgets/bar_char.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildCategory(Category category, double totalAmountSpend) {
    return GestureDetector(
      onTap: (() => Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => CategoryScreen(category: category))))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: const EdgeInsets.all(20.0),
        height: 100.0,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1,
                  ),
                ),
                Text(
                  "\$${(category.maxAmount - totalAmountSpend).toStringAsFixed(2)} / \$${category.maxAmount.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.8,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double maxBarWidth = constraints.maxWidth;
                final double percent = (category.maxAmount - totalAmountSpend) /
                    category.maxAmount;
                double barWidth = maxBarWidth * percent;
                if (barWidth < 0) {
                  barWidth = 0;
                }
                return Stack(
                  children: [
                    Container(
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    Container(
                      height: 20.0,
                      width: barWidth,
                      decoration: BoxDecoration(
                          color: getColor(context, percent),
                          borderRadius: BorderRadius.circular(15.0)),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            expandedHeight: 100.0,
            leading: const Icon(Icons.settings),
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Simple Budget"),
            ),
            actions: [
              IconButton(
                  onPressed: (() {}),
                  icon: const Icon(
                    Icons.add,
                  ))
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              ((BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: BarChart(expenses: weeklySpending),
                  );
                } else {
                  final Category category = categories[index - 1];
                  double totalAmountSpend = 0;
                  for (var element in category.expenses) {
                    totalAmountSpend += element.cost;
                  }
                  return _buildCategory(category, totalAmountSpend);
                }
              }),
              childCount: 1 + categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
