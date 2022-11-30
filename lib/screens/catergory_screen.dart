import 'package:budget_app_ui/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
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
            ),
          )
        ],
      ),
    );
  }
}
