import 'package:crafty_bay_app/presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay_app/presentation/ui/utils/assets_path.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<SliderListController>().getSliderList();
  }

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

  Widget _buildPopularProductsSection(){
    return Column(
      children: [
        SectionHeader(title: "Popular", onTap: () {}),
        SizedBox(height: 180, child: HorizontalProductListView()),
      ],
    );
  }  Widget _buildNewProductsSection(){
    return Column(
      children: [
        SectionHeader(title: "Popular", onTap: () {}),
        SizedBox(height: 180, child: HorizontalProductListView()),
      ],
    );
  }  Widget _buildSpecialProductsSection(){
    return Column(
      children: [
        SectionHeader(title: "Popular", onTap: () {}),
        SizedBox(height: 180, child: HorizontalProductListView()),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      children: [
        SectionHeader(title: "Categories", onTap: () {
          Get.find<BottomNavBarController>().selectCategory();
        }),
        SizedBox(height: 8),
        SizedBox(height: 140, child:  HorizontalCategoryListView()),
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



