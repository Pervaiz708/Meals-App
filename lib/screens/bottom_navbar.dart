import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/screens/filters_screens.dart';
import 'package:mealsapp/screens/home_page.dart';
import 'package:mealsapp/providers/filter_provider.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/screens/test_page.dart';
import 'package:mealsapp/providers/favoritemeals_provider.dart';
import 'package:mealsapp/widgets/drawer.dart';

const kinitialValues = {
    Filters.glutenfree: false,
    Filters.lactosefree:false,
    Filters.vegetarian:false,
    Filters.vegan:false
};


class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomabBarState();
}

class _BottomabBarState extends ConsumerState<BottomNavBar> {
  Widget? activePage;
  int _selectedIndex = 0;
  var activePageTitle = 'Catagories';

  void _onSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context)
          .push<Map<Filters, bool>>(MaterialPageRoute(builder: 
            (ctx) => const FilterScreen()));
            
    }
  }

  @override
  Widget build(BuildContext context) {
    final availablemeals = ref.watch(filteredMealsProvider);
    switch (_selectedIndex) {
      case 0:
        activePage = HomePage(availableMeals: availablemeals,);
        break;
      case 1:
        final favoriteMeals = ref.watch(favoriteMealsProvider);
        activePage = Meals(
          meal: favoriteMeals,
        );
        activePageTitle = 'Your Favourite';
        break;
      case 2:
        activePage = const TestPage(
        );
    }
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        drawer: MainDrawer(
          onSelectScreen: _setScreen,
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onSelectedIndex,
          currentIndex: _selectedIndex,
          // backgroundColor: const ColorScheme.light().onSecondaryContainer,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_books,
                ),
                label: 'Catagories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Test Page')
          ],
        ),
      );
  }
}
