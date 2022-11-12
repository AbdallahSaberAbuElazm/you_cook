import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/network/network.dart';
import 'package:you_cook/features/relish/data/data_sources/category_remote_data_source.dart';
import 'package:you_cook/features/relish/domain/entities/category.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:you_cook/features/relish/domain/repositories/category_repository.dart';

class CategoryModelRepository implements CategoryRepository {
  final CategoryRemoteDataSourceImpl categoryRemoteDataSource;
  final NetworkInfo networkInfo;
  CategoryModelRepository(
      {required this.categoryRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await categoryRemoteDataSource.getAllCateogry());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
