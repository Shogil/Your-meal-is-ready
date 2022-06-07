import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart_workshop/screens/cart/view_model/cart_view_model.dart';
import 'package:shopping_cart_workshop/screens/home/models/cart_item.dart';
import 'package:shopping_cart_workshop/screens/home/widgets/custom_text.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel? cartItem;
  final CartController cartViewModel = Get.find<CartController>();


  CartItemWidget({Key? key, this.cartItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Padding(
          padding:
          const EdgeInsets.all(8.0),
          child: Image.network(
            cartItem!.image!,
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14),
                    child: CustomText(
                      text: cartItem!.name!,
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 15),
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightGreen),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          onTap: () {
                            cartViewModel.decreaseQuantity(cartItem!);
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 16,
                          )),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        cartItem!.quantity.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        onTap: () {
                          cartViewModel.increaseQuantity(cartItem!);
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Padding(
          padding:
          const EdgeInsets.all(14),
          child: CustomText(
            text: "\$${cartItem!.cost}",
            size: 16,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
