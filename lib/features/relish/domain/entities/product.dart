import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int productId;
  final String productNameAr;
  final String productNameEn;
  final String productDescriptionAr;
  final String productDescriptionEn;
  final String productImage;
  final double productPrice;
  final double priceIncludeTax;
  int? productQuantity = 1;
  final int kitchenId;
  final int sales;

  Product(
      {required this.productId,
      required this.productNameAr,
      required this.productNameEn,
      required this.productDescriptionAr,
      required this.productDescriptionEn,
      required this.productImage,
      required this.productPrice,
      required this.priceIncludeTax,
      this.productQuantity,
      required this.kitchenId,
      required this.sales});

  @override
  List<Object?> get props => [
        productId,
        productNameAr,
        productNameEn,
        productDescriptionAr,
        productDescriptionEn,
        productPrice,
        priceIncludeTax,
        productImage,
        productQuantity,
        kitchenId,
        sales
      ];
}
