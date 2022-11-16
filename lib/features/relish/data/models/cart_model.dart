import 'package:you_cook/features/relish/data/models/cart_items_model.dart';
import 'package:you_cook/features/relish/domain/entities/cart.dart';

class CartModel extends Cart {
  CartModel({
    super.cartId,
    required super.price,
    required super.discount,
    required super.totalPrice,
    required super.cartItems,
  });

  static CartModel fromJson(Map<String, dynamic> jsonObject) {
    return CartModel(
      cartItems: jsonObject['items']
          .map<CartItemsModel>(
              (cartItems) => CartItemsModel.fromJson(cartItems))
          .toList(),
      cartId: jsonObject['cart_id'],
      price: jsonObject['price'].toDouble(),
      discount: jsonObject['discount'],
      totalPrice: jsonObject['total_price'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': cartId,
      'price': price,
      'discount': discount,
      'total_price': totalPrice,
    };
  }
}
