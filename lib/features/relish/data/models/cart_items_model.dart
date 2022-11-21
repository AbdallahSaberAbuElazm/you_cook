import 'package:you_cook/features/relish/data/models/product_model.dart';
import 'package:you_cook/features/relish/domain/entities/cart_items.dart';

class CartItemsModel extends CartItems {
  CartItemsModel(
      {super.cartItemId,
      required super.product,
      // required super.discount,
      required super.price,
      // required super.totalPrice,
      super.quantity,
      super.status});

  static CartItemsModel fromJson(Map<String, dynamic> objectJson) {
    return CartItemsModel(
      cartItemId: objectJson['id'],
      product: ProductModel.fromJson(objectJson['product']),
      price: objectJson['price'].toDouble(),
      // discount: objectJson['discount'],
      // totalPrice: objectJson['total_price'],
      quantity: objectJson['qty'],
      status: objectJson['status'],
    );
  }
}
