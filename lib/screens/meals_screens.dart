import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detailed_screen.dart';
import 'package:meal_app/widgets/meal_grid_view.dart';
import '../models/meal.dart';

class MealsScreens extends StatelessWidget {
  const MealsScreens({super.key, this.title, required this.meals});

  final String? title; //title of the cat selected
  final List<Meal> meals; //List of items with same cat

  @override
  Widget build(BuildContext context) {
    return title == null ?
    Text('No favourites items')
        :
    Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(title!),
            ),

            ///loop the items
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map((meal) => MealGridView(
                  meal: meal,
                  onSelectedMeal: (Meal meal) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => MealDetailedScreen(
                                  meal: meal,
                                  onToggleFavourite: (Meal meal) {},
                                )));
                  },
                ))
            .toList(), //takes the Grid + meal = Photo(mealGridItem)
      ),
    );
  }
}
