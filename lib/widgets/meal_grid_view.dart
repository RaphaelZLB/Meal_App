import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/meal.dart';

class MealGridView extends StatelessWidget {
  const MealGridView(
      {super.key, required this.meal, required this.onSelectedMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectedMeal;

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
        break;
      case Complexity.challenging:
        return 'Challenging';
        break;
      case Complexity.hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
        break;
      case Affordability.pricey:
        return 'Pricey';
        break;
      case Affordability.luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      //to fit the pic
      elevation: 3,
      //la yebroz l card
      child: InkWell(
        onTap: () => onSelectedMeal(meal),
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: meal.id,
                  child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(meal.imageUrl)),
                ),
                Positioned(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        color: Colors.black54,
                        child: Text(
                          meal.title,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
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
                      const SizedBox(
                        width: 3,
                      ),
                      Text('${meal.duration} mins'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.restaurant_menu),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.price_check_outlined),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
