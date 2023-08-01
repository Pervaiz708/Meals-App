import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.8)
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
              )
          ),
          child: const Row(
            children: [
               Icon(Icons.fastfood,size: 50, color: Color.fromARGB(92, 255, 255, 255)),
               SizedBox(
                width: 18,
              ),
              Text('Meals App', style: TextStyle(
                color: Colors.white,
                fontSize: 18
              )
              )
            ],
          ),
        ),
        const SizedBox(height: 20,),
         ListTile(
          selectedColor: Colors.white,
          leading:const Icon(Icons.food_bank),
          title: const Text('Meals'),
          onTap:(){
            onSelectScreen('meals');
          }
        ),
        const SizedBox(height: 15,),
        ListTile(
          selectedColor: Colors.white,
          leading: const Icon(Icons.settings),
          title: const Text('filters'),
          onTap: (){
            onSelectScreen('filters');
          },
          ),
          // const SizedBox(height: 50,),
          //  Positioned(
          //   top: 100,
          //   child: ThemeButton(isDarkMode: isdark, toggleTheme: ontoggletheme)
          //   )
      ],
    ));
    
  }
}
