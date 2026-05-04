import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/provider/filters_provider.dart';
import 'package:meals/provider/meals_provider.dart';

class FavoriteMealsNoitfier extends StateNotifier<List<Meal>> {
  FavoriteMealsNoitfier() : super([]);

  bool toggleMealsFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNoitfier, List<Meal>>((ref) {
  return FavoriteMealsNoitfier();
});

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
