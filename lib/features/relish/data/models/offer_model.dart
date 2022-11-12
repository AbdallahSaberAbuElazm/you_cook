import 'package:you_cook/features/relish/domain/entities/offer.dart';

class OfferModel extends Offer {
  const OfferModel(
      {required super.offerId,
      required super.kitchenId,
      required super.offerTitle,
      required super.offerImage,
      required super.offerDescription,
      required super.discount,
      required super.productId});

  static OfferModel fromJson(Map<String, dynamic> jsonObject) {
    return OfferModel(
      offerId: jsonObject['id'],
      kitchenId: jsonObject['kitchen_id'],
      offerTitle: jsonObject['title'],
      offerImage: jsonObject['img'],
      offerDescription: jsonObject['description'],
      discount: double.parse(jsonObject['discount']),
      productId: int.parse(jsonObject['product_id']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': offerId,
      'kitchen_id': kitchenId,
      'title': offerTitle,
      'description': offerDescription,
      'img': offerImage,
      'discount': discount,
      'product_id': productId,
    };
  }
}
