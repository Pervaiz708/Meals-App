import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/screens/home_page.dart';
// import 'package:mealsapp/screens/home_page.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/screens/test_page.dart';
import 'package:mealsapp/providers/favoritemeals_provider.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomabBarState();
}

class _BottomabBarState extends ConsumerState<BottomNavBar> {
  Widget? activePage;
  int _selectedIndex =0;
  var activePageTitle = 'Catagories';
  bool istabSelected = false;
 

  void _onSelectedIndex(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
 

  @override
  Widget build(BuildContext context) { 
    // if(_selectedIndex ==1){
    //   activePage = const Meals(title: 'Favourite', meal: []);
    //   istabSelected = true; 
    // }
    switch(_selectedIndex){
        case 0: activePage = const HomePage();
        break;
        case 1: 
        final favoriteMeals = ref.watch(favoriteMealsProvider);
        activePage = Meals(
          meal: favoriteMeals,
          );
        activePageTitle = 'Your Favourite';
        break;
        case 2: activePage = const TestPage();
      }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
      onTap: _onSelectedIndex,
      currentIndex: _selectedIndex,
      // backgroundColor: const ColorScheme.light().onSecondaryContainer,
      items:  const  [
       BottomNavigationBarItem(icon: Icon(Icons.library_books, color: Colors.black,) , label: 'Catagories'),
       BottomNavigationBarItem(icon: Icon(Icons.favorite_outline, color: Colors.black) ,label: 'Favorites'),
       BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Test Page') 
      ],
      ),
    );
  }
}