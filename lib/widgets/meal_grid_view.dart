import 'package:flutter/material.dart';
import 'package:meal_app/core/widgets/shimmer_gradiant.dart';
import 'package:transparent_image/transparent_image.dart';
import '../core/models/meal.dart';

class MealGridView extends StatelessWidget {
  const MealGridView(
      {super.key, required this.meal, required this.onSelectedMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectedMeal;

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      //to fit the pic
      elevation: 3,
      child: InkWell(
        onTap: () => onSelectedMeal(meal),
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: meal.id,
                  child: Stack(
                    children: [
                      // Placeholder shimmer while image loads
                      FadeTransition(
                        opacity: const AlwaysStoppedAnimation(1.0),
                        child: ShimmerLoading(
                          height: 200,
                          width: double.infinity,
                          borderRadius: 0,
                          child: Container(
                            height: 200,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Image that will fade in once loaded
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: meal.imageUrl,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.error_outline, color: Colors.red),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Positioned widget places its child at a specific position within a Stack
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.access_time_outlined),
                      const SizedBox(width: 3),
                      Text('${meal.duration} mins'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.restaurant_menu),
                      const SizedBox(width: 3),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.price_check_outlined),
                      const SizedBox(width: 3),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
