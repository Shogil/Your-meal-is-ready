import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart_workshop/constants/asset_paths.dart';
import 'package:shopping_cart_workshop/screens/login/widgets/background_painter.dart';
import 'package:shopping_cart_workshop/screens/splash/view_models/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenViewModel screenViewModel =
      Get.put(SplashScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          Column(
            children: [
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: 175,
                  child: Text(
                    'Welcome to Shopping cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
