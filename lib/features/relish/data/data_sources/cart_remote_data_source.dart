import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/util/return_data_source.dart';
import 'package:you_cook/features/relish/data/models/cart_model.dart';
import 'package:you_cook/features/relish/data/models/category_model.dart';

abstract class CartRemoteDataSource {
  Future<List<CartModel>> getAllCart();
  Future<CartModel> getSpecificCart({required int cartId});
  Future<Unit> addCart({required CartModel cart});
  Future<Unit> deleteCart({required int cartId});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final http.Client client;
  CartRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CartModel>> getAllCart() async {
    var response = await client.get(Uri.parse(ApiUrl.ALL_CART_URL));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      List<CartModel> carts = body['data'].map<CartModel>((categoryModel) {
        return CategoryModel.fromJson(categoryModel);
      }).toList();
      return carts;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addCart({required CartModel cart}) async {
    final body = {
      'items': cart.cartItems,
      'price': cart.price,
      'discount': cart.discount,
      'total_price': cart.totalPrice,
      'delivery_method': cart.totalPrice,
    };

    final response = await client.post(Uri.parse(ApiUrl.ALL_CART_URL),
        body: json.encode(body));
    return ReturnDataSource.checkStatusCodeForDeleteUpdateData(
        response: response, statusCode: 201);
  }

  @override
  Future<Unit> deleteCart({required int cartId}) async {
    final response = await client.delete(
        Uri.parse('${ApiUrl.DELETE_CART_URL}/${cartId.toString()}/delete'),
        headers: {'Content-Type': 'application/json'});
    return ReturnDataSource.checkStatusCodeForDeleteUpdateData(
        response: response, statusCode: 200);
  }

  @override
  Future<CartModel> getSpecificCart({required int cartId}) async {
    final response = await client.get(Uri.parse(ApiUrl.CART_CONTENT_URL));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return CartModel.fromJson(body['data']);
    } else {
      throw ServerException();
    }
  }
}
