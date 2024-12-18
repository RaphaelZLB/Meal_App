import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/meal_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          //initial values
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter,bool> chosenFilter) {
    state = chosenFilter;
  }
  void setFilter(Filter filter , bool isSelected) {
    state = { ...state , filter:isSelected};
  }
}

///control the state of filtersNotifier
final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(//<Class + Type of State>
        (ref) => FiltersNotifier());


final filteredMealsProvider = Provider((ref) {

  final meals = ref.watch(mealsProvider);
  final activeMeals = ref.watch(filtersProvider);

  return meals.where((meal) {
  //after filtering the meals it will return theRequested meals
  if (activeMeals[Filter.glutenFree]! && !meal.isGlutenFree) {
    return false;
  }

  if (activeMeals[Filter.lactoseFree]! && !meal.isLactoseFree) {
    return false;
  }

  if (activeMeals[Filter.vegan]! && !meal.isVegan) {
    return false;
  }

  if (activeMeals[Filter.vegetarian]! && !meal.isVegetarian) {
    return false;
  }

  return true;
});
});

