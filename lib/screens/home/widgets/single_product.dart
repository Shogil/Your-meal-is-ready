import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_cart_workshop/constants/asset_paths.dart';
import 'package:shopping_cart_workshop/screens/home/models/product.dart';
import 'package:shopping_cart_workshop/screens/home/view_models/home_screen_view_model.dart';
import 'package:shopping_cart_workshop/screens/home/widgets/custom_text.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel? product;

  SingleProductWidget({Key? key, this.product}) : super(key: key);
  int quantity = 0;
  final HomeScreenViewModel homeScreenViewModel =
      Get.find<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(product!.veg! ? veg : non_veg,
                  scale: product!.veg! ? 40 : 60),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: product!.name ?? "",
                      size: 18,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "\$${product!.price!}",
                          size: 14,
                          weight: FontWeight.bold,
                        ),
                        CustomText(
                          text: "${product!.calories!} calories",
                          size: 14,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: product!.description!,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      product!.image!,
                      width: 80,
                      height: 80,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightGreen),
            child: GestureDetector(
              onTap: (){
                homeScreenViewModel.addProductToCart(product!);
              },
              child: Text(
                'Add to cart',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
