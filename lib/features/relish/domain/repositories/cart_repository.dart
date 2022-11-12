import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> getAllCarts();
  Future<Either<Failure, Cart>> getSpecificCart({required int cartId});
  Future<Either<Failure, Unit>> addCart({required Cart cart});
  Future<Either<Failure, Unit>> deleteCart({required int cartId});
}
