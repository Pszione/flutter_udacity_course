import 'package:flutter/material.dart';

import 'category.dart';
import 'main.dart';
import 'models/category_model.dart';

class CategoriesRoute extends StatelessWidget {
  const CategoriesRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for (var i = 0; i < CategoryModel.categoryNames.length; i++) {
      categories.add(Category(
        label: CategoryModel.categoryNames[i],
        color: CategoryModel.baseColors[i],
        icon: Icons.cake,
      ));
    }
    return _buildCategoryWidgets(categories);
  }

  /// For portrait, we construct a [ListView] from the list of category widgets.
  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: categories[index],
      ),
    );
  }
}
