import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:mealsapp/screens/home_page.dart';
import 'package:mealsapp/screens/bottom_navbar.dart';

final lighttheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
    textTheme: GoogleFonts.latoTextTheme()
);
final darktheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
    textTheme: GoogleFonts.latoTextTheme()
);
void main() {
  runApp(const ProviderScope(child: MealsApp()));
}

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: darktheme, 
      home: const BottomNavBar(),
    );
  }
}

