import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopping_cart_workshop/screens/cart/view_model/cart_view_model.dart';
import 'package:shopping_cart_workshop/screens/cart/widgets/cart_item_widget.dart';
import 'package:shopping_cart_workshop/screens/cart/widgets/custom_button.dart';
import 'package:shopping_cart_workshop/screens/home/view_models/home_screen_view_model.dart';
import 'package:shopping_cart_workshop/screens/home/widgets/custom_text.dart';

class ShoppingCartWidget extends StatelessWidget {
  final HomeScreenViewModel homeScreenViewModel =
      Get.find<HomeScreenViewModel>();
  final CartController cartViewModel = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomText(
                text: "Shopping Cart",
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(() => Column(
                  children: homeScreenViewModel.userModel!.value.cart!
                      .map((cartItem) => CartItemWidget(
                            cartItem: cartItem,
                          ))
                      .toList(),
                )),
          ],
        ),
        Positioned(
          bottom: 30,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8),
            child: Obx(
              () => CustomButton(
                text:
                    "Place Order (\$${cartViewModel.totalCartPrice.value.toStringAsFixed(2)})",
                onTap: () {},
                bgColor: Colors.lightGreen,
              ),
            ),
          ),
        )
      ],
    );
  }
}
