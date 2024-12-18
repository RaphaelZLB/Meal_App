import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/favourites_provider.dart';
import '../models/meal.dart';

class MealDetailedScreen extends ConsumerWidget {
  const MealDetailedScreen(
      {super.key, required this.meal, required this.onToggleFavourite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouritesMealProvider);
    final bool isFavourite = favouriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final toggle = ref //listener
                    .read(favouritesMealProvider.notifier)
                    .toggleMealFavourite(meal);

                ///Message toggle_
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(toggle
                      ? 'Added to favourites.'
                      : 'Removed from favourites.'),
                ));
              },
              icon: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: Tween<double>(begin: 0.8,end: 1).animate(animation),
                      child: child, //same child as Icon
                    );
                  },
                  child: Icon(isFavourite
                      ? Icons.favorite_outlined
                      : Icons.favorite_border_rounded, 
                      color: isFavourite ? Colors.red : Colors.grey,
                      key: ValueKey(isFavourite),
                  )
              )
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'INGREDIENTS:',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 10),
            for (final ingrediants in meal.ingredients)
              Text(
                ingrediants,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            Divider(
              color:
                  Theme.of(context).colorScheme.primary, // Color of the divider
              thickness: 1.5, // Thickness of the divider
              indent: 20.0, // Empty space to the leading edge of the divider
              endIndent:
                  20.0, // Empty space to the trailing edge of the divider
            ),
            Text(
              'STEPS:',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 10),
            for (final ingrediants in meal.steps)
              Text(
                ingrediants,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
