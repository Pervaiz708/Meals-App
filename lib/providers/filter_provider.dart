import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meals_provider.dart';

enum Filters{
  glutenfree,
  lactosefree,
  vegetarian,
  vegan
}

class FilterNotifier extends StateNotifier<Map<Filters, bool>>{
    FilterNotifier(): super({
      Filters.glutenfree: false,
      Filters.lactosefree:false,
      Filters.vegetarian: false,
      Filters.vegan: false

    });
    void setFilters(Map<Filters, bool> chosenFilter){
      state = chosenFilter;
    }
    void setFilter(Filters filter, bool isActive){
     state = {
       ...state,
       filter:isActive
     };
    }
}
// ignore: non_constant_identifier_names
final FilterProvider = StateNotifierProvider<FilterNotifier, Map<Filters, bool>>((ref) => FilterNotifier());

final filteredMealsProvider = Provider((ref){
  final currentMeals = ref.watch(mealsProvider);
  final activeFilter = ref.watch(FilterProvider);
  return currentMeals.where((meals){
      if(activeFilter[Filters.glutenfree]! && !meals.isGlutenFree){
         return false;
      }
      if(activeFilter[Filters.glutenfree]! && !meals.isLactoseFree){
         return false;
      }
      if(activeFilter[Filters.vegetarian]! && !meals.isVegetarian){
         return false;
      }
      if(activeFilter[Filters.vegan]! && !meals.isVegan){
         return false;
      }
      return true;
    }).toList();
});