import 'package:equatable/equatable.dart';
import 'package:you_cook/features/relish/domain/entities/product.dart';

class CartItems extends Equatable {
  int? cartItemId = 0;
  final Product product;
  final double price;
  // final double discount;
  // final double totalPrice;
  int? quantity;

  CartItems(
      {this.cartItemId,
      required this.product,
      required this.price,
      // required this.discount,
      // required this.totalPrice,
      this.quantity});

  @override
  List<Object?> get props => [
        cartItemId, product, price,
        //  discount,
        //  totalPrice,
        quantity
      ];
}
