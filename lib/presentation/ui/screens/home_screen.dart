import 'package:crafty_bay_app/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay_app/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay_app/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay_app/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay_app/presentation/ui/utils/assets_path.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../state_holders/bottom_nav_bar_controller.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              SearchTextField(textEditingController: TextEditingController()),
              SizedBox(height: 16),
              HomeBannerSlider(),
              SizedBox(height: 16),
              _buildCategoriesSection(),
              _buildPopularProductsSection(),
              SizedBox(height: 16),
              _buildNewProductsSection(),
              SizedBox(height: 16),
              _buildSpecialProductsSection(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularProductsSection() {
    return Column(
      children: [
        SectionHeader(title: "Popular", onTap: () {}),
        SizedBox(
          height: 180,
          child: GetBuilder<PopularProductListController>(
            builder: (popularProductListController) {
              return Visibility(
                visible: !popularProductListController.inProgress,
                replacement: CircularProgressIndicator(),
                child: HorizontalProductListView(
                  productList: popularProductListController.productList,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewProductsSection() {
    return Column(
      children: [
        SectionHeader(title: "New", onTap: () {}),
        SizedBox(
          height: 180,
          child: GetBuilder<NewProductListController>(
            builder: (newProductListController) {
              return Visibility(
                visible: !newProductListController.inProgress,
                replacement: CircularProgressIndicator(),
                child: HorizontalProductListView(
                  productList: newProductListController.productList,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialProductsSection() {
    return Column(
      children: [
        SectionHeader(title: "Special", onTap: () {}),
        SizedBox(
          height: 180,
          child: GetBuilder<SpecialProductListController>(
            builder: (specialProductListController) {
              return Visibility(
                visible: !specialProductListController.inProgress,
                replacement: CircularProgressIndicator(),
                child: HorizontalProductListView(
                  productList: specialProductListController.productList,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      children: [
        SectionHeader(
          title: "Categories",
          onTap: () {
            Get.find<BottomNavBarController>().selectCategory();
          },
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 140,
          child: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              return Visibility(
                visible: !categoryListController.inProgress,
                replacement: CenteredCircularProgressIndicator(),
                child: HorizontalCategoryListView(
                  categoryList: categoryListController.categoryList,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions: [
        AppBarIconButton(iconData: Icons.person, onTap: () {}),
        SizedBox(width: 8),
        AppBarIconButton(iconData: Icons.call, onTap: () {}),
        SizedBox(width: 8),
        AppBarIconButton(iconData: Icons.notifications_outlined, onTap: () {}),
      ],
    );
  }
}
