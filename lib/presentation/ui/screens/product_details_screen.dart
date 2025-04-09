import 'package:crafty_bay_app/data/models/product_details_model.dart';
import 'package:crafty_bay_app/data/models/product_model.dart';
import 'package:crafty_bay_app/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/color_picker.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utils/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: GetBuilder<ProductDetailsController>(
        builder: (productListController) {
          if (productListController.inProgress) {
            return CenteredCircularProgressIndicator();
          }
          if (productListController.errorMessage != null) {
            return Center(child: Text(productListController.errorMessage!));
          }

          return Column(
            children: [
              Expanded(
                child: _buildProductDetails(productListController.product!),
              ),
              _buildPriceAndAddToCartSection(productListController.product!),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProductDetails(ProductDetailsModel product) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImageSlider(
            sliderUrls: [
              product.img1!,
              product.img2!,
              product.img3!,
              product.img4!,
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameAndQuantitySection(product),
                SizedBox(height: 4),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _buildRatingAndReviewSection(product),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Reviews',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 8),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      color: AppColors.themColor,
                      child: Icon(
                        Icons.favorite,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // ColorPicker(
                //   colors: [
                //     Colors.red,
                //     Colors.green,
                //     Colors.yellow,
                //     Colors.black,
                //   ],
                //   onSizeSelected: (color) {},
                // ),
                // SizedBox(height: 16),
                SizePicker(
                  sizes: product.color!.split(','),
                  onSizeSelected: (String selectedSize) {},
                ),
                SizedBox(height: 16),
                _buildDescriptionSection(product),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(ProductDetailsModel productDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description", style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 8),
        Text(
          productDetails.product?.shortDes ?? "",
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildNameAndQuantitySection(ProductDetailsModel productDetails) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            productDetails.product?.title ?? "",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ItemCount(
          initialValue: 1,
          minValue: 1,
          maxValue: 20,
          decimalPlaces: 0,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildRatingAndReviewSection(ProductDetailsModel productDetails) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.amber),
        Text(
          "${productDetails.product?.star ?? ""}",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection(ProductDetailsModel productDetails) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themColor.withAlpha(26),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Price"),
              Text(
                "\$${productDetails.product?.price}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.themColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(onPressed: () {}, child: Text("Add to Cart")),
          ),
        ],
      ),
    );
  }
}
