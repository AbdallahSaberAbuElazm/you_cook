import 'package:equatable/equatable.dart';
import 'package:you_cook/features/relish/domain/entities/product.dart';

class CartItems extends Equatable {
  final int cartItemId;
  final Product product;
  final double price;
  int? quantity;

  CartItems(
      {required this.cartItemId,
      required this.product,
      required this.price,
      this.quantity});

  @override
  List<Object?> get props => [cartItemId, product, price, quantity];
}
