import 'package:equatable/equatable.dart';

class Favourite extends Equatable {
  // final int favouriteId;
  final int userId;
  final int productId;
  // final int kitchenId;

  const Favourite({
    // required this.favouriteId,
    required this.userId,
    required this.productId,
    // required this.kitchenId
  });

  @override
  List<Object?> get props => [
        // favouriteId,
        userId,
        productId,
      ];
}
