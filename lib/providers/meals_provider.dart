import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/data/meals_data.dart';

final mealsProvider = Provider((ref) => currentMeals);