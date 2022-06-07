import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart_workshop/screens/home/models/cart_item.dart';
import 'package:shopping_cart_workshop/screens/home/models/product.dart';
import 'package:shopping_cart_workshop/screens/home/models/user.dart';
import 'package:shopping_cart_workshop/screens/home/view_models/home_screen_view_model.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxDouble totalCartPrice = 0.0.obs;
  HomeScreenViewModel homeScreenViewModel = Get.find<HomeScreenViewModel>();

  @override
  void onReady() {
    super.onReady();
    ever(homeScreenViewModel.userModel!, changeCartTotalPrice);
  }

  void removeCartItem(CartItemModel cartItem) {
    try {
      homeScreenViewModel.updateUserData({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
      print(e);
    }
  }

  changeCartTotalPrice(UserModel userModel) {
    totalCartPrice.value = 0.0;
    if (userModel.cart!.isNotEmpty) {
      userModel.cart!.forEach((cartItem) {
        totalCartPrice.value += cartItem.cost!;
      });
    }
  }

  void decreaseQuantity(CartItemModel item){
    if(item.quantity == 1){
      removeCartItem(item);
    }else{
      removeCartItem(item);
      item.quantity = item.quantity! - 1;
      homeScreenViewModel.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }

  void increaseQuantity(CartItemModel item){
    removeCartItem(item);
    item.quantity = item.quantity! + 1;
    print({"quantity": item.quantity});
    homeScreenViewModel.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }
}
