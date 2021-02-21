import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const Favorites(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You have no favorites yet - Start adding some!'),
    );
  }
}
