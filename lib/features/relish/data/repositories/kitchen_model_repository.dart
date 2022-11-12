import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/network/network.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:you_cook/features/relish/data/data_sources/kitchen_remote_data_source.dart';
import 'package:you_cook/features/relish/domain/entities/kitchen.dart';
import 'package:you_cook/features/relish/domain/repositories/kitchen_repository.dart';

class KitchenModelRepository implements KitchenRepository {
  final KitchenRemoteDataSourceImpl kitchenRemoteDataSource;
  final NetworkInfo networkInfo;
  KitchenModelRepository(this.kitchenRemoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<Kitchen>>> getAllKitchens() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await kitchenRemoteDataSource.getAllKitchen());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
