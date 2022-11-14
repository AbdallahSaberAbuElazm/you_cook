import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/favourite.dart';

abstract class FavouriteRepository {
  Future<Either<Failure, List<Favourite>>> getAllFavourites();
  Future<Either<Failure, Unit>> addFavourite({required Favourite favourite});
  Future<Either<Failure, Unit>> deleteFavourite({required int productId});
}
