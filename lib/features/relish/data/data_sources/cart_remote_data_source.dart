import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/util/hive_boxes.dart';
import 'package:you_cook/core/util/return_data_source.dart';
import 'package:you_cook/features/relish/data/models/cart_items_model.dart';
import 'package:you_cook/features/relish/data/models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getAllUserCart();
  Future<CartModel> getSpecificCart({required int cartId});
  Future<Unit> addCart({required CartItemsModel cartItem});
  Future<Unit> deleteCart({required int cartItemsId});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final http.Client client;
  CartRemoteDataSourceImpl({required this.client});

  @override
  Future<CartModel> getAllUserCart() async {
    var response = await client.get(Uri.parse(ApiUrl.CART_URL), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${HiveBoxes.getUserToken()}',
    });
    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      List<CartItemsModel> cartItems = body['data']['items']
          .map<CartItemsModel>(
              (cartItems) => CartItemsModel.fromJson(cartItems))
          .toList();
      // print(CartModel.fromJson({
      //   'items': cartItems,
      //   'cart_id': body['data']['cart_id'],
      //   'price': body['data']['price'],
      //   'discount': body['data']['discount'],
      //   'total_price': body['data']['total_price'],
      // }));
      return CartModel.fromJson({
        'items': cartItems,
        'cart_id': body['data']['cart_id'],
        'price': body['data']['price'],
        'discount': body['data']['discount'],
        'total_price': body['data']['total_price'],
      });
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addCart({
    required CartItemsModel cartItem,
  }) async {
    final body = {
      'price': cartItem.price,
      // 'discount': cartItem.discount,
      // 'total_price': cartItem.totalPrice,
      'qty': cartItem.quantity,
      'product_id': cartItem.product.productId,
    };

    final response = await client
        .post(Uri.parse(ApiUrl.CART_URL), body: json.encode(body), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${HiveBoxes.getUserToken()}',
    });
    return await ReturnDataSource.checkStatusCodeForDeleteUpdateData(
        response: response, statusCode: 200);
  }

  @override
  Future<Unit> deleteCart({required int cartItemsId}) async {
    final response = await client.delete(
        Uri.parse('${ApiUrl.CART_URL}/${cartItemsId.toString()}/delete'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${HiveBoxes.getUserToken()}',
        });
    return ReturnDataSource.checkStatusCodeForDeleteUpdateData(
        response: response, statusCode: 200);
  }

  @override
  Future<CartModel> getSpecificCart({required int cartId}) async {
    final response = await client
        .get(Uri.parse('${ApiUrl.GET_CART_CONTENT_URL}/$cartId'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${HiveBoxes.getUserToken()}',
    });

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return CartModel.fromJson(body['data']);
    } else {
      throw ServerException();
    }
  }
}
