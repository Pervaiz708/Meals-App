import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/screens/bottom_navbar.dart';



void main() {
  runApp(const ProviderScope(child: MealsApp()));
}

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ref.watch(themeProvider),
      home: BottomNavBar()
    );
  }
}