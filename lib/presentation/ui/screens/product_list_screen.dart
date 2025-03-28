import 'package:crafty_bay_app/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Electronics")),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio:0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 18
        ),
        itemBuilder: (context, index) {
          return ProductCard();
        },
      ),
    );
  }
}
