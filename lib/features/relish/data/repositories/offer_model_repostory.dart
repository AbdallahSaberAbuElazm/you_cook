import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/network/network.dart';
import 'package:you_cook/features/relish/data/data_sources/offer_remote_data_source.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:you_cook/features/relish/domain/entities/offer.dart';
import 'package:you_cook/features/relish/domain/repositories/offer_repository.dart';

class OfferModelRepository implements OfferRepository {
  final OfferRemoteDataSourceImpl offerRemoteDataSource;
  final NetworkInfo networkInfo;
  OfferModelRepository(this.offerRemoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<Offer>>> getAllOffers() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await offerRemoteDataSource.getAllOffer());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
