import 'package:crafty_bay_app/data/models/category_model.dart';
import 'package:crafty_bay_app/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay_app/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () =>
              ProductListScreen(category: categoryModel),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.themColor.withAlpha(24),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.computer, size: 48, color: AppColors.themColor),
          ),
          SizedBox(height: 4),
          Text(
            categoryModel.categoryName ?? "",
            style: TextStyle(color: AppColors.themColor),
          ),
        ],
      ),
    );
  }
}
