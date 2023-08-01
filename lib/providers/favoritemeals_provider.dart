import 'package:mealsapp/model/meals_catagory.dart';
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

class FavoriteMealsNotifier extends StateNotifier<List<MealsCatagory>> {
  FavoriteMealsNotifier() : super([]);

  bool onFavoriteMeals(MealsCatagory meals) {
    final isFavorite = state.contains(meals);

    if (isFavorite) {
      state = state.where((m) => m.id != meals.id).toList();
      return false;
    } else {
      state = [...state, meals];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<MealsCatagory>>((ref) {
  return FavoriteMealsNotifier();
});
