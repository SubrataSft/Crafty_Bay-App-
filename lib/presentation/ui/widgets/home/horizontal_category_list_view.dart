import 'package:flutter/material.dart';

import '../category_card.dart';

class HorizontalCategoryListView extends StatelessWidget {
  const HorizontalCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return CategoryCard();
      },
      separatorBuilder: (_, __) => SizedBox(width: 8),
    );
  }
}

