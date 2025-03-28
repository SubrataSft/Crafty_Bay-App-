import 'package:crafty_bay_app/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
        body: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            return CategoryCard();
          },
        ),
      ),
    );

  }
  void backToHome(){
    Get.find<BottomNavBarController>().backToHome();
  }
}
