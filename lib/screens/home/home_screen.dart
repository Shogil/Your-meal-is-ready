import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shopping_cart_workshop/screens/cart/cart_screen.dart';
import 'package:shopping_cart_workshop/screens/home/view_models/home_screen_view_model.dart';
import 'package:shopping_cart_workshop/screens/home/widgets/custom_text.dart';
import 'package:shopping_cart_workshop/screens/home/widgets/products.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenViewModel homeScreenViewModel =
      Get.put(HomeScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: CustomText(
            text: "Shopping App",
            size: 24,
            weight: FontWeight.bold,
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: Colors.white,
                      child: ShoppingCartWidget(),
                    ),
                  );
                })
          ],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  accountName: Text(homeScreenViewModel.userName),
                  accountEmail: Text(homeScreenViewModel.userEmail)),
              ListTile(
                onTap: () {
                  homeScreenViewModel.signOut();
                },
                leading: Icon(Icons.exit_to_app),
                title: Text("Log out"),
              )
            ],
          ),
        ),
        body: Container(
          color: Colors.white30,
          child: ProductsWidget(),
        ));
  }
}
