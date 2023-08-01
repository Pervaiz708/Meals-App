import 'package:flutter/material.dart';
import 'package:mealsapp/model/meals_catagory.dart';
import 'package:mealsapp/providers/favoritemeals_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> getDatabase() async {
  final dbpath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    dbpath,
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE MEALSDB(id TEXT PRIMARY KEY, title TEXT, image TEXT, duration TEXT, ingredients TEXT, steps TEXT, isFavorite BOOLEAN)');
    },
    version: 1,
  );
  return db;
}

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meals});
  final MealsCatagory meals;

  void insertmeals(MealsCatagory meals, WidgetRef ref) async {
    final db = await getDatabase();
    final isFavorite = ref.read(favoriteMealsProvider).contains(meals);
    db.insert('MEALSDB', {
      'id': meals.id,
      'title': meals.title,
      'image': meals.imageUrl,
      'duration': meals.duration,
      'ingredients': meals.ingredients,
      'steps': meals.steps,
      'isFavorite': isFavorite
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritemeals = ref.watch(favoriteMealsProvider);
    final isfavorited = favoritemeals.contains(meals);
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(
              onPressed: () {
                final isfavourited = ref
                    .read(favoriteMealsProvider.notifier)
                    .onFavoriteMeals(meals);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(isfavourited
                        ? 'Meals Added To Favorite'
                        : 'Meals Romoved From Favorite')));
              },
              icon: Icon(isfavorited ? Icons.star : Icons.star_border_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meals.imageUrl),
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            Text("Duration",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary)),
            Text('${meals.duration} min'),
            const SizedBox(
              height: 14,
            ),
            Text('Ingredients',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary)),
            const SizedBox(height: 5),
            for (final ingredients in meals.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(ingredients,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black)),
              ),
            const SizedBox(
              height: 5,
            ),
            Text('Steps',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary)),
            const SizedBox(height: 5),
            for (final steps in meals.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Text(steps,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                    textAlign: TextAlign.center),
              )
          ],
        ),
      ),
    );
  }
}
