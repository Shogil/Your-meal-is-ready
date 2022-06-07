import 'package:flutter/material.dart';
import 'package:shopping_cart_workshop/screens/login/widgets/background_painter.dart';
import 'package:shopping_cart_workshop/screens/login/widgets/google_sign_up_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          buildSignUp(),
        ],
      ),
    );
  }

  Widget buildSignUp() {
    return Column(
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
        Spacer(),
        GoogleSignupButtonWidget(),
        SizedBox(height: 12),
        Text(
          'Login to continue',
          style: TextStyle(fontSize: 16),
        ),
        Spacer(),
      ],
    );
  }
}
