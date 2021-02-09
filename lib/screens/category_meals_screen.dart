import 'package:flutter/material.dart';
import 'package:flutter_meal_app/data_base.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categories-meals';

  @override
  Widget build(BuildContext context) {
    //this final below make us able to retrive the title and id from cateory_item.dart that pass through the route and navigator selected category in category_item.dart
    final categoryTitleAndIdArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = categoryTitleAndIdArguments['title'];
    final categoryId = categoryTitleAndIdArguments['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
