import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectedScreen});

  final Function(String identifier) onSelectedScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.2),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          ListTile(
            onTap: onSelectedScreen('Meals'),
            leading: Icon(Icons.restaurant_menu),
            title: Text('Meals',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.secondary,),),
          ),

          ListTile(
            onTap: onSelectedScreen('Filters'),
            leading: Icon(Icons.filter_alt),
            title: Text('Filters',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.secondary,),),
          ),
        ],
      ),
    );
  }
}
