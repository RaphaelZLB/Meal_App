import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_grid_view.dart';
import 'package:meal_app/data/dummy_data.dart';

import '../models/meal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        lowerBound: 0,
        upperBound: 1);

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //grid in one line
            mainAxisSpacing: 20, //row space
            crossAxisSpacing: 20, //column space
            childAspectRatio: 3 / 2, //crossAxis/mainAxis
          ),

          ///loop the items title
          children: [
            for (final category in availableCategories)
              CategoryGridView(
                category: category,
                availableMeals: widget.availableMeals,
              ),
          ],
        ),
        builder: (ctx, child) => SlideTransition(
                position: Tween<Offset>(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(
                    parent: _controller, curve: Curves.easeInOutExpo))));
  }
}
