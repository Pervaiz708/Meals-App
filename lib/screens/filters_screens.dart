import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mealsapp/screens/bottom_navbar.dart';
// import 'package:mealsapp/widgets/drawer.dart';
import '../providers/filter_provider.dart';


class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key, });
  
  

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilter = ref.watch(FilterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      
      body: Column(
          children: [
            SwitchListTile(
              value: activeFilter[Filters.glutenfree]!,
              onChanged: (isChecked){
                ref.read(FilterProvider.notifier).setFilter(Filters.glutenfree, isChecked);
              },
              title: Text('Gluten Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black
              ),),
              subtitle: Text('Only Gluten free meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.black),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 34, vertical: 22),
            ),
            
            SwitchListTile(
              value: activeFilter[Filters.lactosefree]!,
              onChanged: (isChecked){
                ref.read(FilterProvider.notifier).setFilter(Filters.lactosefree, isChecked);
              },
              title: Text('Lactose Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black
              ),),
              subtitle: Text('Only Lactose free meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.black),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 34, vertical: 22),
            ),
            
            SwitchListTile(
              value: activeFilter[Filters.vegetarian]!,
              onChanged: (isChecked){
                ref.read(FilterProvider.notifier).setFilter(Filters.vegetarian, isChecked);
              },
              title: Text('Veg Meals',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black
              ),),
              subtitle: Text('Only Veg meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.black),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 34, vertical: 22),
            ),
            
            SwitchListTile(
              value: activeFilter[Filters.vegan]!,
              onChanged: (isChecked){
                ref.read(FilterProvider.notifier).setFilter(Filters.vegan, isChecked);
              },
              title: Text('Vegan Meals',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black
              ),),
              subtitle: Text('Only Vegan meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.black),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.symmetric(horizontal: 34, vertical: 22),
            ),
          ],
        ),
    );
  }
}
