import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavouritesNotifier extends StateNotifier<List<Meal>> {
  FavouritesNotifier() : super([]); //initial value is a empty list

  bool toggleMealFavourite(Meal meal) {
    final exist = state.contains(meal);

    if (exist) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      //here we added to the List of state an extra meal to the previous list
      state = [
        ...state,
        meal
      ];
      return true;
    }
  }
}

///control the state of FavouritesNotifier
final favouritesMealProvider =
    StateNotifierProvider<FavouritesNotifier, List<Meal>>(
        //<Class + Type of State>
        (ref) {
  return FavouritesNotifier();
});
