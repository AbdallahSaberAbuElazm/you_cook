import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/network/network.dart';
import 'package:you_cook/core/util/return_data_source.dart';
import 'package:you_cook/features/relish/data/data_sources/cart_remote_data_source.dart';
import 'package:you_cook/features/relish/data/models/cart_items_model.dart';
import 'package:you_cook/features/relish/data/models/cart_model.dart';
import 'package:you_cook/features/relish/domain/entities/cart.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:you_cook/features/relish/domain/repositories/cart_repository.dart';

class CartModelRepository implements CartRepository {
  final CartRemoteDataSourceImpl cartRemoteDataSource;
  final NetworkInfo networkInfo;
  CartModelRepository(
      {required this.cartRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Cart>>> getAllCarts() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await cartRemoteDataSource.getAllCart());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addCart({required Cart cart}) async {
    return await ReturnDataSource.getReturnMessage(
        func: () => cartRemoteDataSource.addCart(
                cart: CartModel(
              price: cart.price,
              discount: cart.discount,
              totalPrice: cart.totalPrice,
              deliveryMethod: cart.deliveryMethod,
              cartItems: cart.cartItems,
            )),
        networkInfo: networkInfo);
  }

  @override
  Future<Either<Failure, Unit>> deleteCart({required int cartId}) async {
    return await ReturnDataSource.getReturnMessage(
        func: () => cartRemoteDataSource.deleteCart(cartId: cartId),
        networkInfo: networkInfo);
  }

  @override
  Future<Either<Failure, Cart>> getSpecificCart({required int cartId}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(
            await cartRemoteDataSource.getSpecificCart(cartId: cartId));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
