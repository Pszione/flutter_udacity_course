import 'package:flutter/material.dart';
import 'package:flutter_udacity_course/unit.dart';

import 'components/category.dart';
import 'constants.dart';
import 'models/category_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for (var i = 0; i < CategoryModel.categoryNames.length; i++) {
      categories.add(Category(
          label: CategoryModel.categoryNames[i],
          color: CategoryModel.baseColors[i],
          icon: CategoryModel.categoryIcons[i],
          units: const [
            Unit(name: 'Pedras', conversion: 1.5),
            Unit(name: 'Pedrões', conversion: 5.0)
          ]));
    }
    return _buildCategoryWidgets(categories);
  }

  /// For portrait, we construct a [ListView] from the list of category widgets.
  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                categories[index],
                if (index == categories.length - 1)
                  const SizedBox(height: rowHeight * 1.5),
              ],
            ),
          );
        });
  }
}
