import 'package:crafty_bay_app/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay_app/presentation/ui/screens/payment_details_screen.dart';
import 'package:crafty_bay_app/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utils/app_colors.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          title: Text("Cart"),
          leading: IconButton(
            onPressed: backToHome,
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CartItemWidget();
                },
              ),
            ),
            _buildPriceAndAddToCartSection(),
          ],
        ),
      ),
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
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Total Price"),
              Text(
                "\$1200000",
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
            child: ElevatedButton(onPressed: _onTapCheckOutButton, child: Text("Checkout")),
          ),
        ],
      ),
    );
  }

  void _onTapCheckOutButton(){
    Get.to(()=>PaymentDetailsScreen());
  }

  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}

