import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:you_cook/core/network/network.dart';
import 'package:you_cook/core/util/return_data_source.dart';
import 'package:you_cook/features/relish/data/data_sources/favourite_remote_data_source.dart';
import 'package:you_cook/features/relish/data/models/favourite_model.dart';
import 'package:you_cook/features/relish/domain/entities/favourite.dart';
import 'package:you_cook/features/relish/domain/repositories/favourite_repository.dart';

class FavouriteModelRepository extends FavouriteRepository {
  final FavouriteRemoteDataSourceImpl favouriteRemoteDataSourceImpl;
  final NetworkInfo networkInfo;
  FavouriteModelRepository(
      {required this.favouriteRemoteDataSourceImpl, required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> addFavourite(
      {required Favourite favourite}) async {
    return await ReturnDataSource.getReturnMessage(
        func: () => favouriteRemoteDataSourceImpl.addFavourite(
                favouriteModel: FavouriteModel(
              // favouriteId: favourite.favouriteId,
              userId: favourite.userId,
              productId: favourite.productId,
              // kitchenId: favourite.kitchenId,
            )),
        networkInfo: networkInfo);
  }

  @override
  Future<Either<Failure, Unit>> deleteFavourite(
      {required int productId}) async {
    return await ReturnDataSource.getReturnMessage(
        func: () =>
            favouriteRemoteDataSourceImpl.deleteFavourite(productId: productId),
        networkInfo: networkInfo);
  }

  @override
  Future<Either<Failure, List<Favourite>>> getAllFavourites() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await favouriteRemoteDataSourceImpl.getAllFavourites());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
