import 'package:crafty_bay_app/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_app/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/category_card.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          leading: IconButton(
            onPressed: backToHome,
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryListController>().getCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              if (categoryListController.inProgress) {
                return CenteredCircularProgressIndicator();
              }
             else if (categoryListController.errorMessage != null) {
                return Center(
                  child: Text(categoryListController.errorMessage!),
                );
              }

              return GridView.builder(
                itemCount: categoryListController.categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  return CategoryCard(
                    categoryModel: categoryListController.categoryList[index],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}
