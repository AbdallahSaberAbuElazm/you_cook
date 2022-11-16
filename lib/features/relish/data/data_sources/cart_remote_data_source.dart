import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/util/hive_boxes.dart';
import 'package:you_cook/core/util/return_data_source.dart';
import 'package:you_cook/features/relish/data/models/cart_items_model.dart';
import 'package:you_cook/features/relish/data/models/cart_model.dart';
import 'package:you_cook/features/relish/data/models/category_model.dart';
import 'package:you_cook/features/relish/domain/entities/cart_items.dart';

abstract class CartRemoteDataSource {
  Future<List<CartModel>> getAllUserCart();
  Future<CartModel> getSpecificCart({required int cartId});
  Future<Unit> addCart({required CartItemsModel cartItem});
  Future<Unit> deleteCart({required int cartItemsId});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final http.Client client;
  CartRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CartModel>> getAllUserCart() async {
    var response = await client.get(Uri.parse(ApiUrl.CART_URL), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${HiveBoxes.getUserToken()}',
    });
    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      print('body of cart is ${body['data']['items']}');
      List<CartItemsModel> cartItems = body['data']['items']
          .map<CartItemsModel>(
              (cartItems) => CartItemsModel.fromJson(cartItems))
          .toList();
      print('cartitems is $cartItems');
      List<CartModel> carts =
          body['data'].map<CartModel>((Map<String, dynamic> cartModel) {
        return CartModel.fromJson({
          'items': cartModel['items'],
          'cart_id': cartModel['cart_id'],
          'price': cartModel['price'],
          'discount': cartModel['discount'],
          'total_price': cartModel['total_price'],
        });
      }).toList();
      // print('carts list is $carts');
      // print('body of cart model is ${carts.map((e) => e.cartItems)}');
      return carts;
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
