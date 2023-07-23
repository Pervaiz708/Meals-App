import 'package:flutter/material.dart';
import 'package:mealsapp/data/item_data.dart';
import 'package:mealsapp/data/meals_data.dart';
import 'package:mealsapp/model/item_catagory.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/grid_item_catagories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void _selectedCatagory(BuildContext context, ItemsCatagory catagory) {
  final filteredCatagory = currentMeals.where((meal) => meal.categories.contains(catagory.id)).toList();   
  
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => 
        Meals(
          title: catagory.title, 
          meal:  filteredCatagory,
          )
          )
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15),
          padding: const EdgeInsets.all(24),
          children: [
            for (final catagory in currentItemsCatagory)
              CatagoryGridItem(
                catagory: catagory,
                onSelectedCatagory: () {
                  _selectedCatagory(context, catagory);
                },
              )
          ],
      ),
    );
  }
}
