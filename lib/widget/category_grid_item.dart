import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.selectedCategory,
  });

  final CustomCategory category;
  final Function() selectedCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedCategory,
      splashColor: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: .55),
              category.color.withValues(alpha: .99)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(category.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  )),
        ),
      ),
    );
  }
}
