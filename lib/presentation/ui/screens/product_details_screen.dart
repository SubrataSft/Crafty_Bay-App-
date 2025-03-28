import 'package:crafty_bay_app/presentation/ui/widgets/color_picker.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utils/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(
        children: [
          Expanded(
            child: _buildProductDetails(),
          ),
          _buildPriceAndAddToCartSection()
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return SingleChildScrollView(
            child: Column(
              children: [
                ProductImageSlider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNameAndQuantitySection(),
                      SizedBox(height: 4),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          _buildRatingAndReviewSection(),
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
                      ColorPicker(
                        colors: [
                          Colors.red,
                          Colors.green,
                          Colors.yellow,
                          Colors.black,
                        ],
                        onSizeSelected: (color) {},
                      ),
                      SizedBox(height: 16),
                      SizePicker(
                        sizes: ["S", "M", "L", "XL", "XXL"],
                        onSizeSelected: (String selectedSize) {},
                      ),
                      SizedBox(height: 16),
                      _buildDescriptionSection(),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Widget _buildDescriptionSection() {
    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 8),
                        Text(
                          """It is a beautiful shoe in the nature but it is not modern ,So I think the show make a present day ,then it is very sell """,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    );
  }

  Widget _buildNameAndQuantitySection() {
    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Nick shoe 2025 latest model - New year special day",
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

  Widget _buildRatingAndReviewSection() {
    return Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Text(
                              "4",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themColor.withAlpha(26),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text("Price"),
                 Text("\$120",style: TextStyle(
                   fontWeight: FontWeight.w600,
                   color: AppColors.themColor,
                   fontSize: 18
                 ),),
               ],
             ),
              SizedBox(
                  width: 150,
                  child: ElevatedButton(onPressed: (){}, child: Text("Add to Cart")))
            ],
          ),
        );
  }
}
