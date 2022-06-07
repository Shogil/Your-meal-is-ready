import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_cart_workshop/routes/app_pages.dart';
import 'package:shopping_cart_workshop/screens/home/models/product.dart';
import 'package:shopping_cart_workshop/screens/home/models/user.dart';
import 'package:shopping_cart_workshop/screens/splash/view_models/splash_view_model.dart';
import 'package:uuid/uuid.dart';

class HomeScreenViewModel extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  late String userEmail;
  late String userName;

  Rx<User>? firebaseUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Rx<UserModel>? userModel = UserModel().obs;
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = "products";
  String usersCollection = "users";

  @override
  void onInit() async {
    super.onInit();
    userEmail = auth.currentUser!.email!;
    userName = auth.currentUser!.displayName!;
    firebaseUser = Rx<User>(auth.currentUser!);
    getListOfProducts();
    products.bindStream(getAllProducts());
  }

  @override
  void onReady() {
    super.onReady();
    userModel!.bindStream(listenToUser());
  }

  void signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await auth.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
    Get.lazyPut(() => SplashScreenViewModel());
    Get.offNamed(Routes.SPLASH);
  }

  Stream<List<ProductModel>> getAllProducts() =>
      firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => ProductModel.fromMap(item.data())).toList());

  void getListOfProducts() async {
    var response =
        await Dio().get('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad');
    List productsJsonList =
        response.data[0]['table_menu_list'][0]["category_dishes"];
    productsJsonList.forEach((element) {
      products.add(ProductModel(
        id: element["dish_id"],
        image: "https://firebasestorage.googleapis.com/v0/b/shopping-cart-workshop.appspot.com/o/Butter-Chicken-2-3.jpeg?alt=media&token=023d02f7-c8bf-4e31-a1ab-96cc161db937",
        name: element["dish_name"],
        description: element["dish_description"],
        price: element["dish_price"],
        veg: element["dish_Availability"],
        calories: element["dish_calories"],
      ));
    });
  }

  void addProductToCart(ProductModel product) {
    try {
      String itemId = Uuid().toString();
      updateUserData({
        "cart": FieldValue.arrayUnion([
          {
            "id": itemId,
            "productId": product.id,
            "name": product.name,
            "quantity": 1,
            "price": product.price,
            "image": product.image,
            "cost": product.price
          }
        ])
      });
      Get.snackbar("Item added", "${product.name} was added to your cart");
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
      print(e.toString());
    }
  }

  updateUserData(Map<String, dynamic> data) {
    print("UPDATED");
    firebaseFirestore
        .collection(usersCollection)
        .doc(auth.currentUser!.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser!.value.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));
}
