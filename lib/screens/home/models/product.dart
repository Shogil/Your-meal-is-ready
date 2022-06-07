class ProductModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const DESCRIPTION = "des";
  static const PRICE = "price";
  static const CALORIES = "calories";
  static const VEG = "veg";

  String? id;
  String? image;
  String? name;
  String? description;
  double? price;
  double? calories;
  bool? veg;

  ProductModel({this.id, this.image, this.name, this.description, this.price, this.veg, this.calories});

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    description = data[DESCRIPTION];
    price = data[PRICE].toDouble();
    calories = data[CALORIES].toDouble();
    veg = data[VEG];
  }
}
