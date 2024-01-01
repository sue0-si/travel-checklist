import 'package:flutter/material.dart';
import 'package:travel_checklist/ui/widget/category_item_button.dart';

import '../../model/category_list.dart';

class CategoryTabBar extends StatelessWidget {
  const CategoryTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const TabBar(tabs: [
            Tab(
              text: 'Immigration',
            ),
            Tab(
              text: 'Electronics',
            ),
            Tab(
              text: 'Clothes',
            ),
            Tab(
              text: 'Makeups',
            ),
          ]),
          Expanded(
            child: TabBarView(
              children: [
                CategoryItemButton(itemList: Categories().immigration),
                CategoryItemButton(itemList: Categories().electronics),
                CategoryItemButton(itemList: Categories().clothes),
                CategoryItemButton(itemList: Categories().makeups),
              ],
            ),
          ),
        ],
      ),
    );
  }
}