import 'package:equatable/equatable.dart';

class Kitchen extends Equatable {
  final int kitchenId;
  final String kitchenNameAr;
  final String kitchenNameEn;
  final String kitchenDescription;
  final String kitchenImage;
  final String kitchenAddress;
  final String orderTime;
  final double kitchenRating;
  final int categoryId;

  const Kitchen(
      {required this.kitchenId,
      required this.kitchenNameAr,
      required this.kitchenNameEn,
      required this.kitchenDescription,
      required this.kitchenImage,
      required this.kitchenAddress,
      required this.orderTime,
      required this.kitchenRating,
      required this.categoryId});
  @override
  List<Object?> get props => [
        kitchenId,
        kitchenNameAr,
        kitchenNameEn,
        kitchenDescription,
        kitchenImage,
        kitchenAddress,
        orderTime,
        kitchenRating,
        categoryId
      ];
}
