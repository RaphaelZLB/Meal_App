import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/filters_provider.dart';

// import '../widgets/drawer.dart';
// import 'package:meal_app/screens/tabs_screen.dart';
class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final activeFilter = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        centerTitle: true,
      ),

      // drawer: MainDrawer(onSelectedScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'Meals') {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (ctx) => TabsScreen()))
      //         }}),

      body: Column(
          children: [
            customSwitch(context,'Gluten-free','sub', (value) {
              ref.watch(filtersProvider.notifier).setFilter(Filter.glutenFree, value);
              },activeFilter[Filter.glutenFree]!),

            customSwitch(context,'Vegan','sub',(value) {
              ref.watch(filtersProvider.notifier).setFilter(Filter.vegan, value);
            },activeFilter[Filter.vegan]!),

            customSwitch(context,'Vegetarian','sub', (value) {
              ref.watch(filtersProvider.notifier).setFilter(Filter.vegetarian, value);
            },activeFilter[Filter.vegetarian]!),

            customSwitch(context,'Lactose-free','sub', (value) {
              ref.watch(filtersProvider.notifier).setFilter(Filter.lactoseFree, value);
            },activeFilter[Filter.lactoseFree]!),
          ],
      ),
    );
  }

  SwitchListTile customSwitch (BuildContext context, String title ,String subtitle, Function(bool toggle) onchange, bool filter ){
    return SwitchListTile(
      value:filter,
      onChanged:onchange,
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 30,right: 20),
      title: Text(title, style: Theme
          .of(context)
          .textTheme
          .titleLarge!
          .copyWith(
        color: Theme
            .of(context)
            .colorScheme
            .secondary,),),
      subtitle: Text(subtitle,style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: Colors.green),),
    );}
}
