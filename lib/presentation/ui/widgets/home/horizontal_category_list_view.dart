import 'package:crafty_bay_app/data/models/category_model.dart';
import 'package:crafty_bay_app/presentation/state_holders/category_list_controller.dart';
import 'package:flutter/material.dart';

import '../category_card.dart';

class HorizontalCategoryListView extends StatelessWidget {
  const HorizontalCategoryListView({
    super.key, required this.categoryList,
  });

  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          categoryModel: categoryList[index],
        );
      },
      separatorBuilder: (_, __) => SizedBox(width: 8),
    );
  }
}

