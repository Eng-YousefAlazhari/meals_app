import 'package:flutter/material.dart';

class MainDrwer extends StatelessWidget {
  const MainDrwer({
    super.key,
    required this.onSelectScreen,
  });

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context)
                .colorScheme
                .primaryContainer
                .withValues(alpha: 0.8),
          ])),
          child: Row(
            children: [
              Icon(
                Icons.fastfood,
                color: Theme.of(context).colorScheme.primary,
                size: 48,
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                'Cooking Up!',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              )
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.restaurant_rounded,
            color: Theme.of(context).colorScheme.onSurface,
            size: 24,
          ),
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 24,
                ),
          ),
          onTap: () {
            onSelectScreen('Meals');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.onSurface,
            size: 24,
          ),
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          onTap: () {
            onSelectScreen('Filters');
          },
        )
      ],
    ));
  }
}
