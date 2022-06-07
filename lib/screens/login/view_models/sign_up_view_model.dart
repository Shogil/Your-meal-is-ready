import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_cart_workshop/routes/app_pages.dart';
import 'package:shopping_cart_workshop/screens/login/widgets/custom_full_screen_dialog.dart';
import 'package:shopping_cart_workshop/screens/splash/view_models/splash_view_model.dart';

class SignUpViewModel extends GetxController {
  SplashScreenViewModel splashScreenViewModel =
      Get.find<SplashScreenViewModel>();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void login() async {
    CustomFullScreenDialog.showDialog();
    GoogleSignInAccount? googleSignInAccount =
        await splashScreenViewModel.googleSign.signIn();
    if (googleSignInAccount == null) {
      CustomFullScreenDialog.cancelDialog();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await splashScreenViewModel.firebaseAuth
          .signInWithCredential(oAuthCredential);
      CustomFullScreenDialog.cancelDialog();
    }
  }
}
