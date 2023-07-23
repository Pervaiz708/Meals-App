import 'package:flutter/material.dart';
import 'package:mealsapp/model/meals_catagory.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:mealsapp/compoents/meal_item_trait.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({super.key, required this.meals, required this.selectedMeal});
  final MealsCatagory meals;
  final void Function(MealsCatagory meal) selectedMeal;

  String get complexityText {
    return meals.complexity.name[0].toUpperCase() +
        meals.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meals.affordability.name[0].toUpperCase() +
        meals.affordability.name.substring(1);
  }

  

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: (){
          selectedMeal(meals);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meals.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meals.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              text: '${meals.duration} min'),
                          const SizedBox(width: 12),
                          MealItemTrait(icon: Icons.work, text: complexityText),
                          const SizedBox(width: 12),
                          MealItemTrait(
                              icon: Icons.attach_money, text: affordabilityText)
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
