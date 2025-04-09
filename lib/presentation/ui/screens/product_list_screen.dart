import 'package:crafty_bay_app/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../data/models/category_model.dart';
import '../widgets/centered_circular_progress_indicator.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProductListByCategoryController>().
    getProductListByCategory(widget.category.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.categoryName ?? "")),
      body: GetBuilder<ProductListByCategoryController>(
        builder: (productListByCategoryController) {

          if(productListByCategoryController.inProgress){
            return CenteredCircularProgressIndicator();
          }

          if(productListByCategoryController.errorMessage != null){
            return Center(
              child: Text(productListByCategoryController.errorMessage!),
            );
          }

          if(productListByCategoryController.productList.isEmpty){
            return Center(
              child: Text("Empty Product list"),
            );
          }



          return GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio:1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 18
            ),
            itemBuilder: (context, index) {
               return FittedBox(child: ProductCard(product: productListByCategoryController.productList[index],));
            },
          );
        }
      ),
    );
  }
}
