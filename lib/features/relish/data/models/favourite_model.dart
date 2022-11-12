import 'package:you_cook/features/relish/domain/entities/favourite.dart';

class FavouriteModel extends Favourite {
  const FavouriteModel({
    // required super.favouriteId,
    required super.userId,
    required super.productId,
    // required super.kitchenId,
  });

  static FavouriteModel fromJson(Map<String, dynamic> jsonObject) {
    return FavouriteModel(
      // favouriteId: jsonObject['id'],
      userId: jsonObject['user_id'],
      productId: jsonObject['product_id'],
      // kitchenId: jsonObject['kitchen_id'],
    );
  }
}
