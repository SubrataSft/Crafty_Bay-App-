import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_app/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key, required this.sliderUrls});

  final List<String> sliderUrls;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 230,
            onPageChanged: (index, reason) {
              _selectedIndex.value = index;
            },
            aspectRatio: 2,
            viewportFraction: 1,
          ),
          items:
              widget.sliderUrls.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                     decoration: BoxDecoration(
                       color: Colors.grey.shade200,
                       image: DecorationImage(image: NetworkImage(imageUrl))
                     ),
                    );
                  },
                );
              }).toList(),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedIndex,
            builder: (context, currentIndex, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.sliderUrls.length; i++)
                    Container(
                      margin: EdgeInsets.only(right: 4),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color:
                            currentIndex == i
                                ? AppColors.themColor
                                : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }
}
