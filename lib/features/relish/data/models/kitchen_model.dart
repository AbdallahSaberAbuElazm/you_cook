import 'package:you_cook/features/relish/domain/entities/kitchen.dart';

class KitchenModel extends Kitchen {
  const KitchenModel(
      {required super.kitchenId,
      required super.kitchenNameAr,
      required super.kitchenNameEn,
      required super.kitchenDescription,
      required super.kitchenImage,
      required super.kitchenAddress,
      required super.orderTime,
      required super.kitchenRating,
      required super.categoryId});

  static KitchenModel fromJson(Map<String, dynamic> jsonObject) {
    return KitchenModel(
        kitchenId: jsonObject['id'],
        kitchenNameAr: jsonObject['title_ar'],
        kitchenNameEn: jsonObject['title_en'],
        kitchenDescription: jsonObject['description'],
        kitchenImage: jsonObject['img'],
        kitchenAddress: jsonObject['location'],
        orderTime: jsonObject['orderTime'],
        kitchenRating: jsonObject['rating'].toDouble(),
        categoryId: jsonObject['cat_id']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': kitchenId,
      'title_ar': kitchenNameAr,
      'title_en': kitchenNameEn,
      'description': kitchenDescription,
      'img': kitchenImage,
      'location': kitchenAddress,
      'orderTime': orderTime,
      'rating': kitchenRating,
      'cat_id': categoryId
    };
  }
}
