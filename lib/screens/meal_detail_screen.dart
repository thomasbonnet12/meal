import 'package:flutter/material.dart';
import 'package:flutter_meal_app/data_base.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail_screen';

  @override
  Widget build(BuildContext context) {
    //this final below help us retrieve the argument passed in the route, arguments and String correspond to the ID
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}}'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'ingredients',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            height: 200,
            width: 300,
            child: ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctc, index) => Card(
                color: Theme.of(context).accentColor,
                child: Text(selectedMeal.ingredients[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
