import 'package:equatable/equatable.dart';
import 'package:you_cook/features/relish/domain/entities/cart_items.dart';

class Cart extends Equatable {
  int? cartId;
  final double price;
  final double discount;
  final double totalPrice;
  final String deliveryMethod;
  final List<CartItems> cartItems;

  Cart(
      {this.cartId,
      required this.price,
      required this.discount,
      required this.totalPrice,
      required this.deliveryMethod,
      required this.cartItems});

  @override
  List<Object?> get props =>
      [cartId, price, discount, totalPrice, deliveryMethod, cartItems];
}
