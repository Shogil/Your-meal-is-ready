import 'package:get/get.dart';
import 'package:shopping_cart_workshop/screens/home/home_screen.dart';
import 'package:shopping_cart_workshop/screens/login/sign_up_screen.dart';
import 'package:shopping_cart_workshop/screens/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
    ),
  ];
}
