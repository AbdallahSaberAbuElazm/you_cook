import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/network/network.dart';
import 'package:you_cook/core/util/return_data_source.dart';
import 'package:you_cook/features/relish/data/data_sources/cart_remote_data_source.dart';
import 'package:you_cook/features/relish/data/models/cart_items_model.dart';
import 'package:you_cook/features/relish/domain/entities/cart.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:you_cook/features/relish/domain/entities/cart_items.dart';
import 'package:you_cook/features/relish/domain/repositories/cart_repository.dart';

class CartModelRepository implements CartRepository {
  final CartRemoteDataSourceImpl cartRemoteDataSource;
  final NetworkInfo networkInfo;
  CartModelRepository(
      {required this.cartRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Cart>> getAllCarts() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await cartRemoteDataSource.getAllUserCart());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addCart({required CartItems cartItem}) async {
    return await ReturnDataSource.getReturnMessage(
        func: () => cartRemoteDataSource.addCart(
              cartItem: CartItemsModel(
                  price: cartItem.price,
                  // discount: cartItem.discount,
                  // totalPrice: cartItem.totalPrice,
                  cartItemId: cartItem.cartItemId,
                  product: cartItem.product,
                  quantity: cartItem.quantity),
            ),
        networkInfo: networkInfo);
  }

  @override
  Future<Either<Failure, Unit>> deleteCartItem({required int cartId}) async {
    return await ReturnDataSource.getReturnMessage(
        func: () => cartRemoteDataSource.deleteCart(cartItemsId: cartId),
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
