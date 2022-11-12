import 'package:you_cook/features/relish/domain/entities/cart_items.dart';

class CartItemsModel extends CartItems {
  CartItemsModel(
      {required super.cartItemId,
      required super.product,
      required super.price,
      super.quantity});

  static CartItemsModel fromJson(Map<String, dynamic> objectJson) {
    return CartItemsModel(
        cartItemId: objectJson['id'],
        product: objectJson['product'],
        price: objectJson['price'],
        quantity: objectJson['qty']);
  }
}
