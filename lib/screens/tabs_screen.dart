import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/filters_provider.dart';
import 'package:meal_app/provider/meal_provider.dart';
import 'package:meal_app/provider/nav_bar_provider.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals_screens.dart';
import 'package:meal_app/widgets/drawer.dart';
import '../provider/favourites_provider.dart';

class TabsScreen extends ConsumerWidget {
  TabsScreen({super.key});

  String activePageTitle = 'Pick your Category';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  // final selectedPage = ref.read(NavBarProvider.notifier).setIndex;
  final availableMeals = ref.watch(filteredMealsProvider);
  final selectedPageIndex = ref.watch(NavBarProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    if (selectedPageIndex == 1) {
      final favouritesMeal = ref.watch(favouritesMealProvider);
      activePageTitle = 'Favourites';
      activePage = MealsScreens(meals: favouritesMeal);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectedScreen:  (String identifier) {
        Navigator.of(context).pop;
        if (identifier == 'Filters') {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => FilterScreen()));
        } //after closing the FilterScreen() the function .then will take place}),
      }),
      bottomNavigationBar: BottomNavigationBar(
          onTap: ref.read(NavBarProvider.notifier).setIndex,
          currentIndex: selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favourites',
            ),
          ]),
    );
  }
}