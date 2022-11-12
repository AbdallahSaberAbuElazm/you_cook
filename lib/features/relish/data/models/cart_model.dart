import 'package:you_cook/features/relish/domain/entities/cart.dart';

class CartModel extends Cart {
  CartModel(
      {super.cartId,
      required super.price,
      required super.discount,
      required super.totalPrice,
      required super.deliveryMethod,
      required super.cartItems});

  static CartModel fromJson(Map<String, dynamic> jsonObject) {
    return CartModel(
      cartItems: jsonObject['items'],
      cartId: jsonObject['id'],
      price: jsonObject['price'],
      discount: jsonObject['discount'],
      totalPrice: jsonObject['total_price'],
      deliveryMethod: jsonObject['delivery_method'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': cartId,
      'price': price,
      'discount': discount,
      'total_price': totalPrice,
      'delivery_method': deliveryMethod,
    };
  }
}
