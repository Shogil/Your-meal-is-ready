import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_cart_workshop/routes/app_pages.dart';

class SplashScreenViewModel extends GetxController {
  late GoogleSignIn googleSign;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String usersCollection = "users";
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    googleSign = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });

    super.onReady();
  }

  _addUserToFirestore() {
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseAuth.currentUser!.uid)
        .set({
      "name": firebaseAuth.currentUser!.displayName,
      "id": firebaseAuth.currentUser!.uid,
      "email": firebaseAuth.currentUser!.email,
      "cart": []
    });
    print("Added user data to firestore");
  }

  @override
  void onClose() {}

  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      _addUserToFirestore();
      Get.offAllNamed(Routes.HOME, arguments: firebaseAuth.currentUser);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
