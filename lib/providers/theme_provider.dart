// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';

// // class ThemeNotifier extends StateNotifier<ThemeData> {
// //   ThemeNotifier() : super(lighttheme);
//   final lighttheme = ThemeData(
//     colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
//     textTheme: GoogleFonts.latoTextTheme()
// );
// final darktheme = ThemeData(
//     colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 131, 57, 0), brightness: Brightness.dark),
//     textTheme: GoogleFonts.latoTextTheme()
// );

// //   ThemeData toggledarkTheme(bool isDark){
//     // if(isDark){
//     //  return darktheme;
//     // }else{
//     // return lighttheme;
//     // }
// //   }
// // }

// final themeProvider =
//     Provider<ThemeData>((ref) {
//   if(isDark){
//      return darktheme;
//     }else{
//     return lighttheme;
//     }
//   }
// );