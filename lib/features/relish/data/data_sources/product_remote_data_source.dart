import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/features/relish/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});
  @override
  Future<List<ProductModel>> getAllProducts() async {
    var response = await client.get(Uri.parse(ApiUrl.PRODUCTS_URL));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List<ProductModel> products = body['products']
          .map<ProductModel>(
              (productModel) => ProductModel.fromJson(productModel))
          .toList();
      return products;
    } else {
      throw ServerException();
    }
  }
}
