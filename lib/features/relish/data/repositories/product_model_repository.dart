import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/network/network.dart';
import 'package:you_cook/features/relish/data/data_sources/product_remote_data_source.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:you_cook/features/relish/domain/entities/product.dart';
import 'package:you_cook/features/relish/domain/repositories/product_repository.dart';

class ProductModelRepository implements ProductRepository {
  final ProductRemoteDataSourceImpl productRemoteDataSource;
  final NetworkInfo networkInfo;
  ProductModelRepository(this.productRemoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await productRemoteDataSource.getAllProducts());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
