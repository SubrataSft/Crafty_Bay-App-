import 'package:crafty_bay_app/data/models/product_model.dart';
import 'package:crafty_bay_app/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay_app/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay_app/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(productId: product.id!,));
      },
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: SizedBox(
          width: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 140,
                height: 100,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.themColor.withAlpha(24),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(AssetsPath.dummyProductImg),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                     product.title ??"",
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              '\$${product.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.themColor,
                              ),
                            ),
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Text(
                            " ${product.star}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
