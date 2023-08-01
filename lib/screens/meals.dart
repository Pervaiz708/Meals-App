import 'package:flutter/material.dart';
import 'package:mealsapp/model/meals_catagory.dart';
import 'package:mealsapp/widgets/meals_item.dart';
import 'meal_details.dart';

class Meals extends StatelessWidget {
  const Meals({
    super.key,
    this.title,
    required this.meal,
  });

  final String? title;
  final List<MealsCatagory> meal;

  void onSelectMealItem(BuildContext context, MealsCatagory meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetails(
              meals: meal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meal.length,
        itemBuilder: (ctx, index) => Text(meal[index].title)
        // Text(meals[index].origin);
        );
    if (meal.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('So Sorry... Nothig here'),
            SizedBox(
              height: 10,
            ),
            Text('Try Another Catagory')
          ],
        ),
      );
    } else {
      content = ListView.builder(
        itemCount: meal.length,
        itemBuilder: (ctx, index) => MealsItem(
          meals: meal[index],
          selectedMeal: (meals) {
            onSelectMealItem(context, meals);
          },
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
