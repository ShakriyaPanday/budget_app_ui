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
                  height: 100.0,
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.deepPurple[300],
                );
              }),
              childCount: 10,
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
