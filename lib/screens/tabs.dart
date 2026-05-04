import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/favorite_provider.dart';
import 'package:meals/provider/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/widget/main_drwer.dart';

const kSelectedFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  // final List<Meal> _favoriteMeals = [];
  int _selectPageIndex = 0;

  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(
  //       message,
  //       style: const TextStyle(color: Colors.white),
  //     ),
  //     backgroundColor: Colors.black54,
  //   ));
  // }

  // void _toggleMealFavoriteState(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);
  //   if (isExisting) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //     });
  //     _showInfoMessage('Meal is no longer a favorite.');
  //   } else {
  //     _favoriteMeals.add(meal);
  //     _showInfoMessage('Marked as a favorite.');
  //   }
  // }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final activeFilters = ref.watch(filtersProvider);
    final availableMeals = ref.watch(filteredMealsProvider);
    //
    //dummyMeals.where((meal) {
    //   if (activeFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filters.vegetarian]! && !meal.isVegetarian) {
    //     return false;
    //   }
    //   if (activeFilters[Filters.vegan]! && !meal.isVegan) {
    //     return false;
    //   }
    //   return true;
    // }).toList();
    Widget activePage = CategoriesScreen(
      availbleMeals: availableMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      drawer: MainDrwer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categoties'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
