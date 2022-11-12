import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/order.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<Orders>>> getAllOrders();
  Future<Either<Failure, Unit>> addOrder({required Orders order});
  Future<Either<Failure, Unit>> deleteOrder({required int orderId});
}
