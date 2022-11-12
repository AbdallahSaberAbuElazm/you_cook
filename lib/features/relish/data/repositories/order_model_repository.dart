import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/network/network.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:you_cook/core/util/return_data_source.dart';
import 'package:you_cook/features/relish/data/data_sources/order_remote_data_source.dart';
import 'package:you_cook/features/relish/data/models/order_model.dart';
import 'package:you_cook/features/relish/domain/repositories/oder_repository.dart';
import 'package:you_cook/features/relish/domain/entities/order.dart';

class OrderModelRepository implements OrderRepository {
  final OrderRemoteDataSourceImpl orderRemoteDataSource;
  final NetworkInfo networkInfo;
  OrderModelRepository(this.orderRemoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<Orders>>> getAllOrders() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await orderRemoteDataSource.getAllOrder());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addOrder({required Orders order}) {
    return ReturnDataSource.getReturnMessage(
        func: () => orderRemoteDataSource.addOrder(
            orderModel: OrderModel(
                userId: order.userId,
                addressId: order.addressId,
                cartId: order.cartId,
                status: order.status,
                type: order.type,
                price: order.price,
                discount: order.discount,
                deliveryPrice: order.deliveryPrice,
                totalPrice: order.deliveryPrice,
                deposit: order.deposit,
                isDeposit: order.isDeposit,
                deliveryMethod: order.deliveryMethod,
                paymentMethod: order.paymentMethod)),
        networkInfo: networkInfo);
  }

  @override
  Future<Either<Failure, Unit>> deleteOrder({required int orderId}) async {
    return await ReturnDataSource.getReturnMessage(
        func: () => orderRemoteDataSource.deleteOrder(orderId: orderId),
        networkInfo: networkInfo);
  }
}
