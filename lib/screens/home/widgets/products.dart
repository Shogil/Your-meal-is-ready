import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart_workshop/screens/home/models/product.dart';
import 'package:shopping_cart_workshop/screens/home/view_models/home_screen_view_model.dart';
import 'package:shopping_cart_workshop/screens/home/widgets/single_product.dart';

class ProductsWidget extends StatelessWidget {
  final HomeScreenViewModel homeScreenViewModel =
      Get.find<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: homeScreenViewModel.products.length,
        itemBuilder: (context, index) {
          return SingleProductWidget(
            product: homeScreenViewModel.products[index],
          );
        },
      ),
    );
  }
}
