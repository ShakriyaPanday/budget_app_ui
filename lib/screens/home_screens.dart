import 'package:budget_app_ui/data/data.dart';
import 'package:budget_app_ui/widgets/bar_char.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                return Container(
                  height: 300.0,
                  margin: const EdgeInsets.all(20.0),
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
              }),
              childCount: 1,
            ),
          ),
          const SliverFillRemaining(
            child: Center(child: Text("Budget app")),
          )
        ],
      ),
    );
  }
}
