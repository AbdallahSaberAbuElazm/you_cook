import 'package:equatable/equatable.dart';

class Orders extends Equatable {
  int? orderId;
  final int userId;
  // final int couponId;
  final int addressId;
  int? cartId;
  final String status;
  final String type;
  final double price;
  final double discount;
  final double deliveryPrice;
  final double totalPrice;
  final double deposit;
  final bool isDeposit;
  final String deliveryMethod;
  final String paymentMethod;

  // final String rejectedReason;

  Orders({
    this.orderId,
    required this.userId,
    // required this.couponId,
    required this.addressId,
    this.cartId,
    required this.status,
    required this.type,
    required this.price,
    required this.discount,
    required this.deliveryPrice,
    required this.totalPrice,
    required this.deposit,
    required this.isDeposit,
    required this.deliveryMethod,
    required this.paymentMethod,
    // required this.rejectedReason,
  });

  @override
  List<Object?> get props => [
        userId,
        addressId,
        cartId,
        status,
        type,
        price,
        totalPrice,
        discount,
        deliveryPrice,
        totalPrice,
        deposit,
        isDeposit,
        deliveryMethod,
        paymentMethod,
        // rejectedReason
      ];
}
