import 'package:you_cook/features/relish/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.productId,
      required super.productNameAr,
      required super.productNameEn,
      required super.productDescriptionAr,
      required super.productDescriptionEn,
      required super.productImage,
      required super.productPrice,
      required super.priceIncludeTax,
      super.productQuantity,
      required super.kitchenId,
      required super.sales});

  static ProductModel fromJson(Map<String, dynamic> jsonObject) {
    return ProductModel(
        productId: jsonObject['id'],
        productNameAr: jsonObject['title_ar'],
        productNameEn: jsonObject['title_en'],
        productDescriptionAr: jsonObject['description_ar'],
        productDescriptionEn: jsonObject['description_en'],
        productImage: jsonObject['img'],
        productPrice: jsonObject['price'].toDouble(),
        priceIncludeTax: jsonObject['price_include_tax'].toDouble(),
        productQuantity: jsonObject['qty'],
        kitchenId: jsonObject['kitchen_id'],
        sales: jsonObject['sales']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': productId,
      'title_ar': productNameAr,
      'title_en': productNameEn,
      'description_ar': productDescriptionAr,
      'description_en': productDescriptionEn,
      'img': productImage,
      'price': productPrice,
      'price_include_tax': priceIncludeTax,
      'qty': productQuantity,
      'kitchen_id': kitchenId,
    };
  }
}
