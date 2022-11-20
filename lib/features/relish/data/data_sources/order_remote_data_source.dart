import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/util/hive_boxes.dart';
import 'package:you_cook/features/relish/data/models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getAllOrder();
  Future<Unit> addOrder({required OrderModel orderModel});
  Future<Unit> deleteOrder({required int orderId});
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final http.Client client;
  OrderRemoteDataSourceImpl({required this.client});
  @override
  Future<List<OrderModel>> getAllOrder() async {
    var response = await client.get(Uri.parse(ApiUrl.ORDERS_URL), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${HiveBoxes.getUserToken()}',
    });
    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      List<OrderModel> orders = body['data'].map<OrderModel>((orderModel) {
        return OrderModel.fromJson(orderModel);
      }).toList();
      return orders;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addOrder({required OrderModel orderModel}) async {
    final body = {
      'user': orderModel.userId,
      'address': orderModel.addressId,
      'cart_id': orderModel.cartId,
      'status': orderModel.status,
      'type': orderModel.type,
      'price': orderModel.price,
      'discount': orderModel.discount,
      'total_price': orderModel.totalPrice,
      'deposit': orderModel.deposit,
      'is_deposit': orderModel.isDeposit,
      'delivery_price': orderModel.deliveryPrice,
      'delivery_method': orderModel.deliveryMethod,
      'payment_method': orderModel.paymentMethod,
    };

    final response = await client.post(Uri.parse(ApiUrl.SEND_ORDER_URL),
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${HiveBoxes.getUserToken()}',
        });
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteOrder({required int orderId}) async {
    final response = await client.delete(
        Uri.parse('${ApiUrl.ORDERS_URL}/${orderId.toString()}/delete'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${HiveBoxes.getUserToken()}',
        });
    return _checkStatusCodeForDeleteUpdatePosts(response);
  }

  Future<Unit> _checkStatusCodeForDeleteUpdatePosts(http.Response response) {
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
