import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/widget/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
              meal: meal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh... nothing here',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.grey,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Try select different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (BuildContext context, int index) => MealItem(
          meal: meals[index],
          onSelectedMeal: (meal) {
            selectMeal(context, meal);
          },
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
