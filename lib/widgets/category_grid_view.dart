import 'package:flutter/material.dart';
import 'package:meal_app/screens/meals_screens.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView(
      {super.key, required this.category, required this.availableMeals});

  final Category category;
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    ///inkWell widget
    return InkWell(
      onTap: () {
        final List<Meal> filteredMeals = availableMeals
            .where((e) => e.categories.contains(category.id))
            .toList(); //List of meals with same category
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MealsScreens(
                  title: category.title,
                  meals: filteredMeals,
                )));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              colors: [category.color, category.color.withOpacity(0.1)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        padding: const EdgeInsets.all(10),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
