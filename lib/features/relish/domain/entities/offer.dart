import 'package:equatable/equatable.dart';

class Offer extends Equatable {
  final int offerId;
  final int kitchenId;
  final String offerTitle;
  final String offerImage;
  final String offerDescription;
  final double discount;
  final int productId;

  const Offer(
      {required this.offerId,
      required this.kitchenId,
      required this.offerTitle,
      required this.offerImage,
      required this.offerDescription,
      required this.discount,
      required this.productId});

  @override
  List<Object?> get props => [
        offerId,
        kitchenId,
        offerTitle,
        offerImage,
        offerDescription,
        discount,
        productId
      ];
}
