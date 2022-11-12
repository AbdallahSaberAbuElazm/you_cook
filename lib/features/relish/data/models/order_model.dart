import 'package:you_cook/features/relish/domain/entities/order.dart';

class OrderModel extends Orders {
  OrderModel(
      {required super.userId,
      required super.addressId,
      required super.cartId,
      required super.status,
      required super.type,
      required super.price,
      required super.discount,
      required super.deliveryPrice,
      required super.totalPrice,
      required super.deposit,
      required super.isDeposit,
      required super.deliveryMethod,
      required super.paymentMethod});

  static OrderModel fromJson(Map<String, dynamic> jsonObject) {
    return OrderModel(
      userId: jsonObject['user'],
      // couponId: jsonObject['id'],
      addressId: jsonObject['address'],
      cartId: jsonObject['cart_id'],
      status: jsonObject['status'],
      type: jsonObject['type'],
      price: jsonObject['price'],
      discount: jsonObject['discount'],
      deliveryPrice: jsonObject['delivery_price'],
      totalPrice: jsonObject['total_price'],
      deposit: jsonObject['deposit'],
      isDeposit: jsonObject['is_deposit'],
      deliveryMethod: jsonObject['delivery_method'],
      paymentMethod: jsonObject['payment_method'],
    );
  }
}
